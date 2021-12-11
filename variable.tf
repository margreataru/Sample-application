variable "public_key_path" {
  description = "Public key path"
  default = "~/.ssh/levelup_key.pub"
}

variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-0629230e074c580f2"
}

variable "instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}

variable "environment_tag" {
  description = "Environment tag"
  default = "Production"
}
variable "AWS_ACCESS_KEY" {
  type = string
  default = "AKIA5WI3NRNUTCMG2XW5"
}
variable "AWS_SECRET_KEY" {
  type = string
  default = "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"
}
variable "AWS_REGION" {
  type = string
  default = "us-east-2"
}