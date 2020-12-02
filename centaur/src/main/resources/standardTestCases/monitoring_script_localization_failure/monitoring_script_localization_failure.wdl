task t {
  command {
    echo hi
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow monitoring_script_localization_failure {
  call t
}
