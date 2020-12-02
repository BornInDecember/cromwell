task nobody {
  command {
    whoami
  }

  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
    docker_user: "nobody"
  }

  output {
    String user = read_string(stdout())
  }
}

workflow woot {
  call nobody

  output {
    String nobodyUser = nobody.user
  }
}
