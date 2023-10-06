package com.example.instbug_task.services;

import androidx.annotation.NonNull;

import com.example.instbug_task.models.NetworkResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class HttpMethodCallHandler implements MethodChannel.MethodCallHandler {
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {

        if (call.method.equals("GET")) {
            final Map<String, Object> arguments = (Map<String, Object>) call.arguments;

            NetworkService.RequestOptions requestOptions = new NetworkService.RequestOptions(String.valueOf(arguments.get("url")),
                    "GET", (Map<String, String>) arguments.get("headers"));

            NetworkService.enqueue(
                    requestOptions, new NetworkService.Callback() {
                        @Override
                        public void onResponse(NetworkResponse response) {
                            Map<String, Object> responseDetails = new HashMap<String, Object>();
                            responseDetails.put("statusCode", response.statusCode);
                            responseDetails.put("data", response.data);
                            result.success(responseDetails);
                        }

                        @Override
                        public void onFailure(IOException e) {
                            result.error("100", e.getMessage(), "");
                        }
                    });


        }
    }
}
