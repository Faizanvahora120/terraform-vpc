pipeline {
    agent any
    environment {
                AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
                AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
                }
    parameters {
                choice choices: ['DEV', 'PROD'], name: 'ENVIRONMENT'
                }

         tools {
                 terraform 'terraform'
               }
               
                stages{
                    stage('Checkout'){
                        steps{
                             git branch: 'main', credentialsId: 'git_credentials', url: 'https://github.com/Faizanvahora120/terraform-vpc'
                        }
                    }
                    stage('Terraform init'){
                        steps{
                            sh 'terraform init'
                        }
                    }
                    stage('Terraform validate'){
                        steps{
                            sh 'terraform validate'
                        }
                    }
                     stage('Terraform plan for Dev Env'){
                            when {
                             expression { 
                                    return params.ENVIRONMENT == 'DEV'
                                        }
                                 }
                        steps{
                              sh """
                              export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                              export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                              terraform workspace select dev
                              terraform plan --auto-approve --var-file=dev.tfvars
                              """
                        }
                    }
                    stage('Terraform apply for Dev Env'){
                         when {
                             expression { 
                                    return params.ENVIRONMENT == 'DEV'
                                        }
                              }
                        steps{
                             sh """
                              export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                              export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                              terraform workspace select dev
                              terraform apply --auto-approve --var-file=dev.tfvars
                              """
                        }
                    }

                    stage('Terraform plan for Prod Env'){
                        when {
                             expression { 
                                    return params.ENVIRONMENT == 'PROD'
                                        }
                            }
                        steps{
                              sh """
                              export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                              export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                              terraform workspace select prod
                              terraform plan --auto-approve --var-file=prod.tfvars
                              """
                        }
                    }

                    stage('Terraform apply prod'){
                         when {
                             expression { 
                                    return params.ENVIRONMENT == 'PROD'
                                        }
                              }

                        steps{
                             sh """
                              export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                              export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                              terraform workspace select prod
                              terraform apply --auto-approve --var-file=prod.tfvars
                              """
                        }
                    }
                    
                } 
}