task first_task {
    command {
        # Wait 1 minute - this should put us somewhat in the middle of the test run
        sleep 60
        echo "I have a bad feeling about this" > out
    }
    output {
        File out = "out"
    }
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
    }
}

#######################################################################################
#   This task will trigger a cromwell restart when it switches to "Running" state !   #
#######################################################################################
task cromwell_killer {
    File inp
    command {
        # runs long enough to give time to Centaur to see that it's Running and shutdown Cromwell
        sleep 60
        echo "Arrrrgggggggg !" > out
    }
    output {
        File out = "out"
    }
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
    }
}

task third_task {
    File inp
    command {
        echo "Are we.. alive ?"
        echo ${inp}
    }
    output {
        Boolean done = true
    }
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests"
    }
}

workflow cromwell_restart {
    call first_task
    call cromwell_killer { input: inp = first_task.out }
    call third_task { input: inp = cromwell_killer.out }
}
