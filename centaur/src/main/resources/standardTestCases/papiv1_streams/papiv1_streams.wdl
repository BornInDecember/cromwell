version 1.0

task sup {
  input {
    Int i
  }
  command {
    echo sup ~{i}
  }
  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }
}

workflow papiv1_streams {
  call sup { input: i = 0 }
  scatter (i in range(3)) {
    call sup as scatsup { input: i = i }
  }
}
