task reverse {
  String var = "racecar"
  command {
   echo "$var | rev"
  }
  output {
    String done = read_string(stdout())
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow refresh_token_no_auth_bucket {
  call reverse
  output {
     reverse.done
  }
}
