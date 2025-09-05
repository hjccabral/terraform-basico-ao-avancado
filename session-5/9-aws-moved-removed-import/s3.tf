
##################### MOVED #####################

//resource "aws_s3_bucket" "bucket1" {
//  bucket = "hjccterraformhjcc1"
//}

resource "aws_s3_bucket" "teste" {
  bucket = "hjccterraformhjcc1"
}

moved {
  from = aws_s3_bucket.bucket1
  to   = aws_s3_bucket.teste
}

##################### REMOVED #####################

//resource "aws_s3_bucket" "bucket2" {
//  bucket = "hjccterraformhjcc2"
//}

# removed {
#   from = aws_s3_bucket.bucket2

#   lifecycle {
#     destroy = false
#   }
# }

##################### IMPORT #####################

resource "aws_s3_bucket" "bucket2" {
  bucket = "hjccterraformhjcc2"
}

import {
    to   = aws_s3_bucket.bucket2
    id   = "hjccterraformhjcc2"
}

##################################################

resource "aws_s3_bucket" "bucket3" {
  bucket = "hjccterraformhjcc3"
}

