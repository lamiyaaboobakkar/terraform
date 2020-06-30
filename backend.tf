terraform {
  backend "s3" {
    bucket = "lamiyabucket"
    key    = "path/terraform.tfstate"
    region = "ap-south-1"
    #role_arn = "arn:aws:iam::553812159679:role/backends3role"
  }
}
