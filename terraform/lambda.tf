resource "aws_lambda_function" "request_handle_lambda" {
  filename = "../request-handle-lambda/target/request-handle-lambda-1.0.0.jar"
  function_name = "request-handle-lambda"
  handler = "com.aws.request.handler.lambda.RequestHandlerLambda"
  runtime = "java8"
  role = "${aws_iam_role.iam_for_lambda.arn}"
}