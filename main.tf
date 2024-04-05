provider "aws" {
  access_key = "test"
  secret_key = "test"
  region     = "us-east-1"


  # only required for non virtual hosted-style endpoint use case.
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs#s3_use_path_style
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_use_path_style           = true

  endpoints {
    s3  = "http://localhost:4566"
    ec2 = "http://localhost:4510"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0d57c0143330e1fa7"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

# Create Bucket
resource "aws_s3_bucket" "b" {
  bucket = "onexlab-bucket-terraform"
}

# Upload an object
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.b.id
  key    = "index.html"
  acl    = "public-read"
  source = "index.html"
}
