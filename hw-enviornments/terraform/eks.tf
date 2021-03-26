locals {
  node_groups = [
    {
      name          = "hw_demo"
      instance_type = "t3.nano"
    }
  ]

  managed_node_groups = [
    {
      name          = "managed_base"
      count         = 1
      dedicated     = true
      instance_type = "t3.nano"
    }
  ]

#   users = [
#     {
#       userarn  = "arn:aws:iam::062791981969:user/taylorludwig"
#       username = "taylorludwig"
#       groups   = ["system:masters"]
#     }
#   ]
}

# module "eks" {
#   source = "github.com/broadwing/terraform-eks.git?ref=v1.2.0"

#   name        = "main"
#   environment = "prod"

#   cluster_version = "1.16"

#   vpc_id  = module.vpc.vpc_id
#   subnets = module.vpc.private_subnets

#   nodes_additional_security_group_ids = [module.vpc.default_security_group_id]

#   aws_profile = "default"

#   external_dns_domain_filters = ["broadwing.io"]

#   nodes_key_name = "eks"

#   node_groups         = local.node_groups
#   managed_node_groups = local.managed_node_groups

#   alb_prefix                   = "k8s"
#   alb_ingress_controller_image = "docker.io/m00nf1sh/aws-alb-ingress-controller:v1.2.0-alpha.2"
#   get_dashboard_token          = "false"

#   flux                     = true
#   flux_git_url             = "git@github.com:broadwing/bw_infrastructure.git"
#   flux_git_path            = "kustomize"
#   flux_manifest_generation = true


# }