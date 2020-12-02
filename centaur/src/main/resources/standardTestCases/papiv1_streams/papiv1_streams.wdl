version 1.0

task sup {
  input {
    Int i
  }
  command {
    echo sup ~{i}
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow papiv1_streams {
  call sup { input: i = 0 }
  scatter (i in range(3)) {
    call sup as scatsup { input: i = i }
  }
}
