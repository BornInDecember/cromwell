class: CommandLineTool
cwlVersion: v1.0
hints:
  DockerRequirement:
    dockerPull: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
requirements:
  InlineJavascriptRequirement:
    expressionLib:
      - "function foo() { return 2; }"
inputs: []
outputs:
  out: stdout
arguments: [echo, $(foo())]
stdout: whatever.txt
