task pfx {
  Array[String] kvs = ["k1=v1", "k2=v2", "k3=v3"]
  Array[String] prefixed = prefix("-e ", kvs)
  command {
    echo "${sep=' ' prefixed}"
  }
  output {
    String out = read_string(stdout())
  }
  runtime { docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests" }
}

workflow prefix {
  call pfx
  output {
    String out = pfx.out
  }
}
