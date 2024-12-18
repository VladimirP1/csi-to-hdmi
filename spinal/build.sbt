import sbt.Def

ThisBuild / version := "1.0"
ThisBuild / scalaVersion := "2.13.14"
ThisBuild / organization := "org.example"

val spinalVersion = "1.10.2a"
val spinalCore = "com.github.spinalhdl" %% "spinalhdl-core" % spinalVersion
val spinalLib = "com.github.spinalhdl" %% "spinalhdl-lib" % spinalVersion
val spinalIdslPlugin = compilerPlugin("com.github.spinalhdl" %% "spinalhdl-idsl-plugin" % spinalVersion)
val crcLib = "com.github.snksoft" % "crc" % "1.1.0"


lazy val genVerilog = taskKey[Unit]("Generate Verilog")

lazy val projectname = (project in file("."))
  .settings(
    Compile / scalaSource := baseDirectory.value / "hw" / "spinal",
    Compile / unmanagedSourceDirectories += baseDirectory.value / "experiments" / "scala",
    libraryDependencies ++= Seq(spinalCore, spinalLib, spinalIdslPlugin, crcLib),
    genVerilog := runClasses(
      List(
        "qspi_io.QSpiIOVerilog",
        "qspi_io.LfsrVerilog",
        "qspi_io.FakeFrameVerilog",
        "qspi_io.bus.QBusArbiterVerilog",
      )
    ).value
  )

fork := true

def runClasses(deps: List[String]): Def.Initialize[Task[Unit]] =
  Def.taskDyn {
    var pTask = Def.task {}
    for (dep <- deps) {
      pTask = Def.task {
        pTask.value
        (Compile / runMain).toTask(" " + dep).value
      }
    }
    pTask
  }
