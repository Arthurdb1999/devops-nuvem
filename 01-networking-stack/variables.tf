variable "tags" {
  type = map(string)
  default = {
    Environment = "prod"
    Project     = "workshop-dvn"
  }
}

variable "assume_role" {
  type = object({
    arn     = string
    region  = string
    profile = string
  })
  default = {
    arn     = "arn:aws:iam::194768394447:role/workshop-role"
    region  = "us-east-1"
    profile = "arthurdb"
  }
}

variable "vpc" {
  type = object({
    name                     = string
    cidr_block               = string
    internet_gateway_name    = string
    public_route_table_name  = string
    nat_gateway_name         = string
    private_route_table_name = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })
  default = {
    name                     = "workshop-2-vpc"
    cidr_block               = "10.0.0.0/24"
    internet_gateway_name    = "workshop-2-igw"
    public_route_table_name  = "workshop-2-vpc-public-rt"
    nat_gateway_name         = "workshop-2-nat-gateway"
    private_route_table_name = "workshop-2-vpc-private-rt"
    public_subnets = [{
      name                    = "workshop-2-vpc-public-subnet-1a"
      cidr_block              = "10.0.0.0/26"
      availability_zone       = "us-east-1a"
      map_public_ip_on_launch = true
      }, {
      name                    = "workshop-2-vpc-public-subnet-1b"
      cidr_block              = "10.0.0.64/26"
      availability_zone       = "us-east-1b"
      map_public_ip_on_launch = true
    }]
    private_subnets = [{
      name                    = "workshop-2-vpc-private-subnet-1a"
      cidr_block              = "10.0.0.128/26"
      availability_zone       = "us-east-1a"
      map_public_ip_on_launch = false
      }, {
      name                    = "workshop-2-vpc-private-subnet-1b"
      cidr_block              = "10.0.0.192/26"
      availability_zone       = "us-east-1b"
      map_public_ip_on_launch = false
    }]
  }
}
