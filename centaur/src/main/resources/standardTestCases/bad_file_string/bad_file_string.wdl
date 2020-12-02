task echo_file {
    File file_not_str

    command {
        echo ${file_not_str}
    }

    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
    }

    output {
        String out = read_string(stdout())
    }
}

workflow bad_file_string {
    String str = "not_a_file"

    call echo_file {
        input:
            file_not_str = str
    }
}
