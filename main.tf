#####################################
# Provider Settings
#####################################
provider "aws" {
  version = "~> 2.57"
  profile = terraform.workspace
  region  = var.region
}

#####################################
# Module Settings
#####################################
module "main" {
  source = "./modules/main"

  bucket_name  = var.bucket_name[terraform.workspace]
  cidr_blocks  = var.cidr_blocks_map[terraform.workspace]
  iam_arn_list  = var.iam_arn_map[terraform.workspace]
  suffix       = local.suffix
  suffix_kebab = local.suffix_kebab

  tags = {
    Terraform = "true"
    Name      = local.suffix
  }
}