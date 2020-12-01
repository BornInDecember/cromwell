task invalid_runtime_attributes {
    command { # NOOP }
    runtime {
        docker: "marketplace.gcr.io/google/ubuntu1804:latest"
        continueOnReturnCode: "oops"
    }
}

workflow invalid_runtime_attributes_wf {
    call invalid_runtime_attributes
}
