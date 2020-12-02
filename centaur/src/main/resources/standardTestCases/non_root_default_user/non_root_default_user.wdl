task notroot {
  String empty = ""
  command {
    echo $HOME ${empty}
  }

  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/cromwell-docker-test:notroot"
  }

  output {
    String home = read_string(stdout())
  }
}

workflow woot {
  call notroot

  output {
    String notrootHome = notroot.home
  }
}
