package com.example.instbug_task.models;

public class NetworkResponse {
    public final String data;
    public final int statusCode;

    public NetworkResponse(String data, int statusCode) {
        this.data = data;
        this.statusCode = statusCode;
    }


}
