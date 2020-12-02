task echo {
  String greeting
  String out
  Int one = 1

  command {
    echo "${greeting}" > ${out}.txt
    echo "${ one + 1 }" > ${one+1}.txt
  }
  output {
    String a_string = read_string("${out}.txt")
    Int two = read_int("${ one + 1 }.txt")
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow echo_wf {
  call echo
}

