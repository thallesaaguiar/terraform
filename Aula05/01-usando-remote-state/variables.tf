variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "default"
}

variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-0ed9277fb7eb570c9"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t3.micro"
}