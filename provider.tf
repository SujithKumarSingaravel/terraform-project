provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAWOPKGGK7UQC4VSXG"
  secret_key = "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"
}
resource "aws_instance" "newweb" {
  ami           = "ami-02e94b011299ef128"
  instance_type = "t2.micro"
 
  tags = {
    Name = "tf-example"
  }
}
