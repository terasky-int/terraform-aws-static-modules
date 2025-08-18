variable "tgw_name" {
  description = "The name of the Transit Gateway"
  type        = string
  default     = null
}

variable "tgw_tags" {
  description = "Transit gateway tags"
  type        = map(string)
  default     = {}
}

variable "spoke_rt_name" {
  description = "The name of the Transit Gateway Spoke Route Table"
  type        = string
  default     = "Spoke-RT"
}

variable "spoke_rt_tags" {
  description = "Additional Transit Gateway Route Table tags"
  type        = map(string)
  default     = {}
}

variable "hub_rt_name" {
  description = "The name of the Transit Gateway Hub Route Table"
  type        = string
  default     = "Hub-RT"
}

variable "hub_rt_tags" {
  description = "Additional Transit Gateway Route Table tags"
  type        = map(string)
  default     = {}
}

variable "tgw_rt_name" {
  description = "The name of the Transit Gateway Route Table"
  type        = string
  default     = "TGW-RT"
}

variable "tgw_rt_tags" {
  description = "Additional Transit Gateway Route Table tags"
  type        = map(string)
  default     = {}
}

variable "create_inspection" {
  description = "Whether there is a Firewall in the environment"
  type        = bool
  #  default     = false
}

#variable "environments" {
#  description = "List of environment types to create a TGW Route Table for. Valid values include `dev`, `test`, `poc`, `prod`, `shared-services`"
#  type        = list(string)
#
##  validation {
##    condition     = contains(["dev", "test", "poc", "prod", "shared-services"], var.environments)
##    error_message = "The value for \"environments\" must be one of the following: \"dev\"/\"test\"/\"poc\"/\"prod\"/\"shared-services\"/ (case-sensitive)"
##  }
#}
#
#variable "rt_seg_tags" {
#  description = "Transit Gateway Route Table tags"
#  type        = map(string)
#  default = {}
#}