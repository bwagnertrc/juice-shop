resource "aws_s3_bucket" "example" {
  bucket = "example"
}

resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  tags = {
    Name = "main"
  }
}

# resource "aws_iam_role" "insecure_role" {
#   name                = "insecure_role"
#   assume_role_policy  = data.aws_iam_policy_document.assume_role_policy.json
#   managed_policy_arns = [aws_iam_policy.policy_one.arn, aws_iam_policy.policy_two.arn]
# }

# resource "aws_iam_policy" "policy_s3" {
#   name = "policy-381966"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action   = ["s3:*"]
#         Effect   = "Allow"
#         Resource = "*"
#       },
#     ]
#   })
# }

# data "aws_caller_identity" "current" {}

# data "aws_iam_policy_document" "assume_role_policy" {
#   statement {
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "AWS"
#       identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.id}:root"]
#     }
#   }
# }
