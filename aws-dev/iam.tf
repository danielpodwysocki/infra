resource "aws_iam_role" "ssm_instance_role" {
  name = "ssm_instance_role"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",

  ]

  tags = {
    Name = "ssm_instance_role"
    Env  = "dev"
  }
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}




resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm_profile"
  role = aws_iam_role.ssm_instance_role.name
  tags = {
    Name = "ssm_profile"
    Env  = "dev"
  }
}

