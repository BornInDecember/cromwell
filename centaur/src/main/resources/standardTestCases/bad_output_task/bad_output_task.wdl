task bad {
  command {
    echo "hello" > a
  }

  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }

  output {
    # Oops! we made a spelling mistake in our WDL!
    File a = "b"
  }
}

workflow badExample {
  call bad
}
