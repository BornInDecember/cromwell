
task A {
  command {
    echo "Enfin un peu de francais pour contrer ce raz-de-marée anglais !" > out
    echo "Jacques Chirac fait du jetski sur la Seine en costume traditionnel russe" > out2
  }
  output {
    File out = "out"
    File out2 = "out2"
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

task B {
  command {
     echo "Je contre avec un bonnet peruvien et tire une carte chance" > out
     echo "Kamoulox !" > out2
  }
  output {
     Array[File] outs = ["out", "out2"]
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

task C {
  command {
    cat > out <<END
    (_)
     !_________________________________________
     !*  *  *  *  * |##########################|
     ! *  *  *  *  *|                          |
     !*  *  *  *  * |##########################|
     ! *  *  *  *  *|                          |
     !*  *  *  *  * |##########################|
     ! *  *  *  *  *|                          |
     !*  *  *  *  * |##########################|
     !~~~~~~~~~~~~~~~                          |
     !#########################################|
     !                                         |
     !#########################################|
     !                                         |
     !###################################JGS###|
     !~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     !
     !
     !
     !
     !
     !
     !
    END
  }
  output {
      File out = "out"
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
}

workflow wfoutputs {
  call A
  call B
  call C
  output {
    A.*
    B.outs
  }
}
