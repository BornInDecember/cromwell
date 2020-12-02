task url_grab {
    String url
    command <<<
        curl -# ${url} > news
    >>>
    output {
        File news = "news"
        File progressBar = stderr()
    }
    runtime {
        docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/curl:latest"
        failOnStderr: false
    }
}

task news_reader {
    File news

    command { 
      wc -l < ${news}
    }
    output { Int news_size = read_int(stdout()) }
    runtime { docker: "us.gcr.io/broad-dsde-cromwell-dev/centaur/ubuntu:12022020-for-cromwell-tests" }
}

workflow curl_wf {
    call url_grab as newsgrab { input: url = "http://www.bbc.com/news" }
    call news_reader { input: news = newsgrab.news }
}
