resource "aws_s3_bucket" "bucket-1" {
  bucket = "hilton-tf-bucket-1"
}

resource "aws_s3_bucket" "bucket-2" {
  bucket = "hilton-tf-bucket-2"
}

resource "aws_s3_bucket" "bucket-3" {
  bucket = "hilton-tf-bucket-3"
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}