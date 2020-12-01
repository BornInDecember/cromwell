task hey {
  String what
  command {
    echo "Hey ${what}!"
  }
  output {
    String lyrics = read_string(stdout())
  }
  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }
}

workflow refresh_token_failure {
  call hey
  output {
     hey.lyrics
  }
}
