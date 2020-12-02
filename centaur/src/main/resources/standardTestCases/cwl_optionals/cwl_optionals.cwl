cwlVersion: v1.0
class: CommandLineTool
hints:
  DockerRequirement:
    dockerPull: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
baseCommand: echo
inputs:
  message:
    type: string[]?
  unsupplied_optional:
    type: string[]?
outputs: []
