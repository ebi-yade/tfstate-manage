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
variable cidr_blocks {
  /*
  specify this when you want to restrict IP 
  from which they can access remote state
  */
  type    = list
  default = ["0.0.0.0/0"]
}