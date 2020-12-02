task hello {
  String addressee
  command {
    echo "Hello ${addressee}!"
  }
  output {
    String salutation = read_string(stdout())
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"
  }
}

workflow wf_hello {
  call hello
  output {
     hello.salutation
  }
}
