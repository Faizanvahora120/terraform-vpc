pipeline {
    agent any
     environment {
        AWS_ACCESS_KEY_ID = credentials('jenkins-aws-secret-key-id')
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
                             sh '''
                              export AWS_ACCESS_KEY_ID=env.AWS_ACCESS_KEY_ID
                              export AWS_SECRET_ACCESS_KEY=env.AWS_SECRET_ACCESS_KEY
                            '''
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
                             sh '''
                              export AWS_ACCESS_KEY_ID=env.AWS_ACCESS_KEY_ID
                              export AWS_SECRET_ACCESS_KEY=env.AWS_SECRET_ACCESS_KEY
                            '''
                            sh 'terraform plan'
                        }
                    }
                     stage('Terraform apply'){
                        steps{
                            sh 'terraform apply --auto-approve'
                        }
                    }
                    
                } 
}
