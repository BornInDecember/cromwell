task hello {
  String addressee
  command {
    echo "Hello ${addressee}!"
  }
  output {
    String salutation = read_string(stdout())
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
    cpu: 1
  }
}

workflow wf_hello {
  call hello
}
