terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-06c4be2792f419b7b"
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformedServer02"
  }
}
