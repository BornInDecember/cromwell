cwlVersion: v1.0
class: CommandLineTool
hints:
  DockerRequirement:
    dockerPull: "marketplace.gcr.io/google/ubuntu1804:latest"
baseCommand: echo
inputs:
  message:
    type: string[]?
  unsupplied_optional:
    type: string[]?
outputs: []
