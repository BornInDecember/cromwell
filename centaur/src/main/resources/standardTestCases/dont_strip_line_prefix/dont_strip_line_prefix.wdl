task prefix {
  command {
    echo hello \
    | wc -l
  }
  output {
    String out = read_string(stdout())
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow wf_prefix {
  call prefix
  output {
     String prefix_out = prefix.out
  }
}
