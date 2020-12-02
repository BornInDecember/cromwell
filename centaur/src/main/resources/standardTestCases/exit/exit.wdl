task exitTask {
  command {
    exit 5
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
    continueOnReturnCode: 5
  }
}

workflow exitWorkflow {
  call exitTask
}
