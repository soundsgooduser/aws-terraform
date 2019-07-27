package com.aws.request.handler.lambda;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.aws.request.handler.lambda.model.Request;
import com.aws.request.handler.lambda.model.Response;

public class RequestHandlerLambda implements RequestHandler<Request, Response> {
    public Response handleRequest(Request request, Context context) {
        Response response = new Response();
        response.setStatus("success");
        return response;
    }
}
