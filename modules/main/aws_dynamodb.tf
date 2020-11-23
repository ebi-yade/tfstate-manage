resource "aws_dynamodb_table" "this" {
  name           = "terraform-${var.suffix_kebab}"
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }
  lifecycle {
    prevent_destroy = true
  }
}