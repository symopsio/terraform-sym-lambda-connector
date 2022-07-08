variable "environment" {
  description = "An environment qualifier for the resources this module creates, to support a Terraform SDLC."
  type        = string
}

variable "lambda_arns" {
  description = "List of Lambda ARNs the connector can invoke."
  type        = list(string)
}

variable "runtime_role_arns" {
  description = "ARNs of the runtime connector roles that are trusted to assume the SSO role."
  type        = list(string)
}

variable "tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}

