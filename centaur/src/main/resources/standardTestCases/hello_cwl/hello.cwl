cwlVersion: v1.0
$graph:
  id: hello
  class: CommandLineTool
  requirements:
    - class: DockerRequirement
      dockerPull: us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests
  baseCommand: echo
  inputs:
    message:
      type: string
      inputBinding:
        position: 1
  stdout: hello-stdout.txt
  outputs:
    - id: salutation
      type: string
      outputBinding:
        glob: hello-stdout.txt
        loadContents: true
        outputEval: $(self[0].contents.trim())
