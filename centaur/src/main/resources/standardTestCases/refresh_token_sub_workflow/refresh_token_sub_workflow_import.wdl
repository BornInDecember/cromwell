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
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow wf_hello {
  String wfIFile
  
  call hello {input: iFile = wfIFile }
  
  output {
    String salutation = hello.salutation
  }
}
