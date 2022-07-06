provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "appmetalcorp"
    key    = "iac/aws-ecr.tfstate"
    region = "us-east-2"
  }
}


module "ecr-mentoria" {
  source    = "../"
  repo_name = "metal-corporation"

  tags = {
    Env          = "production"
    Team         = "tematico-terraform"
    System       = "api-tika"
    CreationWith = "terraform"
    Repository   = "https://github.com/mentoriaiac/iac-modulo-aws-ecr"
  }
}
