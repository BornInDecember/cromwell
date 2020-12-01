task noop {
  command {}
  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }
}

workflow workflow_type_and_version_cwl {
  call noop
}
