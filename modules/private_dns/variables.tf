variable "resource_group_name" {
  type = string
}

variable "zones" {
  type        = list(string)
  description = "List of private DNS zone names"
}

variable "zone_name" {
  
}