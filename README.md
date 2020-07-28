# tfstate-manage

You can deploy state files of [Terraform](https://www.terraform.io/) on AWS S3 and ensure consistensy with Hash stored in AWS DynamoDB.

## Installation

To get started, make sure you have [Docker installed](https://docs.docker.com/docker-for-mac/install/) on your system, and then clone this repository.

### Terraform Init

run:

```sh
terraform init
terraform workspace {your-account-nickname}
```

## Usage

### Deploy

To deploy, run below and type "yes" to your standard input after check your workspace if correct:

```sh
terraform apply
```

## References
