task failOnStderr {
    command <<<
        echo "OH NO!" >&2
    >>>
    output {
        String ohno = read_string(stderr())
    }
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
        failOnStderr: true
    }
}

workflow runtime_failOnStderr {
    call failOnStderr
}
