task scoping_task {
    Int number1
    Int number2 = 20

    command {
        echo "${number1} and ${number2}"
    }

    output { String out = read_string(stdout()) }
    runtime { docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests" }
}

workflow scoping_wf {
    Int number1 = 5
    Int number2 = 10

    # Assign Workflow's number2 variable to Task's number1:
    call scoping_task { input: number1 = number2 }
}
