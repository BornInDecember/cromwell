task aborted {
    command {
        echo "Instant abort"
    }
    
    runtime {
        docker: "marketplace.gcr.io/google/ubuntu1804:latest"
    }
}

workflow instant_abort {
    call aborted
}
