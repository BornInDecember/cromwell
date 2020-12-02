# Testing write_lines() within a command block

task f2a {
  File i

  command {
    cat ${i}
  }

  output {
    Array[String] out = read_lines(stdout())
  }
  runtime {docker:"us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"}
}

task a2f {
  Array[String] strings

  command {
    cat ${write_lines(strings)}
  }

  output {
    File out = stdout()
    String x = read_string(out)
  }
  runtime {docker:"us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"}
}

workflow write_lines {
  call a2f {
    input: strings=["a","b","c","d"]
  }

  call f2a {
    input: i=a2f.out
  }

  call a2f as a2f_second {
    input: strings=f2a.out
  }
  output {
    a2f_second.x
  }
}
