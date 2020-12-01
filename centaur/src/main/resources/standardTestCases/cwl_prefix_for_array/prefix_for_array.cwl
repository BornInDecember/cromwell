cwlVersion: v1.0
$graph:
- id: prefix-for-array
  cwlVersion: v1.0
  class: CommandLineTool
  baseCommand: ['/bin/echo']
  stdout: "hello.txt"
  requirements:
  - class: DockerRequirement
    dockerPull: "marketplace.gcr.io/google/ubuntu1804:latest"
  inputs:
      bonus:
          type: string[]
          inputBinding:
              prefix: "--bonus"
  outputs:
    out:
      type: string
      outputBinding:
        glob: hello.txt
        loadContents: true
        outputEval: $(self[0].contents)

