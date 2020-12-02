
workflow subhello {
  Array[String] greeting_pieces

  call hello {
    input: inputs = greeting_pieces
  }

  # Confirm referencing call outputs from subworkflows does not fail validation.
  String salutation_length = length(hello.out)

  output {
    Array[String] hello_out = hello.out
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
