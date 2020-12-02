task print {
  command {
    echo "She sells sea shells by the sea shore only on $(date)"
  }
  output {
    File tongueTwister = stdout()
  }
  runtime {docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"}
}

task grep {
  String match = "o"
  File input_file
  command {
    grep '${match}' ${input_file} | wc -l
  }
  output {
    Int count = read_int(stdout())
    File redirect = input_file
  }
  runtime {docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"}
}

task grepAgain {
  String match = "o"
  File input_file
  command {
    grep '${match}' ${input_file} | wc -l
  }
  output {
    Int count = read_int(stdout())
    File redirect = input_file
  }
  runtime {docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"}
}

workflow writeToCache {
  call print
  call grep { input: input_file = print.tongueTwister }
  call grepAgain { input: input_file = grep.redirect }
  output {
    grep.count
    grepAgain.count
  }
}
