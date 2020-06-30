pipeline
{
    options
    {
        buildDiscarder(logRotator(numToKeepStr: '3'))
    }
    agent any

   
    environment {
    
    TF_IN_AUTOMATION = 'true'
   
    }
    stages  
    {
        stage('Build preparations')
        {
            steps
            {
                checkout scm
            }
        }
        
        stage('Terraform Init')
        {
            steps
            {
                script
                {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
                    // Initialize Terraform
                    sh 'terraform init -input=false'
                }
            }
        }
        stage('Terraform Plan')  
        {
            steps
            {
                script
                {
                    // Paln the resources that are going to be created
                    sh 'terraform plan -input=false'
                }
            }
        }
        stage('Terraform Apply')
        {
            steps
            {
                script
                {
                    // Initialize Terraform
                    sh 'terraform apply -input=false -auto-approve -var="AWS_REGION=ap-south-1"'
                }
            }
        }
    }
    
   
}
