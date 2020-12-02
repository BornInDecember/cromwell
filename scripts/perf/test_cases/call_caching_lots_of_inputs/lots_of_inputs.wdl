version 1.0

task lots_of_inputs {
    input {
        Array[File] files
    }
    
    command {
        echo ~{sep=' ' files}
    }
    
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"
    }
    
    output {
        File out = stdout()
    }
}

workflow call_cache_read_input_files_perf_test {
    input {
        Array[File] files
    }
    scatter(i in range(100)) {
        call lots_of_inputs { input: files = files }
    }
}
