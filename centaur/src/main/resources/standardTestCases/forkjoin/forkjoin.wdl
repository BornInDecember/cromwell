##
# Checks a simple branch and join operation.
# We start with a task, branch into two parallel executions, and then rejoin to calculate the result.
##

task mkFile {
  command {
    for i in `seq 1 1000`
    do
      echo $i
    done
  }
  output {
    File numbers = stdout()
  }
  runtime {docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"}
}

task grep {
  String pattern
  File in_file
  command {
    grep '${pattern}' ${in_file} | wc -l
  }
  output {
    Int count = read_int(stdout())
  }
  runtime {docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"}
}

task wc {
  File in_file
  command {
    cat ${in_file} | wc -l
  }
  output {
    Int count = read_int(stdout())
  }
  runtime {docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"}
}

task join {
  Int grepCount
  Int wcCount
  command {
    expr ${wcCount} / ${grepCount}
  }
  output {
    Int proportion = read_int(stdout())
  }
  runtime {docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"}
}

workflow forkjoin {
  call mkFile
  call grep { input: in_file = mkFile.numbers }
  call wc { input: in_file=mkFile.numbers }
  call join { input: wcCount = wc.count, grepCount = grep.count }
  output {
    join.proportion
  }
}
