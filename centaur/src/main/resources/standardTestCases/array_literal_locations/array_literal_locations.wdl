# A task which takes an input, allows this to be called using an array literal in the input block
task array_literal_locations_i {
    Array[Int] array
    command { 
      echo ${sep=":" array} > out
    }
    runtime { docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests" }
    output { String out = read_string("out") }
}

task array_literal_locations_ii {
    Int x
    command { 
      echo ${x} > out
    }
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
        continueOnReturnCode: [ 0, 1, 2 ]
    }
    output { String out = read_string("out") }
}

workflow array_literal_locations {
    call array_literal_locations_i { input: array = [ 0, 1, 2 ] }
    scatter (x in [ 0, 1, 2 ]) {
        call array_literal_locations_ii { input: x = x }
    }
}
