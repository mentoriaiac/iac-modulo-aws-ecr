## Diagrama do projeto
![Diagrama](./img/diagrama.png)

## Cria Repositório AWS ECR
- Um repositório é o local em que armazena as imagens do Docker no Amazon ECR.

- Cria usuário IAM com acesso programático na AWS.
Acesso programático: o usuário do IAM poderá fazer apenas chamadas à API AWS. Nesse caso, será criado uma chave de acesso para esse usuário.  

- Cria politica que permite acesso create/pull/push no ECR.
O Amazon ECR usa permissões baseadas em recursos para controlar o acesso a repositórios. As permissões baseadas em recursos permitem especificar quais usuários do IAM têm acesso a um repositório e quais ações podem realizar nele. Nesse caso a politica concede permissão create, pull e push de imagens de container em determinado repositório ECR que foram definidos na `policy`. 

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | Nome do repositório para imagens de container | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags para recurso | `map(string)` | `null` | no |

## Outputs

No outputs.
