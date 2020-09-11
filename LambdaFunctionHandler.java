package com.amazonaws.lambda.demo;
import java.util.Map;
import com.amazonaws.services.lambda.runtime.Context;

import com.amazonaws.services.lambda.runtime.RequestHandler;

public class LambdaFunctionHandler implements RequestHandler<Map<String,String>, String> {

    @Override
    public String handleRequest(Map<String,String> event, Context context) {
        context.getLogger().log("User ID is:" + event.get("userId"));
        context.getLogger().log("Password is:" + event.get("pass"));
        if(event.get("userId").equals("Rahul") && event.get("pass").equals("12345678"))
        {
        	return "Success";
        }
        else
        {
        	return "Failure";
        }

        
    }

}
