version 1.0

task my_task {
  input {
    String s
  }

  command <<<
    echo -n "~{s}" | wc | awk ' { print $3  } '
  >>>

  output {
    Int i = read_int(stdout())
  }

  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}
