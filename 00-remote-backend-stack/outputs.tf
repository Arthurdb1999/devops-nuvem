output "dynamodb_table_arn" {
  value = aws_dynamodb_table.this.name
}

output "aws_s3_bucket" {
  value = aws_s3_bucket.this.bucket
}
