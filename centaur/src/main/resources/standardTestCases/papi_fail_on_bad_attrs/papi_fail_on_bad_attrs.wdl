version 1.0

task hello {
  input {
    String addressee
  }
  command {
    echo "Hello ${addressee}!"
  }
  output {
    String salutation = read_string(stdout())
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
    disks: "10 HDD" # This disk specification string is malformed but Cromwell should handle that gracefully (i.e. fail not hang).
  }
}

workflow papi_fail_on_bad_attrs {
  call hello { input: addressee = "you" }
}
