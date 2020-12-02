task singleFile {
  command {
    echo hello
  }
  output {
    File out = stdout()
  }
  runtime { docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests" }
}

task listFiles {
  Array[File] manyIn
  command {
    cat ${sep=" " manyIn}
  }
  output {
    String result = read_string(stdout())
  }
  runtime { docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests" }
}

workflow oneToMany {
  call singleFile
  call listFiles { input: manyIn = [ singleFile.out ] }
}
