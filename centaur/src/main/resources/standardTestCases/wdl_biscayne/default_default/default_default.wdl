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
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }
  output {
    String out = read_string(stdout())
  }
}
