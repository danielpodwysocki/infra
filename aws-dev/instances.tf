resource "aws_instance" "vault1" {
  ami           = "ami-05d34d340fb1d89e5"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.dev-public-c.id
  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
  ]
  key_name = var.ssh_key_name

  tags = {
    Name = "vault1"
    Env  = "dev"
  }
}

