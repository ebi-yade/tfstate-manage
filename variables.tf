variable region {
  type    = string
  default = "ap-northeast-1"
}
variable bucket_name {
  /* for example:
  workspace_name(account name) = "unique_bucket_name"
  */
  type = map
}

variable iam_arn_map {
  /*
  specify this when you want to restrict IP 
  from which they can access remote state
  */
  type    = map
  default = {
    default = ["*"]
  }
}
variable cidr_blocks_map {
  /*
  specify this when you want to restrict IP 
  from which they can access remote state
  */
  type    = map
  default = {
    default = ["0.0.0.0/0"]
  }
}