resource "aws_s3_bucket" "mlaane" {
  bucket = "mlaane"
  acl    = "public-read"
  policy = data.aws_iam_policy_document.mlaane_s3.json

  website {
    index_document = "index.html"
    error_document = "error.html"

  }
  
  tags = {
    User = "mlaane"
  }
}