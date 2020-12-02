task head {
  File inputFile

  command {
     head ${inputFile}
  }
  output {
    String headOut = read_string(stdout())
  }
  runtime { docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests" }
}

workflow missing_inputs_sub_wf {
    File f
    call head { input: inputFile = f }
    output {
      head.headOut
    }
}
