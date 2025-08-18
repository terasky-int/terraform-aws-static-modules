variable "aws_region" {
  description = "Name of the AWS region"
  type        = string
}

variable "aws_account" {
  description = "AWS account ID to assume the IAM role in"
  type        = string
}

variable "assume_role_name" {
  description = "ARN of an IAM Role to assume"
  type        = string
}

variable "environment" {
  description = "Name of the environment this resource is part of. Valid values include `security`"
  type        = string

  validation {
    condition     = contains(["security"], var.environment)
    error_message = "The value for \"environment\" must be one of the following: \"security\"/ (case-sensitive)"
  }
}

variable "tags" {
  description = "Additional tags for the S3 bucket"
  type        = map(any)
  default     = {}
}