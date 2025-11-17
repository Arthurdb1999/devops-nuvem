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

variable "eks_cluster" {
  type = object({
    name                                   = string
    version                                = string
    enabled_cluster_log_types              = list(string)
    access_config_authentication_mode      = string
    iam_role_name                          = string
    node_group_name                        = string
    node_group_capacity_type               = string
    node_group_instance_types              = list(string)
    node_group_scaling_config_desired_size = number
    node_group_scaling_config_max_size     = number
    node_group_scaling_config_min_size     = number
    node_group_iam_role_name               = string
  })

  default = {
    name                                   = "workshop-2-eks-cluster"
    version                                = "1.31"
    enabled_cluster_log_types              = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
    access_config_authentication_mode      = "API_AND_CONFIG_MAP"
    iam_role_name                          = "workshop-2-eks-cluster-role"
    node_group_name                        = "workshop-2-eks-cluster-node-group"
    node_group_capacity_type               = "ON_DEMAND"
    node_group_instance_types              = ["t3.micro"]
    node_group_scaling_config_desired_size = 7
    node_group_scaling_config_max_size     = 9
    node_group_scaling_config_min_size     = 7
    node_group_iam_role_name               = "workshop-2-eks-cluster-node-group-role"
  }
}

variable "ecr_repositories" {
  type = list(object({
    name                 = string
    image_tag_mutability = string
  }))

  default = [
    {
      name                 = "workshop-2/production/frontend"
      image_tag_mutability = "MUTABLE"
    },
    {
      name                 = "workshop-2/production/backend"
      image_tag_mutability = "MUTABLE"
    }
  ]
}
