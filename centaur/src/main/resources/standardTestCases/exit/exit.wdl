task exitTask {
  command {
    exit 5
  }
  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
    continueOnReturnCode: 5
  }
}

workflow exitWorkflow {
  call exitTask
}
