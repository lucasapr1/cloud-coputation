module "s3" {
  source         = "./modules/s3"
  count          = length(var.s3_bucket_names)
  name           = var.s3_bucket_names[count.index].name
  bucket_cleanup = var.s3_bucket_names[count.index].bucket_cleanup
  environment    = "dev"
}

module "sqs" {
  source             = "./modules/sqs"
  count              = length(var.sqs_queue_names)
  name               = var.sqs_queue_names[count.index].name
  visibility_timeout = var.sqs_queue_names[count.index].visibility_timeout
  environment        = "dev"
}