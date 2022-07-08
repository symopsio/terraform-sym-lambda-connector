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
