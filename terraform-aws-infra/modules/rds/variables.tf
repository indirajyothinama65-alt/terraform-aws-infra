variable "project_name"    {}
variable "vpc_id"          {}
variable "vpc_cidr"        {}
variable "private_subnets" { type = list(string) }
variable "db_name"         {}
variable "db_username"     {}
variable "db_password"     { sensitive = true }
