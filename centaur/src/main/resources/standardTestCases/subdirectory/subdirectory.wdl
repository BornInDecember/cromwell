task subdirTask {
  command {
    mkdir subdir
    cd subdir
    echo "I'm in a subdirectory !" > subFile
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
  output {
    File outputFile = "subdir/subFile"
  }
}

workflow subdirWorkflow {
  call subdirTask
}
