task prefix {
  command {
    echo hello \
    | wc -l
  }
  output {
    String out = read_string(stdout())
  }
  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }
}

workflow wf_prefix {
  call prefix
  output {
     String prefix_out = prefix.out
  }
}
