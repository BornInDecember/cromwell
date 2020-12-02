task failing_task {
    command {
        # C'est nul !
        exit 1
    }
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"
    }
    output {
        Boolean done = true
    }
}

workflow dont_cache_to_failed_jobs {
  call failing_task
}
