package com.bereal.dcimsaver;

import android.app.AndroidAppHelper;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import de.robv.android.xposed.XposedBridge;
import de.robv.android.xposed.XposedHelpers;

public final class FeedDownloader {
    private static final String TAG = "[BeRealDcimSaver] ";
    private static volatile Object sCoreDatabase;

    public static final class FeedPost {
        public String postId;
        public String ownerId;
        public String userName;
        public String fullName;
        public long takenAt;
        public long postedAt;
        public Double latitude;
        public Double longitude;
        public String caption;
        public String primaryPictureUrl;
        public String secondaryPictureUrl;
        public String primaryBtsUrl;
        public String secondaryBtsUrl;
        public String primaryVideoUrl;
        public String secondaryVideoUrl;

        public String getDisplayUser() {
            if (userName != null && !userName.trim().isEmpty()) {
                if (fullName != null && !fullName.trim().isEmpty() && !fullName.equals(userName)) {
                    return "@" + userName + " (" + fullName + ")";
                }
                return "@" + userName;
            }
            if (fullName != null && !fullName.trim().isEmpty()) {
                return fullName;
            }
            return ownerId != null ? ownerId : "unknown_user";
        }

        public String getSafeUsername() {
            String raw = (userName != null && !userName.trim().isEmpty())
                ? userName
                : (ownerId != null ? ownerId : "user");
            return raw.replaceAll("[^a-zA-Z0-9._-]", "_");
        }

        public String getFormattedTime() {
            if (takenAt <= 0L) {
                return "";
            }
            long ms = ExifHelper.normalizeEpochMs(takenAt);
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("MMM d, HH:mm", Locale.US);
                return sdf.format(new Date(ms));
            } catch (Throwable ignored) {
                return String.valueOf(takenAt);
            }
        }

        public boolean hasVideoOrBts() {
            return isNonEmpty(primaryBtsUrl)
                || isNonEmpty(secondaryBtsUrl)
                || isNonEmpty(primaryVideoUrl)
                || isNonEmpty(secondaryVideoUrl);
        }
    }

    public interface PostsCallback {
        void onPostsLoaded(List<FeedPost> posts, String error);
    }

    public static void setCoreDatabase(Object db) {
        if (db != null && sCoreDatabase != db) {
            sCoreDatabase = db;
            XposedBridge.log(TAG + "Captured CoreDatabase instance: " + db.getClass().getName());
        }
    }

    public static boolean hasDatabase() {
        return sCoreDatabase != null;
    }

    public static void loadFeedPostsAsync(final PostsCallback callback) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                final List<FeedPost> list = new ArrayList<FeedPost>();
                String err = null;
                try {
                    for (int i = 0; i < 30 && sCoreDatabase == null; i++) {
                        Thread.sleep(100L);
                    }
                    Object db = sCoreDatabase;
                    if (db == null) {
                        err = "Database not initialized yet. Browse your BeReal feed first, then reopen this menu.";
                    } else {
                        String sql =
                            "SELECT p.id, p.ownerId, u.userName, u.fullName, p.takenAt, p.postedAt, " +
                            "p.latitude, p.longitude, p.caption, " +
                            "p.primary_picture_url, p.secondary_picture_url, " +
                            "p.primary_btsMedia_url, p.secondary_btsMedia_url, " +
                            "p.primary_video_url, p.secondary_video_url " +
                            "FROM PostEntity p " +
                            "LEFT JOIN UserEntity u ON p.ownerId = u.id " +
                            "ORDER BY p.takenAt DESC LIMIT 150";
                        Cursor c = (Cursor) XposedHelpers.callMethod(db, "query", sql, new Object[0]);
                        if (c != null) {
                            try {
                                while (c.moveToNext()) {
                                    FeedPost fp = new FeedPost();
                                    fp.postId = getStr(c, 0);
                                    fp.ownerId = getStr(c, 1);
                                    fp.userName = getStr(c, 2);
                                    fp.fullName = getStr(c, 3);
                                    fp.takenAt = c.isNull(4) ? 0L : c.getLong(4);
                                    fp.postedAt = c.isNull(5) ? fp.takenAt : c.getLong(5);
                                    fp.latitude = c.isNull(6) ? null : Double.valueOf(c.getDouble(6));
                                    fp.longitude = c.isNull(7) ? null : Double.valueOf(c.getDouble(7));
                                    fp.caption = getStr(c, 8);
                                    fp.primaryPictureUrl = getStr(c, 9);
                                    fp.secondaryPictureUrl = getStr(c, 10);
                                    fp.primaryBtsUrl = getStr(c, 11);
                                    fp.secondaryBtsUrl = getStr(c, 12);
                                    fp.primaryVideoUrl = getStr(c, 13);
                                    fp.secondaryVideoUrl = getStr(c, 14);
                                    if (isNonEmpty(fp.primaryPictureUrl)
                                            || isNonEmpty(fp.secondaryPictureUrl)
                                            || fp.hasVideoOrBts()) {
                                        list.add(fp);
                                    }
                                }
                            } finally {
                                c.close();
                            }
                        }
                        XposedBridge.log(TAG + "Loaded " + list.size() + " feed posts from CoreDatabase");
                    }
                } catch (Throwable t) {
                    XposedBridge.log(t);
                    err = "Query error: " + t.getMessage();
                }

                final String finalErr = err;
                new Handler(Looper.getMainLooper()).post(new Runnable() {
                    @Override
                    public void run() {
                        callback.onPostsLoaded(list, finalErr);
                    }
                });
            }
        }).start();
    }

    public static void downloadPostMedia(
        final Context ctx,
        final FeedPost post,
        final boolean dlPrimary,
        final boolean dlSecondary,
        final boolean dlVideoBts
    ) {
        if (post == null) {
            return;
        }
        toast(ctx, "Downloading " + post.getDisplayUser() + "...");
        new Thread(new Runnable() {
            @Override
            public void run() {
                int count = downloadPostSync(ctx, post, dlPrimary, dlSecondary, dlVideoBts);
                if (count > 0) {
                    toast(ctx, "Saved " + count + " file(s) with EXIF from " + post.getDisplayUser() + " to DCIM/BeReal");
                } else {
                    toast(ctx, "Failed to download media for " + post.getDisplayUser());
                }
            }
        }).start();
    }

    public static void downloadAllPosts(final Context ctx, final List<FeedPost> posts) {
        if (posts == null || posts.isEmpty()) {
            toast(ctx, "No feed posts to download");
            return;
        }
        toast(ctx, "Downloading " + posts.size() + " posts with EXIF to DCIM/BeReal...");
        new Thread(new Runnable() {
            @Override
            public void run() {
                int totalFiles = 0;
                for (FeedPost p : posts) {
                    totalFiles += downloadPostSync(ctx, p, true, true, true);
                }
                toast(ctx, "Finished! Saved " + totalFiles + " files with EXIF to DCIM/BeReal");
            }
        }).start();
    }

    private static int downloadPostSync(
        Context ctx,
        FeedPost post,
        boolean dlPrimary,
        boolean dlSecondary,
        boolean dlVideoBts
    ) {
        int savedCount = 0;
        long tsMs = ExifHelper.normalizeEpochMs(post.takenAt);
        String base = "BeReal_" + post.getSafeUsername() + "_" + tsMs;

        if (dlPrimary && isNonEmpty(post.primaryPictureUrl)) {
            String ext = guessImageExt(post.primaryPictureUrl);
            String mime = ".jpg".equals(ext) ? "image/jpeg" : "image/webp";
            if (downloadUrlToDcim(ctx, post, "primary", post.primaryPictureUrl, base + "_primary" + ext, mime, false)) {
                savedCount++;
            }
        }
        if (dlSecondary && isNonEmpty(post.secondaryPictureUrl)) {
            String ext = guessImageExt(post.secondaryPictureUrl);
            String mime = ".jpg".equals(ext) ? "image/jpeg" : "image/webp";
            if (downloadUrlToDcim(ctx, post, "secondary", post.secondaryPictureUrl, base + "_secondary" + ext, mime, false)) {
                savedCount++;
            }
        }
        if (dlVideoBts) {
            if (isNonEmpty(post.primaryBtsUrl)) {
                if (downloadUrlToDcim(ctx, post, "bts_primary", post.primaryBtsUrl, base + "_bts_primary.mp4", "video/mp4", true)) {
                    savedCount++;
                }
            }
            if (isNonEmpty(post.secondaryBtsUrl)) {
                if (downloadUrlToDcim(ctx, post, "bts_secondary", post.secondaryBtsUrl, base + "_bts_secondary.mp4", "video/mp4", true)) {
                    savedCount++;
                }
            }
            if (isNonEmpty(post.primaryVideoUrl)) {
                if (downloadUrlToDcim(ctx, post, "video_primary", post.primaryVideoUrl, base + "_video_primary.mp4", "video/mp4", true)) {
                    savedCount++;
                }
            }
            if (isNonEmpty(post.secondaryVideoUrl)) {
                if (downloadUrlToDcim(ctx, post, "video_secondary", post.secondaryVideoUrl, base + "_video_secondary.mp4", "video/mp4", true)) {
                    savedCount++;
                }
            }
        }
        return savedCount;
    }

    private static boolean downloadUrlToDcim(
        Context ctx,
        FeedPost post,
        String role,
        String urlStr,
        String outName,
        String mime,
        boolean isVideo
    ) {
        HttpURLConnection conn = null;
        InputStream is = null;
        File tempFile = null;
        try {
            Context appCtx = ctx != null ? ctx : AndroidAppHelper.currentApplication();
            File cacheDir = (appCtx != null && appCtx.getCacheDir() != null)
                ? appCtx.getCacheDir()
                : new File("/data/local/tmp");
            tempFile = new File(cacheDir, "bereal_dl_" + System.nanoTime() + "_" + outName);

            URL url = new URL(urlStr);
            conn = (HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(20000);
            conn.setInstanceFollowRedirects(true);
            conn.setRequestProperty("User-Agent", "BeReal/3.98.0 (Android)");
            int code = conn.getResponseCode();
            if (code < 200 || code >= 300) {
                XposedBridge.log(TAG + "HTTP " + code + " downloading " + urlStr);
                return false;
            }
            is = conn.getInputStream();

            FileOutputStream tempFos = new FileOutputStream(tempFile);
            try {
                byte[] buf = new byte[8192];
                int n;
                while ((n = is.read(buf)) > 0) {
                    tempFos.write(buf, 0, n);
                }
                tempFos.getFD().sync();
            } finally {
                tempFos.close();
            }

            long takenMs = ExifHelper.normalizeEpochMs(post != null ? post.takenAt : 0L);

            // Embed EXIF metadata (DateTimeOriginal, SubSec, OffsetTime, Artist, Caption, GPS, Camera Role)
            if (!isVideo && post != null) {
                ExifHelper.applyFeedPostExif(appCtx, tempFile, post, role);
            } else {
                tempFile.setLastModified(takenMs);
            }

            if (appCtx != null && Build.VERSION.SDK_INT >= 29) {
                ContentResolver resolver = appCtx.getContentResolver();
                ContentValues values = new ContentValues();
                values.put(MediaStore.MediaColumns.DISPLAY_NAME, outName);
                values.put(MediaStore.MediaColumns.MIME_TYPE, mime);
                values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DCIM + "/BeReal");
                ExifHelper.populateMediaStoreTimestamps(values, takenMs);
                values.put(MediaStore.MediaColumns.IS_PENDING, 1);

                Uri collection = isVideo
                    ? MediaStore.Video.Media.EXTERNAL_CONTENT_URI
                    : MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
                Uri itemUri = resolver.insert(collection, values);
                if (itemUri != null) {
                    OutputStream os = resolver.openOutputStream(itemUri);
                    if (os != null) {
                        FileInputStream fis = new FileInputStream(tempFile);
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
                        ExifHelper.populateMediaStoreTimestamps(done, takenMs);
                        done.put(MediaStore.MediaColumns.IS_PENDING, 0);
                        resolver.update(itemUri, done, null, null);
                        XposedBridge.log(TAG + "Downloaded feed media with EXIF -> DCIM/BeReal/" + outName);
                        return true;
                    }
                }
            }

            // Fallback direct file output
            File dcim = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM);
            File dir = new File(dcim, "BeReal");
            if (!dir.exists()) {
                dir.mkdirs();
            }
            File dst = new File(dir, outName);
            FileInputStream fis = new FileInputStream(tempFile);
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
            dst.setLastModified(takenMs);
            XposedBridge.log(TAG + "Downloaded feed media with EXIF direct -> " + dst.getAbsolutePath());
            return true;
        } catch (Throwable t) {
            XposedBridge.log(t);
            return false;
        } finally {
            try {
                if (is != null) is.close();
            } catch (Throwable ignored) {}
            try {
                if (conn != null) conn.disconnect();
            } catch (Throwable ignored) {}
            try {
                if (tempFile != null && tempFile.exists()) {
                    tempFile.delete();
                }
            } catch (Throwable ignored) {}
        }
    }

    private static String guessImageExt(String url) {
        String lower = url.toLowerCase(Locale.US);
        if (lower.contains(".jpg") || lower.contains(".jpeg")) {
            return ".jpg";
        }
        return ".webp";
    }

    private static String getStr(Cursor c, int idx) {
        if (c.isNull(idx)) {
            return null;
        }
        return c.getString(idx);
    }

    public static boolean isNonEmpty(String s) {
        return s != null && !s.trim().isEmpty();
    }

    private static void toast(final Context ctx, final String msg) {
        final Context target = ctx != null ? ctx : AndroidAppHelper.currentApplication();
        if (target == null) {
            return;
        }
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                try {
                    Toast.makeText(target, msg, Toast.LENGTH_SHORT).show();
                } catch (Throwable ignored) {
                }
            }
        });
    }
}
