variable "project_name"       {}
variable "private_subnets"    { type = list(string) }
variable "eks_version"        { default = "1.30" }
variable "node_instance_type" { default = "t3.small" }
