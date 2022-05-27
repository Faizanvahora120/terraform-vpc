pipeline {
    agent any
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
