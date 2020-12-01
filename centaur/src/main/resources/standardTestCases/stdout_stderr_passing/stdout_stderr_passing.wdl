task a {
  command {
    echo "12"
    >&2 echo "200"
  }
  output {
    File out = stdout()
    File err = stderr()
  }
  runtime {docker: "marketplace.gcr.io/google/ubuntu1804:latest"}
}

task b {
  File in_file
  command {
    cat ${in_file}
  }
  output {
    Int out = read_int(stdout())
  }
  runtime {docker: "marketplace.gcr.io/google/ubuntu1804:latest"}
}

workflow stdout_stderr_passing {
  call a
  call b {input: in_file=a.out}
  call b as b_prime {input: in_file=a.err}
  output {
    b_prime.out
  }
}
