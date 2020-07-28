resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = "private"
  policy = data.aws_iam_policy_document.this.json

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning { enabled = true }
  tags       = var.tags
}

data "aws_iam_policy_document" "this" {
  statement {
    sid    = "UserAndCutomRole"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:ReplicateObject",
      "s3:DeleteObject"
    ]
    resources = [
      "arn:aws:s3:::${var.bucket_name}",
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"
      values   = var.cidr_blocks
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}