terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

#Specify provider
provider "aws" {
  profile = "default"
  region  = "eu-north-1"
}

#Create instance
resource "aws_instance" "app_server" {
  ami           = "ami-0567085e558e02053"
  instance_type = "t3.micro"

  tags = {
    Name = var.instance_name
  }
}

#Create VPC
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

#Create VPC for testing
resource "aws_vpc" "testing" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "testing"
  }
}

#Create subnet
resource "aws_subnet" "main_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}