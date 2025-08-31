resource "aws_s3_bucket" "bucket" {
  bucket = "hjcc-bucket-lifecycle-teste2"

  tags = {
    Name        = "hjcc-bucket"
    Environment = "Dev"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [ tags ]
  }
}