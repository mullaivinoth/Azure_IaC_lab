variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region for lab resources"
  type        = string
  default     = "centralindia"
}

variable "resource_group_name" {
  description = "Resource group holding the lab infrastructure"
  type        = string
  default     = "vwan-lab-rg"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Environment = "lab"
    ManagedBy   = "terraform"
    Owner       = "vinoth"
  }
}