provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAQRU5QFQKCBMWQUWX"
  secret_key = "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"
}
 
resource "aws_security_group" "web_access" {
        name = "web_access"
        description = "allow ssh and http"
 
        ingress {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }
 
        ingress {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }
 
        egress {
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }
}
resource "aws_key_pair" "key123" {
  key_name   = "key123"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC519pLvulS7oL8hVpHMnAgfTzpm3otd3oKvxEOPUhbOT7H3TH1azSx7qDA1Azmpe9kEkl63XrHe0AherilsFZXvWlap7jna5CtkO0RHUT2HIVCkHtTdmkyWyGq7ERS1VoLmSX/uq1A/VKxUhB60D5YgjnLbakopJ4r0HGWxPTRq8lPR+WI+i609dESRw0+q/QJfV4mR/et1D3JgoLDyiWZofOTaC9Dhkfoy9QOfCPNUh/DoxFqE9v5wdTMmBioW6M2KzXLj7gfhhvdrss6dXgBNU6FGHIAJHBTD5w3e0/sosOgd7B/0KCQGMRH2S1TzbqzOsgFxaWVtPVKx3yYYb9WPkiRD1LWJN6CE2DwcTtY/0FTSZLIPJuJLAjuBp9b47RzT0tfrvca/hcugfs1i4oTGr0bGcpEMRJi4dyfCnfhShqXF7PFO5JodxnCswmBsP2Wdrhs4xr/Wqpifl3Ig5/mohKGAP5Z3ctf5HAQX+clGq8vdkH8h2Uq87GzsLwBIms= root@ip-172-31-36-117.ap-south-1.compute.internal"
}
 
resource "aws_instance" "newweb" {
  ami           = "ami-05c13eab67c5d8861"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.web_access.name}"]
  key_name = aws_key_pair.key123.key_name
  tags = {
    Name  = "hello-World"
    Stage = "testing"
    Location = "INDIA"
  }
 
}
