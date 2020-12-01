task hello {
  Boolean addressee
  command {
    echo "Hello ${addressee}!"
  }
  runtime {
      docker: "marketplace.gcr.io/google/ubuntu1804:latest"
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
