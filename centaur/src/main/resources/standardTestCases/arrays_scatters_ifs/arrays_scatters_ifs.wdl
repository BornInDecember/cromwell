task printInt {
  Int? int

  command { echo "${int}" > out.txt }
  output { Int out = read_int("out.txt") }
  runtime { docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests" }
}

workflow arrays_scatters_ifs {

  Array[Array[Int]] table = [[0,0], [1,1]]
  scatter (row in table) {

    if (length(row) == 2) {
      Int int = row[1]
    }

    call printInt {input: int=int }
  }
  output {
    Array[Int] ints = printInt.out
  }
}
