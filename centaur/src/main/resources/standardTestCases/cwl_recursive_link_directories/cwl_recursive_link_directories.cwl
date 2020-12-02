cwlVersion: v1.0
$graph:  
- id: cwl_recursive_link_directories
  class: CommandLineTool
  requirements:
    - class: ShellCommandRequirement
  cwlVersion: v1.0
  hints:
    - class: DockerRequirement
      dockerPull: us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests
  inputs: []
  outputs:
    output_dir:
        type: Directory
        outputBinding:
          glob: work_dir
  arguments:
    - shellQuote: false
      valueFrom: "mkdir work_dir && ln -s .. work_dir/link"
