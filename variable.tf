variable "network_security_group_list" {
  type        = list(any)
  default     = []
  description = "list of network security group objects "
}

variable "resource_group_output" {
  type        = map(any)
  default     = {}
  description = "list of resource group objects "
}

variable "default_values" {
  type = any
  default = {}
  description = "Provide default values for resource if not any"  
}