terraform {

  cloud {
    organization = "PearlWave_Labs"
    workspaces {
      name = "learn-tfc-aws"
    }
  }

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
    Name = var.instance_name // calling the variable defined below
  }
}

# declaring a variable
variable "instance_name" {
  description = "Value of the Name tag for the EC2 Instance"
  type  = string
  default = "TerraformedServer02"
}

# declaring outputs
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
