version development
task string_interpolation_task {

  input {
    String? str
  }

  command <<<
      echo ~{'"' + str + '"'}
  >>>

  output {
    String out = read_string(stdout())
  }
  
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow echo_wf {
  input {
    String? str
  }
  call string_interpolation_task { input: str = str }
}
