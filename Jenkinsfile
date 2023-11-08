pipeline {
agent any
tools {
terraform 'Terraform 1.0.10'
}
stages {
stage('Checkout') {
steps {
// Checkout your source code from your version control system (e.g., Git)
checkout scm
}
}
stage("set env variabl"){
            steps{
                sh 'export AWS_PROFILE=037911276564'
            }
        }
stage('Terraform Init') {
steps {
// Run 'terraform init' to initialize your Terraform configuration
sh 'terraform init'
}
}
stage('Terraform Plan') {
steps {
// Run 'terraform plan' to review the changes
sh 'terraform plan -out=tfplan'
}
}
stage('Terraform Apply') {
steps {
// Apply the changes if approved (you might want to add an approval step here)
sh 'terraform apply tfplan'
}
}
}
}
