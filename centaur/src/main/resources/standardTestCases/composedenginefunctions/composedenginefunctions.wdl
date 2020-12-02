##
# Check that we can:
# - Compose engine functions together.
##

task composeEngineFunctions {

  command {
    echo "Hello, I am a small test string"
    echo 2 >&2
  }
  output {
    File blah = stdout()
    String x = read_string(stdout())
    String y = read_int(stderr()) + x + read_string(blah)
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow composedenginefunctions {
  call composeEngineFunctions

  output {
    composeEngineFunctions.x
    composeEngineFunctions.y
  }
}
