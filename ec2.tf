resource "aws_instance" "ec2" {
  tags = {
    Name : "Terraform_Instance"
  }

  ami = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  key_name = "terraform-key"
  security_groups = ["aws_security_group.sg"]

  user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World!" >/tmp/hello.txt
                EOF
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}