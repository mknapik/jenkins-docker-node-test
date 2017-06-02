node('docker') {
    withCleanup {
        checkout scm

        def myEnv = docker.build 'jenkins-docker-test:latest'
        myEnv.inside {
           sh 'npm --version'
        }
    }
}

node('docker') {
    withCleanup {
        checkout scm

        withDockerCompose { compose ->
            compose.exec('app', 'npm --version')
        }
    }
}
