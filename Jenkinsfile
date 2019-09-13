pipeline {
  agent any
  stages {
    stage('Enivorment Setup') {
      parallel {
        stage('Setup Python Virtual Enivornment') {
          steps {
            sh 'make venv'
          }
        }
        stage('Secrets') {
          steps {
            sh 'cp ~/.ssh/secrets.yaml ./'
          }
        }
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
    stage('OTA Updates') {
      steps {
        sh 'bin/esphome sonoff_sw1.yaml upload'
      }
    }
    stage('Post Build') {
      parallel {
        stage('Archive Artifacts') {
          steps {
            archiveArtifacts(artifacts: '**/*.bin', fingerprint: true)
            archiveArtifacts(artifacts: '**.elf', fingerprint: true, allowEmptyArchive: true)
          }
        }
        stage('Remove Secrets') {
          steps {
            sh 'rm secrets.yaml'
          }
        }
      }
    }
  }
}
