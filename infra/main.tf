provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "allow_8080_v2" {
  name        = "allow_8080_v2"
  description = "Allow port 8080"

  ingress {
    from_port   = 8080
    to_port     = 8080
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

resource "aws_instance" "flask_vm" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  key_name      = "my-key"
  vpc_security_group_ids = [aws_security_group.allow_8080_v2.id]

  tags = {
    Name = "FlaskVM"
  }
}