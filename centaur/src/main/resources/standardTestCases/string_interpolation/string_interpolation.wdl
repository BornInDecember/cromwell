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
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }
}

workflow echo_wf {
  call echo
}

