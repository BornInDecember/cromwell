class: CommandLineTool
cwlVersion: v1.0
baseCommand: ["sh", "example.sh"]
hints:
  DockerRequirement:
    dockerPull: us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests
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
