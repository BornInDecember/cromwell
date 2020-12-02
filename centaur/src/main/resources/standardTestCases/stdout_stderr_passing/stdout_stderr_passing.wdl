task a {
  command {
    echo "12"
    >&2 echo "200"
  }
  output {
    File out = stdout()
    File err = stderr()
  }
  runtime {docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"}
}

task b {
  File in_file
  command {
    cat ${in_file}
  }
  output {
    Int out = read_int(stdout())
  }
  runtime {docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"}
}

workflow stdout_stderr_passing {
  call a
  call b {input: in_file=a.out}
  call b as b_prime {input: in_file=a.err}
  output {
    b_prime.out
  }
}
