pipeline {
    agent any
    environment {
         AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
         AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
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
                     stage('Terraform plan'){
                        steps{
                              sh """
                              export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                              export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                              terraform plan
                              """
                            
                        }
                    }
                     stage('Terraform apply'){
                        steps{
                             sh """
                              export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                              export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                              terraform apply --auto-approve
                              """
                        }
                    }
                    stage('Terraform destroy'){
                        steps{
                            sh 'terraform destroy'
                        }
                    }
                    
                } 
}