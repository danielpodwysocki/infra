resource "aws_s3_bucket" "terraform_state" {
  acl = "private"

  versioning {
    enabled = true
  }


  tags = {
    Name        = "terraform_state"
    Environment = "prod"
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}


resource "aws_s3_bucket_policy" "allow_terraform_state_access" {
  bucket = aws_s3_bucket.terraform_state.id
  policy = data.aws_iam_policy_document.allow_terraform_state_access.json
}

data "aws_iam_policy_document" "allow_terraform_state_access" {
  statement {
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::795803606776:user/daniel",
      ]
    }

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.terraform_state.arn,
      "${aws_s3_bucket.terraform_state.arn}/*",
    ]
  }
}

