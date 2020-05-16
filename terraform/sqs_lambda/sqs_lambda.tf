module "sqs_lambda" {

  function_name   = "CloudfrontViewerTlsProtocol"
  source_code_dir = "${path.module}/source"
  handler         = "reflex_aws_cloudfront_viewier_tls_protocol.lambda_handler"
  lambda_runtime  = "python3.7"
  environment_variable_map = {
    SNS_TOPIC = var.sns_topic_arn,
  }

  # updateDistribution
  #   custom_lambda_policy = <<EOF
  # {}
  # EOF

  queue_name    = "CloudfrontViewerTlsProtocol"
  delay_seconds = 0

  target_id = "CloudfrontViewerTlsProtocol"

  sns_topic_arn  = var.sns_topic_arn
  sqs_kms_key_id = var.reflex_kms_key_id
}