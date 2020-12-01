task bad {
  command {
    echo "hello" > a
  }

  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }

  output {
    # Oops! we made a spelling mistake in our WDL!
    File a = "b"
  }
}

workflow badExample {
  call bad
}
