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

variable "remote_backend" {
  type = object({
    bucket_name                = string
    dynamo_table_name          = string
    dynamo_table_billing_mode  = string
    dynamo_table_hash_key      = string
    dynamo_table_hash_key_type = string
  })

  default = {
    bucket_name                = "workshop-bucket-arthurdb"
    dynamo_table_name          = "workshop-state-locking-table"
    dynamo_table_billing_mode  = "PAY_PER_REQUEST"
    dynamo_table_hash_key      = "LockID"
    dynamo_table_hash_key_type = "S"
  }
}
