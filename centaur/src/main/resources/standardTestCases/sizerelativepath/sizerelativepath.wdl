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

    runtime {docker: "marketplace.gcr.io/google/ubuntu1804:latest"}
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
