provider "aws" {
    region  = "us-east-1"
    
}

data "aws_ami" "ubuntu_ami" {
    most_recent      = true
    owners           = ["amazon"]

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

# Security group

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  

  tags = {
    Name = "allow_tls"
    ttl  = "60"
    Owner = "amazon"
  }
}
