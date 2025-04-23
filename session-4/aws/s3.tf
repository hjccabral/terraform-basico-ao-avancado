resource "aws_s3_bucket" "bucket" {
  bucket = "hjcc-bucket"

  tags = {
    Name        = "hjcc-bucket"
    Environment = "Dev"
  }
}