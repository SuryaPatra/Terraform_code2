provider "aws" {
    region  = "us-east-1"
}

data "aws_ami" "ubuntu_ami" {
    most_recent      = true
    owners           = ["self"]

    filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
}

output "ami_id" {
  value = data.aws_ami.ubuntu_ami.id
}

resource "aws_instance" "web" {
  ami           = "ami-0b44050b2d893d5f7"
  instance_type = "t2.medium"
  availability_zone = "us-east-1a"

  tags = {
    Name = "HelloWorld"
    ttl  = "60"
    Owner = "amazon"
  }
}
