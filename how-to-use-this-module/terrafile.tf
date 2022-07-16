provider "aws" {
  region = "us-east-2"
}



module "ecr-mentoria" {
  source    = "../"
  repo_name = "api-tika"

  tags = {
    Env          = "production"
    Team         = "tematico-terraform"
    System       = "api-tika"
    CreationWith = "terraform"
    Repository   = "https://github.com/mentoriaiac/iac-modulo-aws-ecr"
  }
}
