resource "aws_sqs_queue" "request-handle-queue" {
  name = "request-handle-queue"
}