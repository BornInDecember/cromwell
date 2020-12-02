task echo {
  command {
    echo "Peter Piper picked a peck of pickled peppers"
  }
  output {
    File out = stdout()
  }
  runtime {docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"}
}

task find {
  String match = "r"
  File in_file
  command {
    grep '${match}' ${in_file} | wc -l
  }
  output {
    Int count = read_int(stdout())
  }
  runtime {docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"}
}

workflow readFromCache {
  call echo
  call find { input: in_file = echo.out }
  call echo as echoAgain
  call find as findAgain { input: in_file = echo.out }
  output {
    find.count
    findAgain.count
  }
}
