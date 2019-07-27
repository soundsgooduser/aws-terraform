{
    "Comment": "Request handle step function",
    "StartAt": "RequestHandlerStep",
    "States": {
        "RequestHandlerStep": {
          "Type": "Task",
          "Next": "Finalize",
          "Comment": "Handle incoming request",
          "Resource": "${request_handler_lambda_arn}",
          "InputPath": "$",
          "ResultPath": "$"
        },
        "Finalize": {
            "Type": "Pass",
            "End": true,
            "Comment": "Finalize step function",
            "Result": {
                "status": "Success"
            }
        }
    }
}
