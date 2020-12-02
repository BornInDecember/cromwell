task hello {
  command {
    echo "Hello!"
  }
  output {
    String empty = ""
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

task goodbye {
  String emptyInputString
  command {
    echo "${emptyInputString}"
  }
  output {
    String empty = read_string(stdout())
  }
  runtime {
   docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow wf_hello {
  call hello
  call goodbye {input: emptyInputString=hello.empty }
  output {
   hello.empty
   goodbye.empty
  }
}
