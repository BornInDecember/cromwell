class: CommandLineTool
cwlVersion: v1.0
baseCommand: ["sh", "example.sh"]
hints:
  DockerRequirement:
    dockerPull: marketplace.gcr.io/google/ubuntu1804:latest
inputs: []

requirements:
  InitialWorkDirRequirement:
    listing:
      - entryname: example.sh
        entry: |-
          PREFIX='Message is:'
          MSG="\${PREFIX} Hello world!"
          echo \${MSG}

outputs:
  example_out:
    type: stdout
stdout: output.txt
