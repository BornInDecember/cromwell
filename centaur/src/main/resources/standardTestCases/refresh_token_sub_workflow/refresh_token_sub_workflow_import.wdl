task hello {
  File iFile
  String addressee = read_string(iFile)
  command {
    echo "Hello ${addressee}!"
  }
  output {
    String salutation = read_string(stdout())
  }
  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }
}

workflow wf_hello {
  String wfIFile
  
  call hello {input: iFile = wfIFile }
  
  output {
    String salutation = hello.salutation
  }
}
