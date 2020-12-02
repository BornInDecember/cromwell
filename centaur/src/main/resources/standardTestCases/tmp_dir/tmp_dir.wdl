workflow tmp_dir {
    call mkTmpFile
    call writeToTmpDir

  output {
      mkTmpFile.out
      writeToTmpDir.tmpDir
  }
}

task mkTmpFile {
    command {
        echo "tmp_dir test wdl" > tmp
    }
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
    }
    output {
        String out = read_string("tmp")
    }
}

task writeToTmpDir {
   command {
        echo "tmp_dir test wdl 2" > $TMPDIR/tmp
        cat $TMPDIR/tmp
   }
   runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
   }
   output {
        String tmpDir = read_string(stdout())
   }
}
