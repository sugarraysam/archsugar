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

variable "headless" {
  type    = bool
  default = false
}
