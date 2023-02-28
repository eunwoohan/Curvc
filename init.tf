provider "aws" {
  region = "ap-northeast-2"
  access_key=var.AWS_ACCESS_KEY
  secret_key=var.AWS_SECRET_KEY
}

data "aws_availability_zones" "available" {
  state = "available"
}
