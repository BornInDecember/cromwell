task increment {
  Int i
  command {
    echo $(( ${i} + 1 ))
  }
  output {
    Int j = read_int(stdout())
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow subwf {
  Array[Int] is
  scatter (i in is) {
    call increment { input: i = i }
  }
  output {
    Array[Int] js = increment.j
  }
}
