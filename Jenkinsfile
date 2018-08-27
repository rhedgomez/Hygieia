node{
    stage('GIT SCM CHECKOUT'){
        git credentialsId: 'e9118ccf-f564-4340-bd54-7c5f0d4471e6', url: 'https://github.com/rhedgomez/Hygieia'

    }
    stage('MVN PACKAGE & BUILD IMAGE'){
        sh 'mvn clean install docker:build;'
    }
    
     stage('PUSH DOCKER IMAGES'){
         withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
             sh "docker login -u rhedgomez -p ${dockerHubPwd}"
         }
        //docker tag
        sh 'docker tag hygieia-ui:latest rhedgomez/hygieia-ui'
        sh 'docker tag hygieia-score-collector:latest rhedgomez/hygieia-score-collector'
        sh 'docker tag hygieia-nexus-iq-collector:latest rhedgomez/hygieia-nexus-iq-collector'
        sh 'docker tag hygieia-hspm-cmdb-collector:latest rhedgomez/hygieia-hspm-cmdb-collector'
        sh 'docker tag hygieia-gitlab-scm-collector:latest rhedgomez/hygieia-gitlab-scm-collector' 
        sh 'docker tag hygieia-subversion-scm-collector:latest rhedgomez/hygieia-subversion-scm-collector'
        sh 'docker tag hygieia-github-scm-collector:latest rhedgomez/hygieia-github-scm-collector'
        sh 'docker tag hygieia-bitbucket-scm-collector:latest rhedgomez/hygieia-bitbucket-scm-collector'
        sh 'docker tag hygieia-appdynamics-collector:latest rhedgomez/hygieia-appdynamics-collector'
        sh 'docker tag hygieia-chat-ops-collector:latest rhedgomez/hygieia-chat-ops-collector'
        sh 'docker tag hygieia-gitlab-feature-collector:latest rhedgomez/hygieia-gitlab-feature-collector'
        sh 'docker tag hygieia-versionone-collector:latest rhedgomez/hygieia-versionone'
        sh 'docker tag hygieia-jira-feature-collector:latest rhedgomez/hygieia-jira-feature-collector'
        sh 'docker tag hygieia-xldeploy-collector:latest rhedgomez/hygieia-xldeploy-collector'
        sh 'docker tag hygieia-udeploy-collector:latest rhedgomez/hygieia-udeploy-collector'
        sh 'docker tag hygieia-sonar-codequality-collector:latest rhedgomez/hygieia-sonar-codequality-collector'
        sh 'docker tag hygieia-jenkins-codequality-collector:latest rhedgomez/hygieia-jenkins-codequality-collector' 
        sh 'docker tag hygieia-jenkins-cucumber-test-collector:latest rhedgomez/hygieia-jenkins-cucumber-test-collector'
        sh 'docker tag hygieia-jenkins-build-collector:latest rhedgomez/hygieia-jenkins-build-collector'
        sh 'docker tag hygieia-bamboo-build-collector:latest rhedgomez/hygieia-bamboo-build-collector'
        sh 'docker tag hygieia-artifactory-artifact-collector:latest rhedgomez/hygieia-artifactory-artifact-collector'
        sh 'docker tag hygieia-apiaudit:latest rhedgomez/hygieia-apiaudit'
        sh 'docker tag hygieia-api:latest rhedgomez/hygieia-api' 
        sh 'docker tag openjdk:8-jre  rhedgomez/openjdk'
        sh 'docker tag nginx:latest rhedgomez/nginx'
        sh 'docker tag java:openjdk-8-jre rhedgomez/java'
        sh 'docker tag java:openjdk-8-jdk rhedgomez/java' 
        
        //docker push
        sh 'docker	push rhedgomez/hygieia-nexus-iq-collector'
        sh 'docker	push rhedgomez/hygieia-ui'
        sh 'docker	push rhedgomez/hygieia-score-collector'
        sh 'docker	push rhedgomez/hygieia-hspm-cmdb-collector'
        sh 'docker	push rhedgomez/hygieia-gitlab-scm-collector'
        sh 'docker	push rhedgomez/hygieia-subversion-scm-collector'
        sh 'docker	push rhedgomez/hygieia-github-scm-collector'
        sh 'docker	push rhedgomez/hygieia-bitbucket-scm-collector'
        sh 'docker	push rhedgomez/hygieia-appdynamics-collector'
        sh 'docker	push rhedgomez/hygieia-chat-ops-collector'
        sh 'docker	push rhedgomez/hygieia-gitlab-feature-collector'
        sh 'docker	push rhedgomez/hygieia-versionone'
        sh 'docker	push rhedgomez/hygieia-jira-feature-collector'
        sh 'docker	push rhedgomez/hygieia-xldeploy-collector'
        sh 'docker	push rhedgomez/hygieia-udeploy-collector'
        sh 'docker	push rhedgomez/hygieia-sonar-codequality-collector'
        sh 'docker	push rhedgomez/hygieia-jenkins-codequality-collector'
        sh 'docker	push rhedgomez/hygieia-jenkins-cucumber-test-collector'
        sh 'docker	push rhedgomez/hygieia-jenkins-build-collector'
        sh 'docker	push rhedgomez/hygieia-bamboo-build-collector'
        sh 'docker	push rhedgomez/hygieia-artifactory-artifact-collector'
        sh 'docker	push rhedgomez/hygieia-apiaudit'
        sh 'docker	push rhedgomez/hygieia-api'
        sh 'docker	push rhedgomez/openjdk'
        sh 'docker	push rhedgomez/nginx'
        sh 'docker	push rhedgomez/java'
        sh 'docker	push rhedgomez/java'
        
    }

    stage('RUN THE CONTAINERS'){
        sh '/usr/local/bin/docker-compose up -d' 
    }    
     
     
}