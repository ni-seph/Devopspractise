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