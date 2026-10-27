package com.bereal.dcimsaver;

import android.app.AndroidAppHelper;
import android.app.Application;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import de.robv.android.xposed.IXposedHookLoadPackage;
import de.robv.android.xposed.XC_MethodHook;
import de.robv.android.xposed.XposedBridge;
import de.robv.android.xposed.XposedHelpers;
import de.robv.android.xposed.callbacks.XC_LoadPackage;

public final class MainHook implements IXposedHookLoadPackage {
    private static final String TARGET_PACKAGE = "com.bereal.ft";
    private static final String TAG = "BeRealDCIM: ";
    private static final Set<String> SAVED_FILES = Collections.synchronizedSet(new HashSet<String>());

    @Override
    public void handleLoadPackage(final XC_LoadPackage.LoadPackageParam lpparam) throws Throwable {
        if (!TARGET_PACKAGE.equals(lpparam.packageName)) {
            return;
        }

        XposedBridge.log(TAG + "Loaded into " + lpparam.packageName);

        // Hook 1: Export any existing .webp files in files/camera/ when Application starts
        XposedHelpers.findAndHookMethod(
                Application.class,
                "onCreate",
                new AppOnCreateHook()
        );

        // Hook 2: Uri.fromFile(File) is called immediately in Llz9;->a right after
        // FileOutputStream.close() finishes writing files/camera/{primary,secondary}_*.webp
        XposedHelpers.findAndHookMethod(
                Uri.class,
                "fromFile",
                File.class,
                new UriFromFileHook()
        );

        // Hook 3: Fallback before File.delete() in case a camera .webp is cleaned up early
        XposedHelpers.findAndHookMethod(
                File.class,
                "delete",
                new FileDeleteHook()
        );
    }

    public static final class AppOnCreateHook extends XC_MethodHook {
        @Override
        protected void afterHookedMethod(MethodHookParam param) {
            Application app = (Application) param.thisObject;
            if (app == null) {
                return;
            }
            File cameraDir = new File(app.getFilesDir(), "camera");
            File[] files = cameraDir.listFiles();
            if (files == null) {
                return;
            }
            for (int i = 0; i < files.length; i++) {
                maybeExportCameraWebp(files[i]);
            }
        }
    }

    public static final class UriFromFileHook extends XC_MethodHook {
        @Override
        protected void afterHookedMethod(MethodHookParam param) {
            File file = (File) param.args[0];
            maybeExportCameraWebp(file);
        }
    }

    public static final class FileDeleteHook extends XC_MethodHook {
        @Override
        protected void beforeHookedMethod(MethodHookParam param) {
            File file = (File) param.thisObject;
            maybeExportCameraWebp(file);
        }
    }

    public static void maybeExportCameraWebp(File file) {
        if (file == null) {
            return;
        }
        String name = file.getName();
        if (!name.endsWith(".webp")) {
            return;
        }
        File parent = file.getParentFile();
        if (parent == null || !"camera".equals(parent.getName())) {
            return;
        }
        if (!file.isFile()) {
            return;
        }
        long length = file.length();
        if (length <= 0L) {
            return;
        }

        String outName = "BeReal_" + name;
        File existingDcim = new File(
                new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM), "BeReal"),
                outName
        );
        if (existingDcim.exists() && existingDcim.length() > 0L) {
            return;
        }

        String key = file.getAbsolutePath() + ":" + file.lastModified() + ":" + length;
        if (!SAVED_FILES.add(key)) {
            return;
        }

        try {
            byte[] data = readAllBytes(file);
            if (data.length == 0) {
                return;
            }
            saveToDcim(outName, data);
        } catch (Throwable t) {
            XposedBridge.log(TAG + "Failed to export " + file.getAbsolutePath() + ": " + t);
        }
    }

    private static byte[] readAllBytes(File file) throws IOException {
        FileInputStream fis = new FileInputStream(file);
        try {
            ByteArrayOutputStream bos = new ByteArrayOutputStream((int) file.length());
            byte[] buf = new byte[8192];
            int n;
            while ((n = fis.read(buf)) != -1) {
                bos.write(buf, 0, n);
            }
            return bos.toByteArray();
        } finally {
            fis.close();
        }
    }

    private static void saveToDcim(String displayName, byte[] data) throws IOException {
        Application app = AndroidAppHelper.currentApplication();
        if (app != null && Build.VERSION.SDK_INT >= 29) {
            ContentResolver resolver = app.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, displayName);
            values.put(MediaStore.MediaColumns.MIME_TYPE, "image/webp");
            values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DCIM + "/BeReal");
            values.put(MediaStore.MediaColumns.IS_PENDING, 1);

            Uri uri = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values);
            if (uri != null) {
                OutputStream os = resolver.openOutputStream(uri);
                if (os != null) {
                    try {
                        os.write(data);
                        os.flush();
                    } finally {
                        os.close();
                    }
                }
                ContentValues done = new ContentValues();
                done.put(MediaStore.MediaColumns.IS_PENDING, 0);
                resolver.update(uri, done, null, null);
                XposedBridge.log(TAG + "Saved " + displayName + " to DCIM/BeReal via MediaStore (" + uri + ")");
                return;
            }
        }

        // Fallback for API < 29 or if ContentResolver insert returned null
        File dcimDir = new File(
                Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM),
                "BeReal"
        );
        if (!dcimDir.exists()) {
            dcimDir.mkdirs();
        }
        File outFile = new File(dcimDir, displayName);
        FileOutputStream fos = new FileOutputStream(outFile);
        try {
            fos.write(data);
            fos.flush();
        } finally {
            fos.close();
        }
        XposedBridge.log(TAG + "Saved " + outFile.getAbsolutePath());
    }
}
