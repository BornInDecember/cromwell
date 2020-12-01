task printArray {
  Array[Int] array

  command {
    echo "${sep='"; echo "' array}"
  }
  output {
    String o = read_string(stdout())
  }
  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }
}

workflow workflowEngineFunctions {
  Array[Int] some_ints = range(10)
  call printArray {input: array=some_ints}
}
