################################################################################
# Global Variables
################################################################################
variable "inspection_vpc_cidr" {
  description = "Provide Inspection VPC cidr block to create aws newtork firewall"
  type        = string
}
variable "aws_region" {
  description = "Name of the AWS region"
  type        = string
}

variable "aws_account" {
  description = "AWS account ID to assume the IAM role in"
  type        = string
}

# variable "aws_account_log_archived" {
#   description = "AWS account ID to assume the IAM role in"
#   type        = string
#   default     = ""
# }

variable "assume_role_name" {
  description = "ARN of an IAM Role to assume"
  type        = string
  default     = "TerraformExecutionRole"
}

variable "environment" {
  description = "Name of the environment this resource is part of. Valid values include `dev`, `test`, `poc`, `prod`, `shared-services`"
  type        = string

  validation {
    condition     = contains(["dev", "blueprint", "test", "poc", "prod", "Shared-Services"], var.environment)
    error_message = "The value for \"environment\" must be one of the following: \"dev\"/\"test\"/\"poc\"/\"prod\"/\"shared-services\"/ (case-sensitive)"
  }
}

# variable "account_name" {
#   description = "The AWS account name"
#   type        = string
# }

# variable "inspection_vpc_name" {
#   description = "The Inspection VPC name"
#   type        = string
#   default     = "Inspection"
# }

# variable "create_inspection" {
#   description = "Whether there is a Firewall in the environment"
#   type        = bool
# }

variable "anfw_name" {
  description = "Name for AWS Network Firewall"
  type        = string
  default     = "NetworkFirewall"
}

variable "anfw_bucket_name_logging" {
  description = "Provide S3 bucket name to store logs of AWS Network Firewall"
  type        = string
  default     = "terraform-20250204081713581400000001"
}

variable "anfw_policy_name" {
  description = "The Policy Name for Network Firewall"
  type        = string
  default     = "NetworkPolicy"
}
# variable "firewall_subnet_cidrs" {
#   description = "List of CIDRs for firewall subnets."
#   type        = list(string)
#   default     = []
# }

# variable "cloudwatchlogs_environmnet" {
#   description = "Name of log group in CloudWatch"
#   type        = string
#   default     = ""
# }

# variable "s3_logs" {
#   type        = string
#   description = "Name of S3 logs"
#   default     = ""
# }

# variable "s3_bucket_name" {
#   description = "Central S3 for all network logs usch as vpc flow logs, aws network firewall logs and etc"
#   type        = string
#   default     = ""
# }

# variable "s3_log_bucket_name" {
#   type    = string
#   default = ""
# }
# variable "create_netwrok_firewall" {
#   description = "This enable or deisable Network firewall: The default is false"
#   type        = bool
#   default     = null
# }

variable "stateless_rule_group" {
  description = <<-EOF
  "Config for stateless rule group"
    stateless_rule_group = [
        {
        capacity    = 100
        name        = "stateless"
        description = "Stateless rule example1"
        rule_config = [{
            priority              = 1
            protocols_number      = [6]
            source_ipaddress      = "1.2.3.4/32"
            source_from_port      = 443
            source_to_port        = 443
            destination_ipaddress = "124.1.1.5/32"
            destination_from_port = 443
            destination_to_port   = 443
            tcp_flag = {
            flags = ["SYN"]
            masks = ["SYN", "ACK"]
            }
            actions = {
            type = "pass"
            }
        }]
        }]
        EOF
  type        = any
  default     = []
}

variable "fivetuple_stateful_rule_group" {
  description = <<-EOF
  "Config for 5-tuple type stateful rule group"
  fivetuple_stateful_rule_group = [
        {
        capacity    = 100
        name        = "stateful"
        description = "Stateful rule example1 with 5 tuple option"
        rule_config = [{
            description           = "Pass All Rule"
            protocol              = "TCP"
            source_ipaddress      = "1.2.3.4/32"
            source_port           = 443
            destination_ipaddress = "124.1.1.5/32"
            destination_port      = 443
            direction             = "any"
            sid                   = 1
            actions = {
            type = "pass"
            }
        }]
        },
    ]
  EOF
  type        = any
  default     = []
}

variable "suricata_stateful_rule_group" {
  description = <<-EOF
  "Config for Suricata type stateful rule group"
  suricata_stateful_rule_group = [
    {
        capacity    = 100
        name        = "SURICTASFEXAMPLE1"
        description = "Stateful rule example1 with suricta type"
        rules_file  = "./example.rules"
    }]
    EOF
  type        = any
  default     = []
}

variable "domain_stateful_rule_group" {
  description = <<-EOF
  "Config for domain type stateful rule group"
  domain_stateful_rule_group = [
    {
        capacity    = 100
        name        = "DOMAINSFEXAMPLE1"
        description = "Stateful rule example1 with domain list option"
        domain_list = ["test.example.com", "test1.example.com"]
        actions     = "DENYLIST"
        protocols   = ["HTTP_HOST", "TLS_SNI"]
        rule_variables = {
            ip_sets = [{
                key    = "WEBSERVERS_HOSTS"
                ip_set = ["10.0.0.0/16", "10.0.1.0/24", "192.168.0.0/16"]
            },
            {
                key    = "EXTERNAL_HOST"
                ip_set = ["0.0.0.0/0"]
            }]
            port_sets = [
            {
                key       = "HTTP_PORTS"
                port_sets = ["443", "80"]
            }]
        }
    }]
    EOF
  type        = any
  default     = []
}

variable "aws_managed_rule_group" {
  description = "List of AWS managed rule group arn"
  type        = list(any)
  default     = []
}
