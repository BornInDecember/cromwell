version 1.0

#NOTE: Please do not change the spelling for 'nb_ouptputs'. This workflow is used for Call Cache test in Perf.
#      Since there are cache entries inside test db with wrong spelling, correcting the spelling
#      will fail the test as it won't be call cached anymore!
task simpleTask {
    input {
        Int seed
        Int nb_ouptputs = 10
        Array[File] input_files
    }
    command {
        for i in `seq ~{nb_ouptputs}`; do echo $i > $i.txt; done
    }
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"
    }
    output {
        Array[File] outputs = glob("*.txt")
    }
}

workflow callCachingStress {
    input {
        Int scatterSize = 1000
        Array[File] input_files
    }

    scatter(i in range(scatterSize)) {
        call simpleTask { input: input_files = input_files, seed = i }
    }
}
