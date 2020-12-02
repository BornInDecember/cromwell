workflow monitoring_log {
  call get_stats
}

task get_stats {
  command {
    sleep 50
  }
  output {
    Array[String] stats = read_lines("monitoring.log")
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"
  }
}
