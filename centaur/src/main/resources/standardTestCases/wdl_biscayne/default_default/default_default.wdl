version development

workflow default_default {
  call default_default_task
  output {
    String out = default_default_task.out
  }
}

task default_default_task {
  input {
    String? x
    Int? y
  }

  command <<<
    echo "x: '~{x}' y: '~{y}'"
  >>>
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
  output {
    String out = read_string(stdout())
  }
}
