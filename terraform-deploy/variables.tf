variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file corresponding to the key pair"
  type        = string
}
