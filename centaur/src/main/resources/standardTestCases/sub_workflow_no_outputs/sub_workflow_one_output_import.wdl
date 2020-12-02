
workflow subhello {
  Array[String] greeting_pieces

  call hello {
    input: inputs = greeting_pieces
  }

  String salutation_length = length(hello.out)

  output {
    Int sal_len = salutation_length
  }
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
