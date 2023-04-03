terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.51.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

#Create EC2 instance
resource "aws_instance" "tainttestvanevm" {
  ami                    = "ami-0a4bb11459bb218d0"
  instance_type          = "t2.micro"

  user_data = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl start nginx
EOF

  tags = {
    Name = "tainttest2"
  }
}
