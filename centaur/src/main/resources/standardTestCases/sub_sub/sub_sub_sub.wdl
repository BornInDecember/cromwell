
task foo {
  command {
    echo "foo"
  }
  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }
}

workflow wf {
  scatter (i in range(2)) {
    call foo
  }
}
