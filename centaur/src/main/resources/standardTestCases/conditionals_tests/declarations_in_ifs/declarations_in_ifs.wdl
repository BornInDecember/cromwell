task double {
  Int x
  command {
    echo $(( ${x} * 2 ))
  }
  output {
    Int doubled = read_int(stdout())
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow declarations_in_ifs {

  if (true) {
    Int i = 5
    call double as double_i { input: x = i }
  }
  if (false) {
    Int j = 6
    call double as double_j { input: x = j }
  }

  output {
    Array[Int?] singles = [ i, j ]
    Array[Int?] doubles = [ double_i.doubled, double_j.doubled ]
  }
}
