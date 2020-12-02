task prepare {
 command <<<
    python3 -c "print('one\ntwo\nthree\nfour')"
  >>>
  output {
    Array[String] array = read_lines(stdout())
  }
  runtime {
    docker: "python:3.5.0"
  }
}

task analysis {
  String str
  command <<<
    python3 -c "print('_${str}_')" > a.txt
  >>>
  output {
    File out = "a.txt"
  }
  runtime {
    docker: "python:3.5.0"
  }
}

task gather {
  Array[File] array
  command <<<
    cat ${sep=' ' array}
  >>>
  output {
    String str = read_string(stdout())
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow scattergather {
  call prepare
  scatter (x in prepare.array) {
    call analysis {input: str=x}
  }
  call gather {input: array=analysis.out}
  output {
    gather.str
  }
}
