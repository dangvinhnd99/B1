provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "vinh_key_1" {
  key_name   = "vinhkey"
  public_key = file("~/.ssh/vinhkey.pub")
}

resource "aws_instance" "web" {

  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = var.instance_type
  key_name      = "vinhkey"
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "main" {
  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
