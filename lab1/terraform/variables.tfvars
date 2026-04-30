variable "key_name"{
    description = "Name of kms key associated with instance volume"
    type        = string
    default     = "lab1_key"
}

variable "region" {
    description = "AWS region to deploy infra into"
    type        = string
    default     = "us-east-1"
}