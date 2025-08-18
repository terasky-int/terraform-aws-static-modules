variable "is_inspection" {
  description = "Whether this VPC contains a Firewall or not. Should be true if the VPC contains a Firewall"
  type        = bool
  default     = false
}

#variable "vpc_name" {
#  description = "The VPC name"
#  type        = string
#}

variable "vpc_cidr" {
  description = "The VPC CIDR Block in order to add it to the Route Table"
  type        = string
}

variable "tgw_attach_id" {
  description = "The id of the Transit Gateway Attachment"
  type        = string
}

##################################
# Hub & Spoke RTs
##################################

variable "tgw_spoke_route_table_id" {
  description = "The id of the TGW Route Table of all VPCs that don't contain a Firewall"
  type        = string
  default     = null
}

variable "tgw_hub_route_table_id" {
  description = "The id of the TGW Route Table of the VPC that contain a Firewall"
  type        = string
  default     = null
}

##################################
# Single RT
##################################
variable "create_inspection" {
  description = "Whether there is a Firewall in the environment"
  type        = bool
  #  default     = false
}

variable "tgw_route_table_id" {
  description = "The id of the TGW Route Table (in a single TGW RT deployment)"
  type        = string
  default     = null
}

##################################
# RT Segmentation
##################################
#
#variable "environment" {
#  description = "List of environment types to create a TGW Route Table for. Valid values include `dev`, `test`, `poc`, `prod`, `shared-services`"
#  type        = string
#  default     = null
#
#  validation {
#    condition     = contains(["dev", "test", "poc", "prod", "shared-services"], var.environment)
#    error_message = "The value for \"environment\" must be one of the following: \"dev\"/\"test\"/\"poc\"/\"prod\"/\"shared-services\"/ (case-sensitive)"
#  }
#}

#variable "tgw_rts" {
#  description = ""
#  type        = map(any)
#  default     = {}
#}