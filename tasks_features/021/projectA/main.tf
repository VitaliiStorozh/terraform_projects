#----------------------------------------------------------
# My Terraform
#
# Use Terraform Module to create AWS VPC Networks
#
# Made by Vitalii Storozh. August 2021
#----------------------------------------------------------
provider "aws" {
  region = var.region
}

module "vpc-default" {
  source = "../modules/aws_network"
  //  source               = "git@github.com:VitaliiStorozh/terraform_projects.git//aws_network"
}

# module "vpc-dev" {
#   source = "../modules/aws_network"
#   //  source               = "git@github.com:VitaliiStorozh/terraform_projects.git//aws_network"
#   env                  = "development"
#   vpc_cidr             = "10.100.0.0/16"
#   public_subnet_cidrs  = ["10.100.1.0/24", "10.100.2.0/24"]
#   private_subnet_cidrs = []
# }
#
# module "vpc-prod" {
#   source = "../modules/aws_network"
#   // source               = "git@github.com:VitaliiStorozh/terraform_projects.git//aws_network"
#   env                  = "production"
#   vpc_cidr             = "10.10.0.0/16"
#   public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
#   private_subnet_cidrs = ["10.10.11.0/24", "10.10.22.0/24", "10.10.33.0/24"]
# }
#
# module "vpc-test" {
#   source = "../modules/aws_network"
#   // source               = "git@github.com:VitaliiStorozh/terraform_projects.git//aws_network"
#   env                  = "staging"
#   vpc_cidr             = "10.10.0.0/16"
#   public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
#   private_subnet_cidrs = ["10.10.11.0/24", "10.10.22.0/24"]
# }
#===============================================
