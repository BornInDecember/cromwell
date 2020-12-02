task make_file {
    Int content
    command {
        echo "hello ${content}" > out
    }
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"
        backend: "Papi-Caching-No-Copy"
    }
    output {
        File out = "out"
    }
}

task use_fofn {
    File fofn
    command {
        cat ${fofn}
    }
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu@sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241"
        backend: "Papi-Caching-No-Copy"
    }
    output {
        Array[String] out = read_lines(stdout())
    }
}


workflow fofn_caching {
    scatter(i in range(5)) {
        call make_file { input: content = i }
    }
    
    call use_fofn { input: fofn = write_lines(make_file.out) }
    
    output {
        Array[String] files = use_fofn.out
    }
}
