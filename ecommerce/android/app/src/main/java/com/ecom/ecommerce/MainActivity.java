
package com.ecom.ecommerce;

import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.provider.Settings;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String FILE_PERMISSION_CHANNEL = "file_permission_channel";

    private MethodChannel.Result requestFilePermissionChannelResult;
    @RequiresApi(api = Build.VERSION_CODES.R)
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
         GeneratedPluginRegistrant.registerWith(flutterEngine);

         new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), FILE_PERMISSION_CHANNEL)
        .setMethodCallHandler(
            (call, result) -> {
                requestFilePermissionChannelResult = result;
                switch (call.method) {
                    case "checkFilePermission": 
                        result.success(Environment.isExternalStorageManager());
                        break;
                    case "request": 
                        requestFilePermissionOnAndroid11();
                }
            }
        );
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        com.ecom.ecommerce.PreventStatusBarExpansion.tryPrevent(this);
    }

    @Override
    protected void onRestart() {
        if (isAndroidSDK30OrAbove() && requestFilePermissionChannelResult != null){
            requestFilePermissionChannelResult.success(Environment.isExternalStorageManager());
        }
        com.ecom.ecommerce.PreventStatusBarExpansion.tryPrevent(this);
        super.onRestart();
    }

    boolean isAndroidSDK30OrAbove(){
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.R;
    }

    void ensureFilePermissionOnAndroid11(){
        if (isAndroidSDK30OrAbove() && !Environment.isExternalStorageManager()){ // Android API is greater than 30
            requestFilePermissionOnAndroid11();
        }
    }
    void requestFilePermissionOnAndroid11(){
        try {
            Intent intent = new Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION);
            intent.addCategory("android.intent.category.DEFAULT");
            intent.setData(Uri.parse(String.format("package:%s", getApplicationContext().getPackageName())));
            startActivityForResult(intent, 99);
        } catch (Exception e) {
            // :(
        }
    }
}