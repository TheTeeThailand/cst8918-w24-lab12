variable "label_prefix" {
  default     = "rung1018"
  type        = string
  description = "Your college username. This will form the beginning of various resource names."
}

variable "region" {
  default     = "westus3"
  type        = string
  description = "The default region that should be used for the resources"
}
