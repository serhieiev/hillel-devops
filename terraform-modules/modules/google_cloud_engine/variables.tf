variable "compute_instance_name" {
  type        = string
  default     = "test-vm-serhieiev"
  description = "Instance name"
}

variable "compute_instance_type" {
  type        = string
  description = "Link project on module root"
}

variable "project" {
  type        = string
  description = "Link project on module root"
}

variable "region" {
  type        = string
  description = "Link region on module root"
}

variable "zone" {
  type        = string
  description = "Link zone on module root"
}

variable "image" {
  type        = map(any)
  description = "Link image on module root"
}

variable "instance_ip" {
  type        = string
  description = "Link ip address on module root"
}

variable "subnet_id" {
  type        = string
  description = "link subnet module vpc"
}
variable "internal_address" {
  type        = string
  description = "Name of the resource"
  default     = "internal-1"

}

variable "address_type" {
  type        = string
  description = "The type of address to reserve"
  default     = "INTERNAL"
}

variable "disk_name" {
  type        = string
  default     = "disk-1"
  description = "Name of the disk"
}

variable "disk_size" {
  type        = string
  description = "Size of the persistent disk, specified in GB"
  default     = "10"
}

variable "disk_type" {
  type        = string
  description = "URL of the disk type resource describing which disk type to use to create the disk"
  default     = "pd-balanced"
}