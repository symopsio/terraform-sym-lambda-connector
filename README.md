# lambda-connector

The `lambda-connector` module provisions a Lambda role that the [AWS Lambda Strategy](https://docs.symops.com/docs/aws-lambda) can use to invoke AWS Lambda Functions.

This `Connector` will provision a single IAM role for the Sym Runtime to use with a Strategy.

Only the supplied `runtime_role_arns` are trusted to assume this role.

```hcl
module "lambda_connector" {
  source  = "symopsio/lambda-connector/sym"
  version = ">= 1.0.0"

  environment       = "sandbox"
  lambda_arns       = [ var.lambda_arns ]
  runtime_role_arns = [ var.runtime_role_arn ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.lambda_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.lambda_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | An environment qualifier for the resources this module creates, to support a Terraform SDLC. | `string` | n/a | yes |
| <a name="input_lambda_arns"></a> [lambda\_arns](#input\_lambda\_arns) | List of Lambda ARNs the connector can invoke. | `list(string)` | n/a | yes |
| <a name="input_runtime_role_arns"></a> [runtime\_role\_arns](#input\_runtime\_role\_arns) | ARNs of the runtime connector roles that are trusted to assume the SSO role. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to apply to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_settings"></a> [settings](#output\_settings) | A map of settings to supply to a Sym Permission Context. |
<!-- END_TF_DOCS -->