resource "aws_ecr_repository" "this" {
  name                 = var.repo_name
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = var.tags
}

resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name
  policy = jsonencode(
    {
      rules = [
        for idx, rule in var.lifecycle_rules : 
          merge({
            rulePriority = idx
            action = {
                type = "expire"
            }
          }, 
          rule)
      ]
    }
  )
}