task hey {
  String what
  command {
    echo "Hey ${what}!"
  }
  output {
    String lyrics = read_string(stdout())
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow refresh_token_failure {
  call hey
  output {
     hey.lyrics
  }
}
