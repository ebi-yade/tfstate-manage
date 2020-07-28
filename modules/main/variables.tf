variable tags { type = map }
variable cidr_blocks { type = list }
variable bucket_name { type = string }

variable suffix {
  type        = string
  description = "suffix for each env"
}
variable suffix_kebab {
  type        = string
  description = "suffix for each env, which has only "
}