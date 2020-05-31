package com.example.v2

import androidx.annotation.NonNull
import com.pycampers.flutter_cognito_plugin.CognitoPluginActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : CognitoPluginActivity("myapp") {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}