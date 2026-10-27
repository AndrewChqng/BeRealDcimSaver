package com.bereal.dcimsaver;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Bundle;
import android.view.Window;

public class SettingsActivity extends Activity {

    private final BroadcastReceiver syncReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            if (intent != null && ModConfig.ACTION_SYNC_PREFS.equals(intent.getAction())) {
                ModConfig cfg = ModConfig.fromIntent(intent, context);
                cfg.save(context);
                setContentView(SettingsUi.buildSettingsView(SettingsActivity.this, true, null));
            }
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            requestWindowFeature(Window.FEATURE_NO_TITLE);
            if (getWindow() != null) {
                getWindow().setStatusBarColor(0xFF0E0E10);
                getWindow().setNavigationBarColor(0xFF0E0E10);
            }
        } catch (Throwable ignored) {
        }
        setContentView(SettingsUi.buildSettingsView(this, true, null));
        try {
            IntentFilter filter = new IntentFilter(ModConfig.ACTION_SYNC_PREFS);
            if (Build.VERSION.SDK_INT >= 33) {
                registerReceiver(syncReceiver, filter, Context.RECEIVER_EXPORTED);
            } else {
                registerReceiver(syncReceiver, filter);
            }
        } catch (Throwable ignored) {
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        setContentView(SettingsUi.buildSettingsView(this, true, null));
    }

    @Override
    protected void onDestroy() {
        try {
            unregisterReceiver(syncReceiver);
        } catch (Throwable ignored) {
        }
        super.onDestroy();
    }
}
