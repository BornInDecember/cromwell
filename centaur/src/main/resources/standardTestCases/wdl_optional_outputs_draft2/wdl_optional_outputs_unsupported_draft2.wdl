task unsupported_pairs {
    command {
        touch yes
        # no no touching
        # touch no
    }
    output {
        # Even though the nonexistent file is being assigned to the optional File? in the Pair,
        # Cromwell can't currently work out optionality in Pairs with both optional and non-optional files.
        Pair[File?, File] one_optional = ("no", "yes")
    }
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
    }
}

workflow wdl_optional_outputs_unsupported {
    call unsupported_pairs
}
