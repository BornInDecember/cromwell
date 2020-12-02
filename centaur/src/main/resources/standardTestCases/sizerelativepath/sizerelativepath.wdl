version 1.0

task print_size {
    input {
        File file
    }
    Int bytes = ceil(size(file))

    command {
        echo ~{bytes}
    }

    output {
        String out = read_string(stdout())
    }

    runtime {docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"}
}

workflow sizerelativepath {
    input {
        File file = "centaur/src/main/resources/standardTestCases/sizerelativepath/1495bytes.txt"
    }

    call print_size {
        input:
            file = file
    }
    output {
        String size_string = print_size.out
    }
}
