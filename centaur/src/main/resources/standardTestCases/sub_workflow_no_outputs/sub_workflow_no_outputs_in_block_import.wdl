
workflow subhello {
  Array[String] greeting_pieces

  call hello {
    input: inputs = greeting_pieces
  }

  String salutation_length = length(hello.out)

  # Neither the call output nor the declaration should be considered outputs to the subworkflow
  output { }
}

task hello {
  Array[String] inputs

  command {}

  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
  output {
    Array[String] out = inputs
  }
}
