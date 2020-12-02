task noop {
  command {}
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow workflow_type_and_version_wdl {
  call noop
}
