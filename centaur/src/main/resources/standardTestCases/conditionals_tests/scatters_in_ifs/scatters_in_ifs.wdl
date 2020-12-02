task mirror {
  Int i
  command {
    echo ${i}
  }
  output {
    Int out = read_int(stdout())
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow scatters_in_ifs {

  Array[Int] numbers = range(3)

  if (true) {
    scatter (n in numbers) {
      call mirror as mirrorTrue { input: i = n }
    }
  }

  if (false) {
    scatter (n in numbers) {
      call mirror as mirrorFalse { input: i = n }
    }
  }

  output {
    Array[Int]? inTruth = mirrorTrue.out
    Array[Int]? inLies = mirrorFalse.out
  }
}
