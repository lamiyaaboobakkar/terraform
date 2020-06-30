pipeline
{
    options
    {
        buildDiscarder(logRotator(numToKeepStr: '3'))
    }
    agent any

    parameters {
    password (name: 'AWS_ACCESS_KEY_ID')
    password (name: 'AWS_SECRET_ACCESS_KEY')
    }
    environment {
    
    TF_IN_AUTOMATION = 'true'
    AWS_ACCESS_KEY_ID = "${params.AWS_ACCESS_KEY_ID}"
    AWS_SECRET_ACCESS_KEY = "${params.AWS_SECRET_ACCESS_KEY}"
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
                    // Initialize Terraform
                    sh 'terraform init -input=true'
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
                    sh 'terraform plan -input=true'
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
