provider "aws" {
  region = "us-east-2"
}



module "ecr-mentoria" {
  source    = "../"
  repo_name = "api-tika"

  lifecycle_rules = [
    {
      selection = {
        countType   = "imageCountMoreThan"
        countUnit   = ""
        countNumber = 1
        tagPrefixList = []
        tagStatus   = "any"
      }
      description = "Keep last 5 images"
    },
    {
      selection = {
        countType   = "sinceimagePushed"
        countUnit   = "days"
        countNumber = 10
        tagPrefixList = []
        tagStatus   = "untagged"
      }
      description = "Keep images for 10 days"
    }
  ]

  tags = {
    Env          = "production"
    Team         = "tematico-terraform"
    System       = "api-tika"
    CreationWith = "terraform"
    Repository   = "https://github.com/mentoriaiac/iac-modulo-aws-ecr"
  }
}
