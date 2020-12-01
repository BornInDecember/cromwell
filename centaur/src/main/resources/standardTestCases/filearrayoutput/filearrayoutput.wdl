task createFileArray {
  command <<<
    mkdir out
    echo "hullo" > out/hello.txt
    echo "buh-bye" > out/ciao.txt
  >>>
  output {
    Array[File] out = [ "out/hello.txt", "out/ciao.txt" ]
  }
  runtime {docker:"marketplace.gcr.io/google/ubuntu1804:latest"}
}

task combiner {
  Array[File] in_file
  command <<<
    cat ${sep=' ' in_file}
  >>>
  output {
    String result = read_string(stdout())
  }
  runtime {docker:"marketplace.gcr.io/google/ubuntu1804:latest"}
}

workflow filearrayoutput {
    call createFileArray
    call combiner { input: in_file = createFileArray.out }
    output {
       combiner.result
    }
}
