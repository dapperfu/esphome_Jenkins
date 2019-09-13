pipeline {
  agent any
  stages {
    stage('Setup Python Virtual Enivornment') {
      steps {
        sh 'make venv'
      }
    }
    stage('Build Firmwares') {
      parallel {
        stage('Sonoff Swich 1') {
          steps {
            sh 'bin/esphome sonoff_sw1.yaml compile'
          }
        }
        stage('Feit Counter Light 1') {
          steps {
            sh 'bin/esphome feit_counter1.yaml compile'
          }
        }
      }
    }
    stage('Archive Artifacts') {
      steps {
        archiveArtifacts(artifacts: '**/*.bin', fingerprint: true)
      }
    }
  }
}