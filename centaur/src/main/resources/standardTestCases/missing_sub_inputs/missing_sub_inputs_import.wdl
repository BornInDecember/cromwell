task head {
  File inputFile

  command {
     head ${inputFile}
  }
  output {
    String headOut = read_string(stdout())
  }
  runtime { docker: "marketplace.gcr.io/google/ubuntu1804:latest" }
}

workflow missing_inputs_sub_wf {
    File f
    call head { input: inputFile = f }
    output {
      head.headOut
    }
}
