data "aws_ami" "amazonlx" {
    most_recent = true
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*"]
    }
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["137112412989"]
}