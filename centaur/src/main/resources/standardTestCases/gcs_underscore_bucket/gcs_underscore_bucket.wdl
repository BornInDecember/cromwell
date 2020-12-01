task size_task {
  Float sz

  command {
    echo "file has size ${sz}"
  }
  output {
    File out = stdout()
  }
  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }
}

workflow size_wf {
  File file
  call size_task { input: sz = size(file) }

  output {
    String out = read_string(size_task.out)
  }
}
