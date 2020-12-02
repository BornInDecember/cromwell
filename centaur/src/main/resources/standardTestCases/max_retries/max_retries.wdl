workflow retry_for_me {

  call broken_task {}
}

task broken_task {

    String s = "/not/a/file"

    command { cat ${s} }
    runtime {
       docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
       maxRetries: 1
    }
}
