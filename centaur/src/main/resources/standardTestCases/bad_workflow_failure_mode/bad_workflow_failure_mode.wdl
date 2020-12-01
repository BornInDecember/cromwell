task hello {
  String addressee
  command {
    echo "Hello ${addressee}!"
  }
  output {
    String salutation = read_string(stdout())
  }
  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
    cpu: 1
  }
}

workflow wf_hello {
  call hello
}
