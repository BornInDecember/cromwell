task upstream {
  command {
    echo "true" > true
    echo "false" > false
  }

  output {
    Boolean vrai = read_boolean("true")
    Boolean faux = read_boolean("false")
  }
  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }
}

task optional {
  command {
    echo "ceci n'est pas une pipe" > pipe
  }
  output {
    String message = read_string("pipe")
  }
  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }
}

task downstream {
  String? messageVrai
  String? messageFaux
  command {
    echo "${messageVrai}" > vrai
    echo "${messageFaux}" > faux
  }
  output {
    String vrai = read_string("vrai")
    String faux = read_string("faux")
  }
  runtime {
    docker: "marketplace.gcr.io/google/ubuntu1804:latest"
  }
}

workflow ifs_upstream_and_downstream {
  call upstream

  if (upstream.vrai) {
    call optional as optionalVrai
  }
  if (upstream.faux) {
    call optional as optionalFaux
  }

  call downstream { input: messageVrai = optionalVrai.message, messageFaux = optionalFaux.message }
}
