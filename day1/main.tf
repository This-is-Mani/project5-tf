#initiatlizing the terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#setting up provider
provider "aws" {
  region = "us-east-1"
}

#creating s3 bucket resource on aws
resource "aws_s3_bucket" "demo" {
  bucket = "my-terraform-demo-bucket-12345"
  tags = {
    Environment = "dev"
    Owner       = "you"
  }
}

#creating an ec2 instance
resource "aws_instance" "demo" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (example)
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-demo-instance"
  }
}
