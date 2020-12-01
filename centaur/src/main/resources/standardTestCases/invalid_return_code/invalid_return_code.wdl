task invalid_return_code {
    command <<<
        echo successful
    >>>
    output {
        String successful = read_string(stdout())
    }
    runtime {
        docker: "marketplace.gcr.io/google/ubuntu1804:latest"
        continueOnReturnCode: 1
    }
}

workflow invalid_return_code_wf {
    call invalid_return_code
}
