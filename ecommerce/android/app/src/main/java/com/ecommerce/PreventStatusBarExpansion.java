package com.ecommerce;

import android.content.Intent;
import android.net.Uri;
import android.provider.Settings;
import android.view.WindowManager;
import android.content.Context;
import android.app.Activity;
import android.view.ViewGroup;
import android.view.MotionEvent;
import android.view.Gravity;
import android.graphics.PixelFormat;
import android.graphics.Color;

import android.os.Build;

/**
 * Class that exposes {tryPrevent} method to prevent status bar expansion.
 * <p>
 * This is done by creating a transparent overlaying view on status bar that prevents
 * intercepting touch events forwarded to status bar. So status bar never receives touch events
 * and never expands
 * <p>
 * Required permission: ACTION_MANAGE_OVERLAY_PERMISSION, use {ensureOverlayPermission} to ensure the permission granted
 */
class PreventStatusBarExpansion {
    private static boolean isPreventing = false;

    /**
     * Try call {prevent}, and request overlay permission if failed
     * */
    public static void tryPrevent(Activity activity) {
        try {
            if (!isPreventing){
                prevent(activity);
                isPreventing = true;
            }
        } catch (Exception e){
            requestOverlayPermission(activity);
        }
    }

    /**
     * Prevent status bar expansion
     *
     * @param context is activity context
     */
    private static void prevent(Context context) {
        WindowManager manager = ((WindowManager) context.getApplicationContext()
                .getSystemService(Context.WINDOW_SERVICE));

        WindowManager.LayoutParams localLayoutParams = new WindowManager.LayoutParams();

        int layoutType;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            layoutType = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY;
        } else {
            layoutType = WindowManager.LayoutParams.TYPE_SYSTEM_ERROR;
        }
        localLayoutParams.type = layoutType;
        localLayoutParams.gravity = Gravity.TOP;
        localLayoutParams.flags =
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE |
                        // this is to enable the notification to recieve touch events
                        WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL |
                        WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN;

        localLayoutParams.width = WindowManager.LayoutParams.MATCH_PARENT;

        localLayoutParams.height = getStatusBarHeight(context);

        localLayoutParams.format = PixelFormat.TRANSPARENT;

        PreventInterceptTouchViewGroup preventingView = new PreventInterceptTouchViewGroup(context);

        manager.addView(preventingView, localLayoutParams);
    }

    /**
     * Return status bar height by getting from 'status_bar_height' dimen resources.
     * If 'status_bar_height' dimen resouce doesn't exists, return 25 as default
     */
    private static int getStatusBarHeight(Context context) {
        Activity activity = (Activity) context;
        int resId = activity.getResources().getIdentifier("status_bar_height", "dimen", "android");
        if (resId > 0) {
            return activity.getResources().getDimensionPixelSize(resId);
        }
        return 25; // default height
    }


    /**
     * Request the permission
     */
    public static void requestOverlayPermission(Activity activity) {
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M) {
            Intent intent;
            intent = new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, Uri.parse("package:" + activity.getPackageName()));
            activity.startActivityForResult(intent, 0);
        }
    }

    static class PreventInterceptTouchViewGroup extends ViewGroup {
        public PreventInterceptTouchViewGroup(Context context) {
            super(context);
        }

        @Override
        protected void onLayout(boolean changed, int l, int t, int r, int b) {
        }

        @Override
        public boolean onInterceptTouchEvent(MotionEvent ev) {
            // return true to prenvent intercept touch event to overlayed view
            return true;
        }
    }
}
