package com.bereal.dcimsaver;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;

public final class ModConfig {
    public static final String PREFS_NAME = "bereal_dcim_prefs";
    public static final String ACTION_SYNC_PREFS = "com.bereal.dcimsaver.ACTION_SYNC_PREFS";
    public static final String EXTRA_SYNC_PREFS = "sync_bereal_dcim_prefs";
    public static final String EXTRA_OPEN_SETTINGS = "open_bereal_dcim_settings";

    public static final int SAVE_MODE_PROCESSED = 0;
    public static final int SAVE_MODE_FULL_RES = 1;
    public static final int SAVE_MODE_BOTH = 2;

    public static final int FORMAT_WEBP_100 = 0;
    public static final int FORMAT_JPEG_100 = 1;
    public static final int FORMAT_PNG = 2;

    public static final int UPLOAD_RES_1080 = 0;
    public static final int UPLOAD_RES_1440 = 1;
    public static final int UPLOAD_RES_2160 = 2;
    public static final int UPLOAD_RES_FULL = 3;

    private static final String KEY_SAVE_MODE = "save_mode";
    private static final String KEY_FULL_RES_FORMAT = "full_res_format";
    private static final String KEY_UPLOAD_RES_PRESET = "upload_res_preset_v2";
    private static final String KEY_UPLOAD_WEBP_QUALITY = "upload_webp_quality";
    private static final String KEY_BYPASS_SIZE_CAP = "bypass_size_cap_v2";
    private static final String KEY_SAVE_BTS_VIDEOS = "save_bts_videos";
    private static final String KEY_SAVE_REALMOJIS = "save_realmojis";

    public int saveMode = SAVE_MODE_BOTH;
    public int fullResFormat = FORMAT_WEBP_100;
    public int uploadResPreset = UPLOAD_RES_1080;
    public int uploadWebpQuality = 100;
    public boolean bypassSizeCap = false;
    public boolean saveBtsVideos = true;
    public boolean saveRealMojis = true;

    public static ModConfig load(Context ctx) {
        ModConfig cfg = new ModConfig();
        if (ctx == null) {
            return cfg;
        }
        try {
            SharedPreferences sp = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            cfg.saveMode = sp.getInt(KEY_SAVE_MODE, SAVE_MODE_BOTH);
            cfg.fullResFormat = sp.getInt(KEY_FULL_RES_FORMAT, FORMAT_WEBP_100);
            cfg.uploadResPreset = sp.getInt(KEY_UPLOAD_RES_PRESET, UPLOAD_RES_1080);
            cfg.uploadWebpQuality = clampQuality(sp.getInt(KEY_UPLOAD_WEBP_QUALITY, 100));
            cfg.bypassSizeCap = sp.getBoolean(KEY_BYPASS_SIZE_CAP, false);
            cfg.saveBtsVideos = sp.getBoolean(KEY_SAVE_BTS_VIDEOS, true);
            cfg.saveRealMojis = sp.getBoolean(KEY_SAVE_REALMOJIS, true);
        } catch (Throwable ignored) {
        }
        return cfg;
    }

    public void save(Context ctx) {
        if (ctx == null) {
            return;
        }
        try {
            SharedPreferences sp = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            sp.edit()
                .putInt(KEY_SAVE_MODE, saveMode)
                .putInt(KEY_FULL_RES_FORMAT, fullResFormat)
                .putInt(KEY_UPLOAD_RES_PRESET, uploadResPreset)
                .putInt(KEY_UPLOAD_WEBP_QUALITY, clampQuality(uploadWebpQuality))
                .putBoolean(KEY_BYPASS_SIZE_CAP, bypassSizeCap)
                .putBoolean(KEY_SAVE_BTS_VIDEOS, saveBtsVideos)
                .putBoolean(KEY_SAVE_REALMOJIS, saveRealMojis)
                .apply();
        } catch (Throwable ignored) {
        }
    }

    public void writeToIntent(Intent intent) {
        if (intent == null) {
            return;
        }
        intent.putExtra(EXTRA_SYNC_PREFS, true);
        intent.putExtra(KEY_SAVE_MODE, saveMode);
        intent.putExtra(KEY_FULL_RES_FORMAT, fullResFormat);
        intent.putExtra(KEY_UPLOAD_RES_PRESET, uploadResPreset);
        intent.putExtra(KEY_UPLOAD_WEBP_QUALITY, clampQuality(uploadWebpQuality));
        intent.putExtra(KEY_BYPASS_SIZE_CAP, bypassSizeCap);
        intent.putExtra(KEY_SAVE_BTS_VIDEOS, saveBtsVideos);
        intent.putExtra(KEY_SAVE_REALMOJIS, saveRealMojis);
    }

    public static ModConfig fromIntent(Intent intent, Context fallbackCtx) {
        ModConfig cfg = load(fallbackCtx);
        if (intent == null || !intent.getBooleanExtra(EXTRA_SYNC_PREFS, false)) {
            return cfg;
        }
        cfg.saveMode = intent.getIntExtra(KEY_SAVE_MODE, cfg.saveMode);
        cfg.fullResFormat = intent.getIntExtra(KEY_FULL_RES_FORMAT, cfg.fullResFormat);
        cfg.uploadResPreset = intent.getIntExtra(KEY_UPLOAD_RES_PRESET, cfg.uploadResPreset);
        cfg.uploadWebpQuality = clampQuality(intent.getIntExtra(KEY_UPLOAD_WEBP_QUALITY, cfg.uploadWebpQuality));
        cfg.bypassSizeCap = intent.getBooleanExtra(KEY_BYPASS_SIZE_CAP, cfg.bypassSizeCap);
        cfg.saveBtsVideos = intent.getBooleanExtra(KEY_SAVE_BTS_VIDEOS, cfg.saveBtsVideos);
        cfg.saveRealMojis = intent.getBooleanExtra(KEY_SAVE_REALMOJIS, cfg.saveRealMojis);
        return cfg;
    }

    public void saveAndBroadcast(Context ctx) {
        save(ctx);
        if (ctx == null) {
            return;
        }
        try {
            Intent b1 = new Intent(ACTION_SYNC_PREFS);
            b1.setPackage("com.bereal.ft");
            writeToIntent(b1);
            ctx.sendBroadcast(b1);

            Intent b2 = new Intent(ACTION_SYNC_PREFS);
            b2.setPackage("com.bereal.dcimsaver");
            writeToIntent(b2);
            ctx.sendBroadcast(b2);
        } catch (Throwable ignored) {
        }
    }

    private static int clampQuality(int q) {
        if (q < 50) return 50;
        if (q > 100) return 100;
        return q;
    }
}
