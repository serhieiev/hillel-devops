# Project related variables
variable "project" {
  type        = string
  description = "<PROJECT ID>"
  default     = ""
}

variable "zone" {
  type        = string
  description = "Instanse zone"
  default     = "europe-central2-a"
}

variable "key" {
  type        = string
  description = "Path to json key to service account"
  default     = ""
}

variable "region" {
  type        = string
  description = "Instanse region"
  default     = "europe-central2"
}

variable "compute_instance_type" {
  type        = string
  description = "Compute instance type"
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

# VPC related variables
variable "vpc_name" {
  type        = string
  description = "GCP VPC name"
  default     = "vpc-1"
}

variable "subnet_name" {
  type        = string
  description = "VPC subnet name"
  default     = "subnet-1"
}

variable "subnet_ip" {
  type        = string
  description = "VPC subnet address"
  default     = "172.17.1.0/24"
}

variable "firewall_name" {
  type        = string
  description = "Firewall name"
  default     = "firewall-1"
}

variable "nat_name" {
  type        = string
  description = "Router NAT name"
  default     = "nat-config"
}

variable "router_name" {
  type        = string
  description = "Router name"
  default     = "router-1"
}

# Instance related variables
variable "compute_instance_name" {
  type        = string
  description = "A unique name for the resource, required by GCE"
  default     = "test-vm-serhieiev"
}

variable "instance_ip" {
  type        = string
  description = "Ip address of the instance"
  default     = "172.17.1.10"
}