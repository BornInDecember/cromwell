task printArray {
  Array[Int] array

  command {
    echo "${sep='"; echo "' array}"
  }
  output {
    String o = read_string(stdout())
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow workflowEngineFunctions {
  Array[Int] some_ints = range(10)
  call printArray {input: array=some_ints}
}
