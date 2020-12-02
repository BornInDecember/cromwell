task task_with_noAddress {

    command { echo "hello, world" }

    output { String s = read_string(stdout()) }

    runtime {
      docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
      # NB: This is ignored because of the config in the centaur configuration.
      # If we didn't have that, this task would run forever - or at least until PAPI times it out.
      noAddress: true
    }
}

workflow ignore_noAddress {
    call task_with_noAddress
}
