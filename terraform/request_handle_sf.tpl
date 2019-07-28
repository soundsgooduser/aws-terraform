{
   "Comment":"Request handle step function",
   "StartAt":"RequestHandlerStep",
   "States":{
      "RequestHandlerStep":{
         "Type":"Task",
         "Next":"SendToSQS",
         "Comment":"Handle incoming request",
         "Resource":"${request_handler_lambda_arn}",
         "InputPath":"$",
         "ResultPath":"$"
      },
      "SendToSQS":{
         "Type":"Task",
         "End":true,
         "Resource":"arn:aws:states:::sqs:sendMessage",
         "Parameters":{
            "MessageBody.$":"$",
            "QueueUrl":"${sm_sqs_request_handler_url}"
         },
         "Comment":"Send message to SQS for further processing"
      }
   }
}