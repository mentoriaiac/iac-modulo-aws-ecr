variable "repo_name" {
  type        = string
  description = "Nome do repositório para imagens de container"
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "Tags para recurso"
}

variable "lifecycle_rules" {
  type = list(object({
    selection = object({
      tagStatus     = string # "tagged"|"untagged"|"any"
      tagPrefixList = list(string)
      countType     = string # "imageCountMoreThan"|"sinceImagePushed",
      countUnit     = string
      countNumber   = number
    })
    description = string
  }))
  default = [{
    selection = {
      countType   = "imageCountMoreThan"
      countUnit   = ""
      countNumber = 5
      tagPrefixList = []
      tagStatus   = "any"
    }
    description = "Keep last 4 images"
  }]
  validation {
    condition     = try(alltrue([for o in var.lifecycle_rules : try(length(regex("^(imageCountMoreThan|sinceImagePushed)", o.selection.countType)) != 0, false)]), false)
    error_message = "Selection CountType should be imageCountMoreThan or sinceImagePushed."
  }
  validation {
    condition     = try(alltrue([for o in var.lifecycle_rules : try(length(regex("^(tagged|untagged|any)", o.selection.tagStatus)) != 0, false)]), false)
    error_message = "Selection Tag Status should be tagged or untagged or any."
  }
}
