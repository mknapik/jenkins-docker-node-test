stage('checkout') {
    node() {
        withCleanup {
            checkout scm

            stash 'source'
        }
    }
}

stage('docker build') {
    node('docker') {
        withCleanup {
            unstash 'source'

            def myEnv = docker.build 'jenkins-docker-test:latest'
            myEnv.inside {
               sh 'npm --version'
            }
        }
    }
}

stage('docker compose') {
    node('docker') {
        withCleanup {
            unstash 'source'

            withDockerCompose { compose ->
                compose.exec('app', 'npm --version')
            }
        }
    }
}
