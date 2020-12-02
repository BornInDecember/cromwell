
task foo {
  command {
    echo "foo"
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow wf {
  scatter (i in range(2)) {
    call foo
  }
}
