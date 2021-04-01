resource "aws_lb" "bw-demo-app-lb" {
  name               = "bw-demo-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.hw_demo-public-web-sg.id]
  subnets            = module.vpc.public_subnets

  enable_deletion_protection = true


  tags = {
    Environment = "production"
  }
}