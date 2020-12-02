task invalid_runtime_attributes {
    command { # NOOP }
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
        continueOnReturnCode: "oops"
    }
}

workflow invalid_runtime_attributes_wf {
    call invalid_runtime_attributes
}
