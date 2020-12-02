task aborted {
    command {
        echo "Instant abort"
    }
    
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
    }
}

workflow instant_abort {
    call aborted
}
