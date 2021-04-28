terraform {
  backend "s3" {
    bucket = "digital-demo-s3"
    key    = "digital-remote-demo.tfstate"
    region = "us-east-1"
    # For locking create DynamoDB table with LockID primary key
    # dynamodb_table = "table_name"
  }
}
