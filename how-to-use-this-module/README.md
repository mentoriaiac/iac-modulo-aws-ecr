# Template de módulo Terraform

### Pré-Requisitos

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr-mentoria"></a> [ecr-mentoria](#module\_ecr-mentoria) | ../ | n/a |

### Criar `terrafile.tf`
Crie um arquivo `terraform.tf` com o seguinte conteúdo. E altere os valores das variáveis. 

```hcl
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "nome-bucket-s3"
    key    = "iac/aws-ecr.tfstate"
    region = "us-east-1"
  }
}


module "ecr-mentoria" {
  source         = "git::https://github.com/mentoriaiac/iac-modulo-aws-ecs.git?ref=v1"
  repo_name      = "nome-repositório"

  tags = {
    Env          = "production"
    Team         = "time-terraform"
    System       = "nome-sistema"
    CreationWith = "terraform"
    Repository   = "https://github.com/mentoriaiac/iac-modulo-aws-ecr"
  }
}
```

### Provisionando Cluster ECS
Após preencher os valores requiridos utilize os comandos abaixo para provisionar cluster e suas aplicação.

```shell
terraform init 
terraform fmt
terraform validate
terraform plan
terraform apply
```

### Descrição dos comandos:
Segue uma breve descrição dos comandos listados acima. 
>**terraform init**: Execute o terraform init para baixar todos os plugins necessários.

>**terraform fmt**: O comando é usado para reescrever os arquivos de configuração do Terraform para um formato e estilo canônicos.

>**terraform validate**: Comando valida sintaticamente os arquivos de configuração em um diretório.

>**terraform plan**: Executar um plano de terraform e colocá-lo em um arquivo chamado plano.

>**terraform apply**: Usa plano para aplicar as alterações na AWS.
