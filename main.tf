terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "my_vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = "192.168.0.0/16"
  tenancy     = "default"
  vpc_id      = "${module.my_vpc.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
  vpctag      = "myapp"
}

module "my_ec2" {
  source        = "./modules/ec2"
  ec2_count     = 1
  ec2_type      = "t3.micro"
  subnet_id     = "${module.my_vpc.subnet_id}"
  ec2_tag       = "stageec2"
} 
