pipeline {
  agent any
  stages {
    stage('Setup Python Virtual Enivornment') {
      steps {
        sh 'make venv'
      }
    }
    stage('Build Firmwares') {
      steps {
        sh 'bin/esphome sonoff.yaml compile'
      }
    }
  }
}