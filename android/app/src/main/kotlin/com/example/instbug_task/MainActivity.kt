package com.example.instbug_task

import android.content.res.Configuration
import android.os.Bundle
import android.os.PersistableBundle
import androidx.annotation.NonNull
import com.example.instbug_task.services.HttpMethodCallHandler
import com.example.instbug_task.services.NetworkService
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // register method handler
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "com.http"
        ).setMethodCallHandler(HttpMethodCallHandler())
    }


}
