provider "aws" {
    region  = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0b44050b2d893d5f7"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
