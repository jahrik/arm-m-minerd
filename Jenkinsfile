#!/usr/bin/env groovy

node('master') {

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
            // Deploy to Swarm
            sh "make deploy"
        }

    } catch(error) {
        throw error

    } finally {
        // Any cleanup operations needed, whether we hit an error or not

    }
}
