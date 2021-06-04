#---------------------------------------------------------
# My terraform_remote_state
#
# Build WebServerduring bootstrap_action
#
# Made by Vitalii_Storozh
#----------------------------------------------------------

provider "aws" {}

resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_webserver.id
  tags = {
    Name  = "Web Server IP"
    Owner = "Denis Astahov"
  }
}

resource "aws_instance" "my_webserver" {
  ami                    = "ami-043097594a7df80ec"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  user_data = templatefile("user_data.sh.tpl", {
    f_name = "Vitalii",
    l_name = "Storozh",
    names  = ["Vasya", "Anton", "Dima", "Vika", "Katya", "Vlad"]
  })

  tags = {
    Name  = "Web Server build by Terraform"
    Owner = "Vitalii Storozh"
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_security_group" "my_webserver" {
  name        = "WebServer Security Group"
  description = "My First SecurityGroup"

  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Web Server SecurityGroup"
    Owner = "Vitalii_Storozh"
  }
}
