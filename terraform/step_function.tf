data "template_file" "request-handle-sf-tpl" {
  template = "${file("request_handle_sf.tpl")}"
  vars = {
    request_handler_lambda_arn = "${aws_lambda_function.request_handle_lambda.arn}"
    sm_sqs_request_handler_url = "${aws_sqs_queue.request-handle-queue.id}"
  }
}

resource "aws_sfn_state_machine" "request_handle_step_function" {
  definition = "${data.template_file.request-handle-sf-tpl.rendered}"
  name = "request-handle-step-function"
  role_arn = "${aws_iam_role.state_machine_role.arn}"
}
