resource "aws_iam_role" "this" {
  name = "SymLambda${title(var.environment)}"
  path = "/sym/"
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        AWS = var.runtime_role_arns
      }
    }]
    Version = "2012-10-17"
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "lambda" {
  policy_arn = aws_iam_policy.lambda_policy.arn
  role       = aws_iam_role.this.name
}

resource "aws_iam_policy" "lambda_policy" {
  name = "SymLambda${title(var.environment)}"
  path = "/sym/"

  description = "Allows Sym to invoke lambda functions"
  policy      = data.aws_iam_policy_document.lambda_policy.json
}

data "aws_iam_policy_document" "lambda_policy" {
  statement {
    effect = "Allow"
    actions = [
      "lambda:InvokeFunction"
    ]
    resources = var.lambda_arns
  }
}
