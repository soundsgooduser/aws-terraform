resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role" "state_machine_role" {
  name = "iam_for_sf_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "sts:AssumeRole"
      ],
      "Principal": {
        "Service": "states.us-east-1.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "state_machine_policy" {
  name = "iam_for_sf_role-sm"
  path = "/"
  description = "state_machine_policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Effect": "Allow",
        "Action": [
            "lambda:InvokeFunction"
        ],
        "Resource": "${aws_lambda_function.request_handle_lambda.arn}"
    },
    {
      "Effect":"Allow",
      "Action":"sqs:SendMessage",
      "Resource":"${aws_sqs_queue.request-handle-queue.arn}"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "state_machine_policy" {
  name = "iam_for_sf_role-psm"
  role = "${aws_iam_role.state_machine_role.id}"
  policy = "${aws_iam_policy.state_machine_policy.policy}"
}