#!/usr/bin/env groovy

node('ninja') {

    try {

        stage('build') {
            // Clean workspace
            deleteDir()
            // Checkout the app at the given commit sha from the webhook
            checkout scm
            sh "make"
        }

        stage('test') {
            // Run any testing suites
        }

        stage('push') {
            // Push to Dockerhub
            sh "make push"
        }

        stage('deploy') {
          withCredentials([usernamePassword(credentialsId: 'a85d7027-45a6-4b45-b320-8379ff5fba9c',
            usernameVariable: 'M_USER',
            passwordVariable: 'M_PASS')]) {
            // Deploy to Swarm
            sh "make deploy"
          }
        }

    } catch(error) {
        throw error

    } finally {
        // Any cleanup operations needed, whether we hit an error or not

    }
}
