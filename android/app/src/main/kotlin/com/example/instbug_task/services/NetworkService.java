package com.example.instbug_task.services;

 
import com.example.instbug_task.models.NetworkResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

public class NetworkService {


    public static class RequestOptions {
        final String url;
        final Map<String, String> headers;
        final String method;


        RequestOptions(String url, String method, Map<String, String> headers) {
            this.headers = headers;
            this.url = url;
            this.method = method;
        }
    }

    public interface Callback {
        void onResponse(NetworkResponse response);

        void onFailure(IOException e);
    }

    // todo we can implement post request or put or delete ,,etc methods  currently i need get only so that i implemented enqueue method for get
    public static synchronized void enqueue(RequestOptions requestOptions, Callback callback) {

        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                HttpURLConnection urlConnection = null;
                BufferedReader reader = null;
                NetworkResponse response = null;

                try {
                    URL url = new URL(requestOptions.url);
                    urlConnection = (HttpURLConnection) url.openConnection();
                    urlConnection.setRequestMethod(requestOptions.method);
                    for (Map.Entry<String, String> entry : requestOptions.headers.entrySet()) {
                        urlConnection.setRequestProperty(entry.getKey(), entry.getValue());
                    }

                    InputStream inputStream = urlConnection.getInputStream();

                    StringBuilder buffer = new StringBuilder();
                    if (inputStream != null) {
                        reader = new BufferedReader(new InputStreamReader(inputStream));
                        String line;
                        while ((line = reader.readLine()) != null) {
                            buffer.append(line).append("\n");
                        }

 
                        response = new NetworkResponse(buffer.toString(), urlConnection.getResponseCode());
                        callback.onResponse(response);
                    }
                } catch (IOException e) {
                    callback.onFailure(e);
                } finally {
                    if (urlConnection != null) {
                        urlConnection.disconnect();
                    }
                    if (reader != null) {
                        try {
                            reader.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        });

        thread.start();
    }
}
