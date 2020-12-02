task size_task {
  Float sz

  command {
    echo "file has size ${sz}"
  }
  output {
    File out = stdout()
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow size_wf {
  File file
  call size_task { input: sz = size(file) }

  output {
    String out = read_string(size_task.out)
  }
}
