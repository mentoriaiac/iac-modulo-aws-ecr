variable "repo_name" {
  type        = string
  description = "Nome do repositório para imagens de container"
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "Tags para recurso"
}
