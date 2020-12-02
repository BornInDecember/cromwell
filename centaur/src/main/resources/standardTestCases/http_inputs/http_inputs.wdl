version 1.0


workflow http_inputs {
  call sum
}


task sum {

  input {
    File jamie
  }

  command {
    /usr/bin/md5sum ${jamie} | cut -c1-32
  }

  output {
    String sum = read_string(stdout())
  }

  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}
