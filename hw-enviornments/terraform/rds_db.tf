resource "aws_db_instance" "hello_world_db" {
  apply_immediately    = true
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "11.6"
  instance_class       = "db.t2.micro"
  name                 = "hello_world"
  username             = "drew"
  password             = "hello_word_db_1234"
  skip_final_snapshot  = true
  db_subnet_group_name = module.vpc.database_subnet_group_name
}