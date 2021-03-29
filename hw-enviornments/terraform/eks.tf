locals {
  node_groups = [
    {
      name          = "hw_demo"
      instance_type = "t3.small"
    }
  ]
}

module "eks" {
  source = "github.com/broadwing/terraform-eks.git?ref=v1.2.0"

  name        = "hello_world"
  environment = "prod"

  cluster_version = "1.16"

  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.private_subnets

  nodes_additional_security_group_ids = [module.vpc.default_security_group_id]

  aws_profile = var.AWS_Profile

  nodes_key_name = "eks"

  node_groups         = local.node_groups

  alb_prefix                   = "k8s"
  alb_ingress_controller_image = "docker.io/m00nf1sh/aws-alb-ingress-controller:v1.2.0-alpha.2"
  get_dashboard_token          = "false"
 
  # Get around flux errors even when not installing flux
  flux_git_url = ""
}
