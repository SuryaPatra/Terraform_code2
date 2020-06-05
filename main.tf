provider "aws" {
    region  = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0b44050b2d893d5f7"
  instance_type = "t2.medium"

  tags = {
    Name = "HelloWorld"
  }
}
