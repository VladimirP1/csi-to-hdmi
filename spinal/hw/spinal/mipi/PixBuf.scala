package mipi

import spinal.core.Component.push
import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.fsm._
import spinal.lib.sim._

import scala.language.postfixOps

case class Scan(
    active: Int,
    frontPorch: Int,
    sync: Int,
    backPorch: Int,
    isSyncPos: Boolean
) {
  def syncStart: Int = frontPorch
  def syncEnd: Int = syncStart + sync
  def activeStart: Int = syncEnd + backPorch
  def total = activeStart + active
}
case class ModeLine(
    hScan: Scan,
    vScan: Scan
)

case class HVE() extends Bundle {
  val hsync = Bool()
  val vsync = Bool()
  val visible = Bool()
}

case class GenHve(mode: ModeLine) extends Component {
  val io = new Bundle {
    val hve = out(HVE())
    val last = out Bool ()
    val clear = in Bool ()
  }

  def genScan(s: Scan, inc: Bool, rst: Bool) = new Area {
    val cnt = Counter(s.total, inc)
    val ovf = cnt.willOverflow
    val sync = (cnt >= s.syncStart && cnt < s.syncEnd) ^ Bool(s.isSyncPos)
    val active = cnt >= s.activeStart
    when(rst) { cnt.clear() }
  }

  val hSync = genScan(mode.hScan, True, io.clear)
  val vSync = genScan(mode.vScan, hSync.ovf, io.clear)

  io.hve.hsync := hSync.sync
  io.hve.vsync := vSync.sync
  io.hve.visible := hSync.active && vSync.active
  io.last := vSync.ovf
}

object DdrCmd extends SpinalEnum(defaultEncoding = binarySequential) {
  val WRITE, READ = newElement()
}

case class DdrCmdAdr() extends Bundle {
  val cmd = DdrCmd()
  val adr = UInt(28 bits)
}

case class PixBuf() extends Component {
  val io = new Bundle {
    // CSI
    val csiClk = in Bool ()
    val sof = in Bool ()
    val lpMatched = in Bool ()
    val pixData = slave Flow Bits(32 bits)
    // DDR
    val ddrCmd = master Stream DdrCmdAdr()
    val ddrWrite = master Stream Bits(128 bits)
    val ddrRead = slave Flow Bits(128 bits)
    val ddrInitComplete = in Bool ()
    // HDMI
    val hdmiClk = in Bool ()
    val hve = out(HVE())
    val pixel = out Bits (24 bits)
  }

  val csiDomain = ClockDomain(io.csiClk, reset = False)
  val hdmiDomain = ClockDomain(io.hdmiClk, reset = False)

  /* CSI CDC */
  val csiCC = new Area {
    val csiInWide = new ClockingArea(csiDomain) {
      val csiIn = Stream(Bits(32 bits))

      val filter = Reg(Bool())
      when(io.lpMatched) { filter := True } elsewhen !io.pixData.valid { filter := False }

      csiIn.valid := filter & io.pixData.valid
      csiIn.payload := io.pixData.payload

      val csiInWide = Stream(Bits(128 bits))
      StreamWidthAdapter(csiIn, csiInWide)
    }.csiInWide

    val csiWide = Stream(Bits(128 bits))
    StreamFifoCC(csiInWide, csiWide, 512, csiDomain, clockDomain)

    val f = new ClockingArea(csiDomain) {
      val f = Flow(NoData())
      f.valid := io.sof
    }.f
    val sof = FlowCCUnsafeByToggle(f, csiDomain, clockDomain).valid
  }

  /* DDR FSM */
  csiCC.csiWide.ready := False
  io.ddrCmd.valid := False
  io.ddrCmd.payload.assignDontCareToUnasigned()
  io.ddrWrite.valid := False
  io.ddrWrite.payload.assignDontCareToUnasigned()

  val readAdr = Reg(UInt(28 bits)) init 0
  val writeAdr = Reg(UInt(28 bits)) init 0

  /* Pixel data CDC */
  val hdmiPixCC = new ClockingArea(hdmiDomain) {
    val readStream = Stream(Fragment(Bits(128 bits)))
  }

  val lastFifo = StreamFifo(Bool(), 64, latency = 0)
  lastFifo.io.push.valid := False
  lastFifo.io.push.payload.assignDontCare()
  lastFifo.io.pop.ready := io.ddrRead.valid

  val readFifo = StreamFifoCC(
    io.ddrRead.toStream(null).addFragmentLast(lastFifo.io.pop.payload),
    hdmiPixCC.readStream,
    512,
    clockDomain,
    hdmiDomain
  )

  when(io.ddrInitComplete && io.ddrCmd.ready) {
    when(io.ddrWrite.ready && csiCC.csiWide.valid) {
      io.ddrCmd.valid := True
      io.ddrCmd.cmd := DdrCmd.WRITE
      io.ddrCmd.adr := writeAdr
      io.ddrWrite.valid := True
      io.ddrWrite.payload := csiCC.csiWide.payload
      csiCC.csiWide.ready := True
      writeAdr := writeAdr + 8
      when(writeAdr >= 1280 * 720 / 8 * 8 - 8) { writeAdr := 0 }

    } elsewhen (readFifo.io.pushOccupancy < 400) {
      io.ddrCmd.valid := True
      io.ddrCmd.cmd := DdrCmd.READ
      io.ddrCmd.adr := readAdr
      readAdr := readAdr + 8
      val isLast = readAdr >= 1280 * 720 / 8 * 8 - 8
      when(isLast) { readAdr := 0 }
      lastFifo.io.push.valid := True
      lastFifo.io.push.payload := isLast
    }
    when(csiCC.sof) { writeAdr := 0 }
  }

  /* HDMI */
  val hdmiArea = new ClockingArea(hdmiDomain) {
    val modeLine720p = ModeLine(
      hScan = Scan(active = 1280, frontPorch = 110, sync = 40, backPorch = 220, isSyncPos = true),
      vScan = Scan(active = 720, frontPorch = 5, sync = 5, backPorch = 20, isSyncPos = true)
    )

    val hve = GenHve(modeLine720p)

    val stream1 = Stream(Fragment(Bits(32 bits)))
    StreamFragmentWidthAdapter(hdmiPixCC.readStream, stream1)

    val outStream = Stream(Fragment(Bits(24 bits)))
    val yuvConv = Yuv422ToRgb()
    stream1 >> yuvConv.io.yuv
    yuvConv.io.rgb >> outStream

//    val outStream = Stream(Fragment(UInt(8 bits)))
//    StreamFragmentWidthAdapter(
//      stream1.map { x =>
//        val f = Fragment(UInt(16 bits))
//        f.last := x.last
//        f.fragment := Cat(x(24 until 32), x(8 until 16)).asUInt
//        f
//      },
//      outStream
//    )

    outStream.ready := io.hve.visible
    hve.io.clear := outStream.lastFire

    io.pixel := outStream.payload
    io.hve := hve.io.hve
  }

case class Yuv422ToRgb() extends Component {
  val io = new Bundle {
    val yuv = slave Stream Fragment((Bits(32 bits)))
    val rgb = master Stream Fragment((Bits(24 bits)))
  }
  val u0 = io.yuv.payload(0 until 8).asUInt
  val y0 = io.yuv.payload(8 until 16).asUInt
  val v0 = io.yuv.payload(16 until 24).asUInt
  val y1 = io.yuv.payload(24 until 32).asUInt

  val rgb0 = toRgb(y0, u0, v0)
  val rgb1 = toRgb(y1, u0, v0)
  val delay = LatencyAnalysis(u0, rgb0)
  val valid = Delay(io.yuv.valid, delay)
  val last = Delay(io.yuv.last, delay)

  val os = Stream(Fragment((Bits(48 bits))))
  os.valid := valid
  os.last := last
  os.fragment := Cat(rgb1, rgb0)
  val iq = os.queue(2 * delay)
  io.yuv.ready := iq.fire || !iq.valid
  val adapter = StreamFragmentWidthAdapter(iq, io.rgb)

  def toRgb(Y: UInt, U: UInt, V: UInt) = new Area {
    val R = RegNext(RegNext(RegNext(RegNext(Y))).intoSInt +| RegNext(RegNext(351 * RegNext(V.intoSInt - 128)) >> 8))
    val G = RegNext(
      RegNext(RegNext(RegNext(Y))).intoSInt -| RegNext(
        RegNext(179 * RegNext(V.intoSInt - 128) +| 86 * RegNext(U.intoSInt - 128)) >> 8
      )
    )
    val B = RegNext(RegNext(RegNext(RegNext(Y))).intoSInt +| RegNext(RegNext(443 * RegNext(U.intoSInt - 128)) >> 8))
    val rgb = Cat(B.resize(8), G.resize(8), R.resize(8))
  }.rgb
}

object GenHveVerilog extends App {
  val modeLine720p = ModeLine(
    hScan = Scan(active = 1280, frontPorch = 48, sync = 32, backPorch = 80, isSyncPos = true),
    vScan = Scan(active = 720, frontPorch = 3, sync = 5, backPorch = 13, isSyncPos = false)
  )
  Config("").spinal.generateVerilog(GenHve(modeLine720p))
}

object PixBufVerilog extends App {
  Config("").spinal.generateVerilog(PixBuf())
}

object GenHveSim extends App {
  val modeLine720p = ModeLine(
    hScan = Scan(active = 1280, frontPorch = 48, sync = 32, backPorch = 80, isSyncPos = true),
    vScan = Scan(active = 720, frontPorch = 3, sync = 5, backPorch = 13, isSyncPos = false)
  )
  Config().sim.compile(GenHve(modeLine720p)).doSim { dut =>
    dut.clockDomain.forkStimulus(10)

    clk(400000)
    simSuccess()

    def clk(n: Int = 3): Unit = for (_ <- 1 to n) dut.clockDomain.waitActiveEdge()
  }
}
