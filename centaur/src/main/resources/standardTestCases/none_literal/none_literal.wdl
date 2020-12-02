version development

workflow none_literal {
  input {
    Int? int_in = None
  }

  call none_in_command

  output {
    Int? out = int_in
    Int? out2 = None
    Int out3 = select_first([out, out2, None, 3])

    String out_none = none_in_command.s
  }

}

task none_in_command {
  command <<<
    echo ~{if (defined(None)) then "Some" else "None" }
  >>>
  runtime {
    docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
  }
  output {
    String s = read_string(stdout())
  }
}
