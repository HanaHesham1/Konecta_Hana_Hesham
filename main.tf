provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

resource "aws_instance" "cicd_machine" {
  ami             = "ami-0c55b159cbfafe1f0" 
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.allow_ssh_http.name]

  tags = {
    Name = "CICD-Machine"
  }
}

resource "aws_instance" "prod_machine" {
  ami             = "ami-0c55b159cbfafe1f0" 
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.allow_ssh_http.name]

  tags = {
    Name = "Production-Machine"
  }
}

output "cicd_ip" {
  value = aws_instance.cicd_machine.public_ip
}

output "prod_ip" {
  value = aws_instance.prod_machine.public_ip
}
