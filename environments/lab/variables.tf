variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  validation {
    condition     = var.subscription_id == "d6e34000-17b3-4ff6-b09d-47bee0f62b26"
    error_message = "This is the LAB environment. subscription_id must be the personal lab subscription, not any other subscription."
  }
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