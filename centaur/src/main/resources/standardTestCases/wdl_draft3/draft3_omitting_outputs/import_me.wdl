version 1.0

task foo {
  command {
    echo hi
  }
  output {
    String x = read_string(stdout())
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow foo_in_a_box {
  call foo
  output {
    String x = foo.x
  }
}
