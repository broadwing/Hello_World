module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.77.0"
  
  name = "hello_world_demo"
  cidr = "10.11.0.0/16"

  azs               = ["us-east-1a", "us-east-1b"]
  private_subnets   = ["10.11.10.0/24", "10.11.11.0/24"]
  public_subnets    = ["10.11.20.0/24", "10.11.21.0/24"]
  database_subnets  = ["10.11.30.0/24", "10.11.31.0/24"]

  private_subnet_tags = {
    "kubernetes.io/cluster/main" = "shared"
  }

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  enable_vpn_gateway     = false

  enable_dns_hostnames = true
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
} 