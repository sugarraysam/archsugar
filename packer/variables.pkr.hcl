variable "disk_size" {
  type        = number
  default     = 40960 # 40 GB
  description = "in megabytes"
}

variable "cpus" {
  type    = number
  default = 2
}

variable "memory" {
  type        = number
  default     = 4096 # 4 GB
  description = "in megabytes"
}

variable "archsugar_version" {
  type        = string
  default     = "0.2.0"
  description = "Version of archsugar-cli to install (without the 'v' prefix)"
}

variable "keep_registered" {
  type        = bool
  default     = true
  description = "Keep VM registered /w vbox for easy debugging, disable for CI"
}
