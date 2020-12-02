task mkFile {
    command {
        echo "The sixth sheikh's sheep is sick"
    }
    output {
        File sick_sheep = stdout()
    }
    runtime { docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests" }
}

task input_mirror {
    File inFile
    command {
        # NO-OP
    }
    output {
        File outFile = inFile
        String out = read_string(outFile)
    }
    runtime { docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests" }
}

workflow mirror_mirror_on_the_wall {
    call mkFile
    call input_mirror as mirror1 { input: inFile = mkFile.sick_sheep }
    call input_mirror as mirror2 { input: inFile = mirror1.outFile }
}
