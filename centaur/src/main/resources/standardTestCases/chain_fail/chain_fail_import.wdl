task hello {
  Boolean addressee
  command {
    echo "Hello ${addressee}!"
  }
  runtime {
      docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
  output {
    String salutation = read_string(stdout())
  }
}

workflow wf_hello {
  Boolean wf_hello_input = true
  
  call hello { input: addressee = wf_hello_input }
  
  output {
    String salutation = hello.salutation
  }
}
