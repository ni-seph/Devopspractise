//instance
provider "aws" {
    region = "us-east-2"
}
resource "aws_instance" "myapp" {
    instance_type = var.instance_type
    ami = data.aws_ami.amazonlx.id
    key_name= var.keyname
    tags = {
    Name = "Demo1"
    environment = "dev"
    timetolive = "10"
    backup = "no"
  }
}
// loadbalancer group
resource "aws_lb" "test" {
  name               = "testlb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-0a9bcbe6cdbf27aca"]
  subnets            = ["subnet-0037c83b82c89d773", "subnet-0473c8204338c09bd"]

  enable_deletion_protection = false


  tags = {
    Environment = "devlopment"
  }
}
//target group
resource "aws_lb_target_group" "test" {
  name     = "test-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id      = aws_vpc.main.id
}
resource "aws_vpc" "main" {
  cidr_block = "172.31.16.0/20"
}
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.myapp.id
  port             = 80
}
