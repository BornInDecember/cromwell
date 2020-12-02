task createFileArray {
  command <<<
    mkdir out
    echo "hullo" > out/hello.txt
    echo "buh-bye" > out/ciao.txt
  >>>
  output {
    Array[File] out = [ "out/hello.txt", "out/ciao.txt" ]
  }
  runtime {docker:"us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"}
}

task combiner {
  Array[File] in_file
  command <<<
    cat ${sep=' ' in_file}
  >>>
  output {
    String result = read_string(stdout())
  }
  runtime {docker:"us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"}
}

workflow filearrayoutput {
    call createFileArray
    call combiner { input: in_file = createFileArray.out }
    output {
       combiner.result
    }
}
