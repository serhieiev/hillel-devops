# Project variables
variable "project" {
  type        = string
  description = "<PROJECT ID>"
  default     = "serhieiev-hillel"
}

variable "region" {
  type        = string
  description = "Instanse region"
  default     = "europe-central2"
}

variable "zone" {
  type        = string
  description = "Instanse zone"
  default     = "europe-central2-a"
}

variable "key" {
  type        = string
  description = "path to json key to service account"
  default     = "../../serhieiev-hillel-7bd549b1269e.json"
}

# Instance variables
variable "bucket_name" {
  type        = string
  description = "Bucket name"
  default     = "hillel-18-serhieiev"
}

variable "bucket_multi_region" {
  type        = map(any)
  description = "Bucket region"
  default = {
    "Europe"      = "EU"
    "Americas"    = "US"
    "PasificAsia" = "ASIA"
  }
}

variable "vm_name" {
  type        = string
  description = "VM name"
  default     = "test-vm-serhieiev"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "f1-micro"
}

variable "image" {
  type        = map(any)
  description = "Image type"
  default = {
    "debian9"  = "debian-9-stretch-v20220406"
    "debian10" = "debian-10-buster-v20220406"
  }
}

variable "network" {
  type        = string
  description = "The name or self_link of the network attached to this interface"
  default     = "default"
}