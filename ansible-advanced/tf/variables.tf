variable "project" {
  type        = string
  description = "<PROJECT ID>"
  default     = ""
}

variable "zone" {
  type        = string
  description = "Instanse zone"
  default     = "europe-west2-a"
}

variable "region" {
  type        = string
  description = "Instanse region"
  default     = "europe-west2"
}

variable "credentials" {
  type        = string
  description = "Path to or the contents of a service account key file in JSON format"
  default     = ""
}

variable "subnet_cidr" {
  type        = string
  description = "The IP range to use for the subnet"
  default     = "10.10.10.0/24"
}

variable "user" {
  type        = string
  description = "ssh connection user"
  default     = "serhieiev"
}

variable "ssh_pub_key" {
  type        = string
  description = "Path to the public key text in SSH format"
  default     = ""
}

variable "network_name" {
  type        = string
  description = "The name of the network"
  default     = "ansible"
}