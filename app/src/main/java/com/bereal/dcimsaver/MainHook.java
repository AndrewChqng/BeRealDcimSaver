package com.bereal.dcimsaver;

import android.app.Activity;
import android.app.AndroidAppHelper;
import android.app.Application;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import de.robv.android.xposed.IXposedHookLoadPackage;
import de.robv.android.xposed.XC_MethodHook;
import de.robv.android.xposed.XposedBridge;
import de.robv.android.xposed.XposedHelpers;
import de.robv.android.xposed.callbacks.XC_LoadPackage.LoadPackageParam;

public class MainHook implements IXposedHookLoadPackage {
    private static final String TAG = "[BeRealDcimSaver] ";
    private static final String TARGET_PACKAGE = "com.bereal.ft";
    private static final Set<String> EXPORTED = Collections.synchronizedSet(new HashSet<String>());

    private Handler mainHandler;
    private Runnable pendingLongPress;
    private float downX;
    private float downY;
    private boolean trackingHeaderPress;

    private Handler getMainHandler() {
        if (mainHandler == null) {
            mainHandler = new Handler(Looper.getMainLooper());
        }
        return mainHandler;
    }

    @Override
    public void handleLoadPackage(final LoadPackageParam lpparam) throws Throwable {
        if (lpparam == null || !TARGET_PACKAGE.equals(lpparam.packageName)) {
            return;
        }
        XposedBridge.log(TAG + "Loaded into " + lpparam.packageName);

        hookApplicationLifecycle();
        hookMainActivityUi();
        hookCoreDatabase(lpparam.classLoader);
        hookCameraDownscaleAndFullRes(lpparam.classLoader);
        hookWebpCompressorAndSizeCap(lpparam.classLoader);
        hookFileExportTriggers();
    }

    private void hookApplicationLifecycle() {
        try {
            XposedHelpers.findAndHookMethod(
                Application.class,
                "onCreate",
                new XC_MethodHook() {
                    @Override
                    protected void afterHookedMethod(MethodHookParam param) throws Throwable {
                        final Application app = (Application) param.thisObject;
                        if (app == null || !TARGET_PACKAGE.equals(app.getPackageName())) {
                            return;
                        }
                        registerSettingsSyncReceiver(app);
                        new Thread(new Runnable() {
                            @Override
                            public void run() {
                                scanExistingDirectories(app);
                            }
                        }).start();
                    }
                }
            );
        } catch (Throwable t) {
            XposedBridge.log(t);
        }
    }

    private void registerSettingsSyncReceiver(Application app) {
        try {
            BroadcastReceiver receiver = new BroadcastReceiver() {
                @Override
                public void onReceive(Context context, Intent intent) {
                    if (intent != null && ModConfig.ACTION_SYNC_PREFS.equals(intent.getAction())) {
                        ModConfig cfg = ModConfig.fromIntent(intent, context);
                        cfg.save(context);
                        XposedBridge.log(TAG + "Synced settings via broadcast (saveMode="
                            + cfg.saveMode + ", uploadRes=" + cfg.uploadResPreset
                            + ", quality=" + cfg.uploadWebpQuality + ")");
                    }
                }
            };
            IntentFilter filter = new IntentFilter(ModConfig.ACTION_SYNC_PREFS);
            if (Build.VERSION.SDK_INT >= 33) {
                app.registerReceiver(receiver, filter, Context.RECEIVER_EXPORTED);
            } else {
                app.registerReceiver(receiver, filter);
            }
        } catch (Throwable t) {
            XposedBridge.log(t);
        }
    }

    private void hookMainActivityUi() {
        try {
            XposedHelpers.findAndHookMethod(
                Activity.class,
                "onResume",
                new XC_MethodHook() {
                    @Override
                    protected void afterHookedMethod(MethodHookParam param) throws Throwable {
                        Activity activity = (Activity) param.thisObject;
                        if (activity == null || !isBeRealMainActivity(activity)) {
                            return;
                        }
                        Intent intent = activity.getIntent();
                        if (intent != null && intent.getBooleanExtra(ModConfig.EXTRA_SYNC_PREFS, false)) {
                            ModConfig cfg = ModConfig.fromIntent(intent, activity);
                            cfg.save(activity);
                            intent.removeExtra(ModConfig.EXTRA_SYNC_PREFS);
                            XposedBridge.log(TAG + "Synced settings from launch intent");
                            if (intent.getBooleanExtra(ModConfig.EXTRA_OPEN_DOWNLOADER, false)) {
                                intent.removeExtra(ModConfig.EXTRA_OPEN_DOWNLOADER);
                                SettingsUi.showFeedDownloaderDialog(activity);
                            } else if (intent.getBooleanExtra(ModConfig.EXTRA_OPEN_SETTINGS, false)) {
                                intent.removeExtra(ModConfig.EXTRA_OPEN_SETTINGS);
                                SettingsUi.showInAppDialog(activity);
                            }
                        }
                    }
                }
            );

            XposedHelpers.findAndHookMethod(
                Activity.class,
                "dispatchTouchEvent",
                MotionEvent.class,
                new XC_MethodHook() {
                    @Override
                    protected void beforeHookedMethod(MethodHookParam param) throws Throwable {
                        final Activity activity = (Activity) param.thisObject;
                        if (activity == null || !isBeRealMainActivity(activity)) {
                            return;
                        }
                        MotionEvent ev = (MotionEvent) param.args[0];
                        if (ev == null) {
                            return;
                        }
                        handleHeaderLongPressGesture(activity, ev);
                    }
                }
            );
        } catch (Throwable t) {
            XposedBridge.log(t);
        }
    }

    private boolean isBeRealMainActivity(Activity activity) {
        String name = activity.getClass().getName();
        return "bereal.app.MainActivity".equals(name) || name.endsWith(".MainActivity");
    }

    private void handleHeaderLongPressGesture(final Activity activity, MotionEvent ev) {
        int action = ev.getActionMasked();
        float density = activity.getResources().getDisplayMetrics().density;
        int screenW = activity.getResources().getDisplayMetrics().widthPixels;

        if (action == MotionEvent.ACTION_DOWN) {
            float x = ev.getRawX();
            float y = ev.getRawY();
            float minX = screenW * 0.28f;
            float maxX = screenW * 0.72f;
            float maxY = 115f * density;

            if (x >= minX && x <= maxX && y >= 0 && y <= maxY) {
                downX = x;
                downY = y;
                trackingHeaderPress = true;
                cancelPendingLongPress();
                pendingLongPress = new Runnable() {
                    @Override
                    public void run() {
                        trackingHeaderPress = false;
                        try {
                            View decor = activity.getWindow() != null ? activity.getWindow().getDecorView() : null;
                            if (decor != null) {
                                decor.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                            }
                        } catch (Throwable ignored) {
                        }
                        SettingsUi.showInAppDialog(activity);
                    }
                };
                getMainHandler().postDelayed(pendingLongPress, 600L);
            } else {
                trackingHeaderPress = false;
            }
        } else if (action == MotionEvent.ACTION_MOVE && trackingHeaderPress) {
            float dx = Math.abs(ev.getRawX() - downX);
            float dy = Math.abs(ev.getRawY() - downY);
            float slop = 20f * density;
            if (dx > slop || dy > slop) {
                trackingHeaderPress = false;
                cancelPendingLongPress();
            }
        } else if (action == MotionEvent.ACTION_UP
                || action == MotionEvent.ACTION_CANCEL
                || action == MotionEvent.ACTION_POINTER_DOWN) {
            trackingHeaderPress = false;
            cancelPendingLongPress();
        }
    }

    private void cancelPendingLongPress() {
        if (pendingLongPress != null && mainHandler != null) {
            mainHandler.removeCallbacks(pendingLongPress);
            pendingLongPress = null;
        }
    }

    private void hookCoreDatabase(ClassLoader cl) {
        try {
            Class<?> coreDbClass = XposedHelpers.findClassIfExists(
                "bereal.app.platform.data.core.storage.data.db.CoreDatabase", cl
            );
            if (coreDbClass != null) {
                XposedBridge.hookAllConstructors(coreDbClass, new XC_MethodHook() {
                    @Override
                    protected void afterHookedMethod(MethodHookParam param) throws Throwable {
                        if (param.thisObject != null) {
                            FeedDownloader.setCoreDatabase(param.thisObject);
                        }
                    }
                });
            }

            Class<?> roomDbClass = XposedHelpers.findClassIfExists(
                "androidx.room.RoomDatabase", cl
            );
            if (roomDbClass != null) {
                XposedBridge.hookAllMethods(roomDbClass, "init", new XC_MethodHook() {
                    @Override
                    protected void afterHookedMethod(MethodHookParam param) throws Throwable {
                        if (param.thisObject != null
                                && param.thisObject.getClass().getName().contains("CoreDatabase")) {
                            FeedDownloader.setCoreDatabase(param.thisObject);
                        }
                    }
                });
            }
        } catch (Throwable t) {
            XposedBridge.log(t);
        }
    }

    private void hookCameraDownscaleAndFullRes(ClassLoader cl) {
        try {
            Class<?> gf2Class = XposedHelpers.findClassIfExists("gf2", cl);
            if (gf2Class == null) {
                XposedBridge.log(TAG + "Could not find gf2 class for full-res / resolution hook");
                return;
            }
            XposedHelpers.findAndHookMethod(
                gf2Class,
                "a",
                Bitmap.class,
                float.class,
                boolean.class,
                int.class,
                int.class,
                new XC_MethodHook() {
                    @Override
                    protected void beforeHookedMethod(MethodHookParam param) throws Throwable {
                        Bitmap src = (Bitmap) param.args[0];
                        if (src == null || src.isRecycled()) {
                            return;
                        }
                        float rotation = (Float) param.args[1];
                        boolean flipH = (Boolean) param.args[2];
                        int reqW = (Integer) param.args[3];
                        int reqH = (Integer) param.args[4];

                        Context ctx = AndroidAppHelper.currentApplication();
                        final ModConfig cfg = ModConfig.load(ctx);

                        // 1. Full-Resolution Raw Sensor Dump before BeReal downscales & recycles src
                        if (cfg.saveMode == ModConfig.SAVE_MODE_FULL_RES
                                || cfg.saveMode == ModConfig.SAVE_MODE_BOTH) {
                            try {
                                Matrix m = new Matrix();
                                if (rotation != 0f) {
                                    m.postRotate(rotation);
                                }
                                if (flipH) {
                                    m.postScale(-1f, 1f);
                                }
                                Bitmap fullRes = Bitmap.createBitmap(
                                    src, 0, 0, src.getWidth(), src.getHeight(), m, true
                                );
                                if (fullRes == src) {
                                    Bitmap.Config bc = src.getConfig() != null
                                        ? src.getConfig() : Bitmap.Config.ARGB_8888;
                                    fullRes = src.copy(bc, false);
                                }
                                final Bitmap toSave = fullRes;
                                final String role = flipH ? "secondary" : "primary";
                                final int fmt = cfg.fullResFormat;
                                new Thread(new Runnable() {
                                    @Override
                                    public void run() {
                                        exportFullResBitmap(toSave, role, fmt);
                                    }
                                }).start();
                            } catch (Throwable t) {
                                XposedBridge.log(t);
                            }
                        }

                        // 2. Override Uploaded BeReal Target Resolution (default 1080x1440)
                        if (reqW == 1080 && reqH == 1440) {
                            if (cfg.uploadResPreset == ModConfig.UPLOAD_RES_1440) {
                                param.args[3] = 1440;
                                param.args[4] = 1920;
                                XposedBridge.log(TAG + "Boosted upload target resolution to 1440x1920 (2K)");
                            } else if (cfg.uploadResPreset == ModConfig.UPLOAD_RES_2160) {
                                param.args[3] = 2160;
                                param.args[4] = 2880;
                                XposedBridge.log(TAG + "Boosted upload target resolution to 2160x2880 (4K)");
                            } else if (cfg.uploadResPreset == ModConfig.UPLOAD_RES_FULL) {
                                boolean swapped = (Math.round(Math.abs(rotation)) % 180) != 0;
                                int rotW = swapped ? src.getHeight() : src.getWidth();
                                int rotH = swapped ? src.getWidth() : src.getHeight();
                                int fullW = rotW;
                                int fullH = (rotW * 4) / 3;
                                if (fullH > rotH) {
                                    fullH = rotH;
                                    fullW = (rotH * 3) / 4;
                                }
                                if (fullW > 0 && fullH > 0) {
                                    param.args[3] = fullW;
                                    param.args[4] = fullH;
                                    XposedBridge.log(TAG + "Boosted upload target resolution to Full Sensor 3:4 ("
                                        + fullW + "x" + fullH + ")");
                                }
                            }
                        }
                    }
                }
            );
        } catch (Throwable t) {
            XposedBridge.log(t);
        }
    }

    private void hookWebpCompressorAndSizeCap(final ClassLoader cl) {
        try {
            Class<?> lz9Class = XposedHelpers.findClassIfExists("lz9", cl);
            Class<?> dz9Class = XposedHelpers.findClassIfExists("dz9", cl);
            if (lz9Class == null || dz9Class == null) {
                XposedBridge.log(TAG + "Could not find lz9/dz9 classes for WebP quality hook");
                return;
            }
            XposedHelpers.findAndHookMethod(
                lz9Class,
                "a",
                Bitmap.class,
                dz9Class,
                new XC_MethodHook() {
                    @Override
                    protected void beforeHookedMethod(MethodHookParam param) throws Throwable {
                        Object dz9 = param.args[1];
                        if (dz9 == null) {
                            return;
                        }
                        Context ctx = AndroidAppHelper.currentApplication();
                        ModConfig cfg = ModConfig.load(ctx);

                        // Override initial compression quality (default 90 -> user setting 50..100)
                        XposedHelpers.setIntField(dz9, "d", cfg.uploadWebpQuality);

                        // Bypass 700 KB size cap (replace LimitedTo with kvb.a Unlimited)
                        if (cfg.bypassSizeCap) {
                            Class<?> kvbClass = XposedHelpers.findClassIfExists("kvb", cl);
                            if (kvbClass != null) {
                                Object unlimited = XposedHelpers.getStaticObjectField(kvbClass, "a");
                                if (unlimited != null) {
                                    XposedHelpers.setObjectField(dz9, "c", unlimited);
                                }
                            }
                        }
                        XposedBridge.log(TAG + "Configured WebP encoder: quality="
                            + cfg.uploadWebpQuality + "%, bypass700KB=" + cfg.bypassSizeCap);
                    }
                }
            );
        } catch (Throwable t) {
            XposedBridge.log(t);
        }
    }

    private void hookFileExportTriggers() {
        try {
            XposedHelpers.findAndHookMethod(
                Uri.class,
                "fromFile",
                File.class,
                new XC_MethodHook() {
                    @Override
                    protected void afterHookedMethod(MethodHookParam param) throws Throwable {
                        if (param.args.length > 0 && param.args[0] instanceof File) {
                            maybeExportFile((File) param.args[0]);
                        }
                    }
                }
            );

            XposedHelpers.findAndHookMethod(
                File.class,
                "delete",
                new XC_MethodHook() {
                    @Override
                    protected void beforeHookedMethod(MethodHookParam param) throws Throwable {
                        if (param.thisObject instanceof File) {
                            maybeExportFile((File) param.thisObject);
                        }
                    }
                }
            );
        } catch (Throwable t) {
            XposedBridge.log(t);
        }
    }

    private static void scanExistingDirectories(Context ctx) {
        try {
            File cameraDir = new File(ctx.getFilesDir(), "camera");
            scanDirectory(cameraDir);
            File realMojiDir = new File(ctx.getCacheDir(), "realmojis_temp");
            scanDirectory(realMojiDir);
        } catch (Throwable t) {
            XposedBridge.log(t);
        }
    }

    private static void scanDirectory(File dir) {
        if (dir == null || !dir.exists() || !dir.isDirectory()) {
            return;
        }
        File[] files = dir.listFiles();
        if (files == null) {
            return;
        }
        for (File f : files) {
            maybeExportFile(f);
        }
    }

    public static void maybeExportFile(File file) {
        try {
            if (file == null || !file.exists() || !file.isFile()) {
                return;
            }
            long len = file.length();
            if (len <= 1024L) {
                return;
            }
            String path = file.getAbsolutePath();
            String name = file.getName();
            Context ctx = AndroidAppHelper.currentApplication();
            ModConfig cfg = ModConfig.load(ctx);

            boolean isCameraWebp = path.contains("/files/camera/") && name.endsWith(".webp");
            boolean isCameraMp4 = path.contains("/files/camera/") && name.endsWith(".mp4");
            boolean isRealMojiWebp = path.contains("/realmojis_temp/") && name.endsWith(".webp");

            if (!isCameraWebp && !isCameraMp4 && !isRealMojiWebp) {
                return;
            }

            if (isCameraWebp) {
                if (cfg.saveMode != ModConfig.SAVE_MODE_PROCESSED
                        && cfg.saveMode != ModConfig.SAVE_MODE_BOTH) {
                    return;
                }
            } else if (isCameraMp4) {
                if (!cfg.saveBtsVideos) {
                    return;
                }
            } else if (isRealMojiWebp) {
                if (!cfg.saveRealMojis) {
                    return;
                }
            }

            String key = path + ":" + len;
            if (!EXPORTED.add(key)) {
                return;
            }

            String outPrefix = isRealMojiWebp ? "BeReal_realmoji_" : "BeReal_";
            String outName = outPrefix + name;
            String mime = isCameraMp4 ? "video/mp4" : "image/webp";

            boolean saved = false;
            if (ctx != null && Build.VERSION.SDK_INT >= 29) {
                saved = saveFileViaMediaStore(ctx, file, outName, mime, isCameraMp4);
            }
            if (!saved) {
                saved = saveFileDirectToDcim(file, outName);
            }
            if (!saved) {
                EXPORTED.remove(key);
            }
        } catch (Throwable t) {
            XposedBridge.log(t);
        }
    }

    private static void exportFullResBitmap(Bitmap bmp, String role, int format) {
        if (bmp == null || bmp.isRecycled()) {
            return;
        }
        try {
            Context ctx = AndroidAppHelper.currentApplication();
            if (ctx == null) {
                return;
            }
            String ext;
            String mime;
            Bitmap.CompressFormat compressFormat;
            if (format == ModConfig.FORMAT_JPEG_100) {
                ext = ".jpg";
                mime = "image/jpeg";
                compressFormat = Bitmap.CompressFormat.JPEG;
            } else if (format == ModConfig.FORMAT_PNG) {
                ext = ".png";
                mime = "image/png";
                compressFormat = Bitmap.CompressFormat.PNG;
            } else {
                ext = ".webp";
                mime = "image/webp";
                if (Build.VERSION.SDK_INT >= 30) {
                    compressFormat = Bitmap.CompressFormat.WEBP_LOSSY;
                } else {
                    compressFormat = getLegacyWebpFormat();
                }
            }

            String outName = "BeReal_fullres_" + role + "_" + System.currentTimeMillis() + ext;
            ContentResolver resolver = ctx.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, outName);
            values.put(MediaStore.MediaColumns.MIME_TYPE, mime);
            if (Build.VERSION.SDK_INT >= 29) {
                values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DCIM + "/BeReal");
                values.put(MediaStore.MediaColumns.IS_PENDING, 1);
            }

            Uri uri = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values);
            if (uri != null) {
                OutputStream os = resolver.openOutputStream(uri);
                if (os != null) {
                    try {
                        bmp.compress(compressFormat, 100, os);
                        os.flush();
                    } finally {
                        os.close();
                    }
                    if (Build.VERSION.SDK_INT >= 29) {
                        ContentValues done = new ContentValues();
                        done.put(MediaStore.MediaColumns.IS_PENDING, 0);
                        resolver.update(uri, done, null, null);
                    }
                    XposedBridge.log(TAG + "Exported full-res sensor image ("
                        + bmp.getWidth() + "x" + bmp.getHeight() + ") -> DCIM/BeReal/" + outName);
                }
            }
        } catch (Throwable t) {
            XposedBridge.log(t);
        } finally {
            try {
                if (!bmp.isRecycled()) {
                    bmp.recycle();
                }
            } catch (Throwable ignored) {
            }
        }
    }

    @SuppressWarnings("deprecation")
    private static Bitmap.CompressFormat getLegacyWebpFormat() {
        return Bitmap.CompressFormat.WEBP;
    }

    private static boolean saveFileViaMediaStore(
        Context ctx,
        File src,
        String outName,
        String mime,
        boolean isVideo
    ) {
        try {
            ContentResolver resolver = ctx.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, outName);
            values.put(MediaStore.MediaColumns.MIME_TYPE, mime);
            values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DCIM + "/BeReal");
            values.put(MediaStore.MediaColumns.IS_PENDING, 1);

            Uri collection = isVideo
                ? MediaStore.Video.Media.EXTERNAL_CONTENT_URI
                : MediaStore.Images.Media.EXTERNAL_CONTENT_URI;

            Uri itemUri = resolver.insert(collection, values);
            if (itemUri == null) {
                return false;
            }
            OutputStream os = resolver.openOutputStream(itemUri);
            if (os == null) {
                return false;
            }
            FileInputStream fis = new FileInputStream(src);
            try {
                byte[] buf = new byte[8192];
                int n;
                while ((n = fis.read(buf)) > 0) {
                    os.write(buf, 0, n);
                }
                os.flush();
            } finally {
                fis.close();
                os.close();
            }

            ContentValues done = new ContentValues();
            done.put(MediaStore.MediaColumns.IS_PENDING, 0);
            resolver.update(itemUri, done, null, null);
            XposedBridge.log(TAG + "Exported via MediaStore -> DCIM/BeReal/" + outName);
            return true;
        } catch (Throwable t) {
            XposedBridge.log(t);
            return false;
        }
    }

    private static boolean saveFileDirectToDcim(File src, String outName) {
        try {
            File dcim = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM);
            File berealDir = new File(dcim, "BeReal");
            if (!berealDir.exists()) {
                berealDir.mkdirs();
            }
            File dst = new File(berealDir, outName);
            if (dst.exists() && dst.length() == src.length()) {
                return true;
            }
            FileInputStream fis = new FileInputStream(src);
            FileOutputStream fos = new FileOutputStream(dst);
            try {
                byte[] buf = new byte[8192];
                int n;
                while ((n = fis.read(buf)) > 0) {
                    fos.write(buf, 0, n);
                }
                fos.getFD().sync();
            } finally {
                fis.close();
                fos.close();
            }
            XposedBridge.log(TAG + "Exported direct -> " + dst.getAbsolutePath());
            return true;
        } catch (Throwable t) {
            XposedBridge.log(t);
            return false;
        }
    }
}
