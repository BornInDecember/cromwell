task t {
  command {
    echo hi
  }
  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }
}

workflow monitoring_script_localization_failure {
  call t
}
