version 1.0

task hello {

  command {
    echo "Hello again" > hello.txt
  }
  output {
    File hello_file = "hello.txt"
  }
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"
  }
}

workflow wf_hello {
  call hello
  output {
     File out = hello.hello_file
  }
}
