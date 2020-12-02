version 1.0

workflow localizer_workflow {
  input {
    File input_file
  }

  call localizer_task {
    input:
      input_file = input_file
  }

  output {
    String o = localizer_task.out
  }
}

task localizer_task {
  input {
    File input_file
  }

  command <<<
    pwd && ls -lah .
  >>>

  runtime {
  	docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }

  output {
    String out = read_string(stdout())
  }
}
