version 1.0

task yo {
  input {
    String salutation
  }
  command {
    echo 'sup ~{salutation}?'
  }

  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }

  output {
    String out = read_string(stdout())
  }
}

workflow call_cache_hit_prefixes {
  call yo

  output {
    String sup = yo.out
  }
}
