module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0" # Update to the desired version as necessary

  name = "huang-2-4-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"] # Replace with your AWS region's AZs
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

  enable_nat_gateway = false
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Terraform   = "true"
    Environment = "development"
  }
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnets
}

output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs (should be empty)"
  value       = module.vpc.natgw_ids
}