resource "aws_ecr_repository" "hello_world_repo" {
  name                 = "hello-world-demo-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}