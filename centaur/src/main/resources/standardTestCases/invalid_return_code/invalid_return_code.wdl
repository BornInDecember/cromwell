task invalid_return_code {
    command <<<
        echo successful
    >>>
    output {
        String successful = read_string(stdout())
    }
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
        continueOnReturnCode: 1
    }
}

workflow invalid_return_code_wf {
    call invalid_return_code
}
