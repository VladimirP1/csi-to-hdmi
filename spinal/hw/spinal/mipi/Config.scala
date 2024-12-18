package mipi

import spinal.core._
import spinal.core.sim._

case class Config(val prefix: String = "") {
  def spinal = SpinalConfig(
    globalPrefix = prefix,
    targetDirectory = "../src/",
    defaultConfigForClockDomains = ClockDomainConfig(
      resetKind = ASYNC,
      resetActiveLevel = HIGH
    ),
    headerWithDate = true,
    onlyStdLogicVectorAtTopLevelIo = true
  )

  def sim = SimConfig.withConfig(spinal).withFstWave
}
