task failOnStderr {
    command <<<
        echo "OH NO!" >&2
    >>>
    output {
        String ohno = read_string(stderr())
    }
    runtime {
        docker: "marketplace.gcr.io/google/ubuntu1804:latest"
        failOnStderr: true
    }
}

workflow runtime_failOnStderr {
    call failOnStderr
}
