package com.bereal.dcimsaver;

import android.content.ContentValues;
import android.content.Context;
import android.media.ExifInterface;
import android.os.Build;
import android.provider.MediaStore;

import java.io.File;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import de.robv.android.xposed.XposedBridge;

public final class ExifHelper {
    private static final String TAG = "[BeRealDcimSaver] ";

    public static long normalizeEpochMs(long ts) {
        if (ts <= 0L) {
            return System.currentTimeMillis();
        }
        return ts < 10000000000L ? ts * 1000L : ts;
    }

    public static long parseTimestampFromFilename(String name) {
        if (name == null) {
            return System.currentTimeMillis();
        }
        try {
            // Matches e.g. primary_1793062998383.webp or BeReal_fullres_primary_1793062998383.webp
            int dot = name.lastIndexOf('.');
            String base = dot > 0 ? name.substring(0, dot) : name;
            int lastUnderscore = base.lastIndexOf('_');
            if (lastUnderscore >= 0 && lastUnderscore + 1 < base.length()) {
                String digits = base.substring(lastUnderscore + 1);
                long parsed = Long.parseLong(digits);
                if (parsed > 1000000000L) {
                    return normalizeEpochMs(parsed);
                }
            }
        } catch (Throwable ignored) {
        }
        return System.currentTimeMillis();
    }

    public static void populateMediaStoreTimestamps(ContentValues values, long epochMs) {
        if (values == null) {
            return;
        }
        long ms = normalizeEpochMs(epochMs);
        long sec = ms / 1000L;
        if (Build.VERSION.SDK_INT >= 29) {
            values.put(MediaStore.MediaColumns.DATE_TAKEN, ms);
        } else {
            values.put("datetaken", ms);
        }
        values.put(MediaStore.MediaColumns.DATE_ADDED, sec);
        values.put(MediaStore.MediaColumns.DATE_MODIFIED, sec);
    }

    public static void applyFeedPostExif(
        Context ctx,
        File imageFile,
        FeedDownloader.FeedPost post,
        String role
    ) {
        if (imageFile == null || !imageFile.exists() || post == null) {
            return;
        }
        long takenMs = normalizeEpochMs(post.takenAt);
        long postedMs = post.postedAt > 0 ? normalizeEpochMs(post.postedAt) : takenMs;

        Map<String, String> tags = new LinkedHashMap<String, String>();
        putDateTimeTags(tags, takenMs, postedMs);

        tags.put(ExifInterface.TAG_ORIENTATION, String.valueOf(ExifInterface.ORIENTATION_NORMAL));
        tags.put(ExifInterface.TAG_SOFTWARE, "BeReal");
        tags.put(ExifInterface.TAG_MAKE, "BeReal");
        String cameraLabel = "secondary".equalsIgnoreCase(role)
            ? "BeReal Front Camera (Secondary)"
            : "BeReal Back Camera (Primary)";
        tags.put(ExifInterface.TAG_MODEL, cameraLabel);

        String author = post.getDisplayUser();
        tags.put(ExifInterface.TAG_ARTIST, author);
        tags.put(ExifInterface.TAG_COPYRIGHT, author + " (BeReal)");

        String desc = (post.caption != null && !post.caption.trim().isEmpty())
            ? post.caption.trim()
            : ("BeReal by " + author + " [" + role + "]");
        tags.put(ExifInterface.TAG_IMAGE_DESCRIPTION, desc);

        String comment = "BeReal post " + (post.postId != null ? post.postId : "")
            + " by " + author + " [" + role + "]"
            + ((post.caption != null && !post.caption.trim().isEmpty()) ? (" - " + post.caption.trim()) : "");
        tags.put(ExifInterface.TAG_USER_COMMENT, comment);

        if (post.latitude != null && post.longitude != null) {
            double lat = post.latitude.doubleValue();
            double lon = post.longitude.doubleValue();
            if (lat != 0.0 || lon != 0.0) {
                putGpsTags(tags, lat, lon, takenMs);
            }
        }

        writeExifTagsToFile(ctx, imageFile, tags, takenMs);
    }

    public static void applyOwnCaptureExif(
        Context ctx,
        File imageFile,
        String role,
        long captureEpochMs
    ) {
        if (imageFile == null || !imageFile.exists()) {
            return;
        }
        long ms = normalizeEpochMs(captureEpochMs);
        Map<String, String> tags = new LinkedHashMap<String, String>();
        putDateTimeTags(tags, ms, ms);

        tags.put(ExifInterface.TAG_ORIENTATION, String.valueOf(ExifInterface.ORIENTATION_NORMAL));
        tags.put(ExifInterface.TAG_MAKE, Build.MANUFACTURER != null ? Build.MANUFACTURER : "Android");
        tags.put(ExifInterface.TAG_MODEL, Build.MODEL != null ? Build.MODEL : "Device");
        tags.put(ExifInterface.TAG_SOFTWARE, "BeReal");
        tags.put(ExifInterface.TAG_IMAGE_DESCRIPTION, "BeReal " + role + " camera capture");

        writeExifTagsToFile(ctx, imageFile, tags, ms);
    }

    private static void putDateTimeTags(Map<String, String> tags, long takenMs, long digitizedMs) {
        Date takenDate = new Date(takenMs);
        Date digDate = new Date(digitizedMs);

        SimpleDateFormat exifFmt = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss", Locale.US);
        SimpleDateFormat subSecFmt = new SimpleDateFormat("SSS", Locale.US);

        String takenStr = exifFmt.format(takenDate);
        String digStr = exifFmt.format(digDate);
        String subSecTaken = subSecFmt.format(takenDate);
        String subSecDig = subSecFmt.format(digDate);
        String tzOffset = formatTzOffset(TimeZone.getDefault(), takenMs);

        tags.put(ExifInterface.TAG_DATETIME, takenStr);
        tags.put(ExifInterface.TAG_DATETIME_ORIGINAL, takenStr);
        tags.put(ExifInterface.TAG_DATETIME_DIGITIZED, digStr);

        tags.put(ExifInterface.TAG_SUBSEC_TIME, subSecTaken);
        tags.put(ExifInterface.TAG_SUBSEC_TIME_ORIGINAL, subSecTaken);
        tags.put(ExifInterface.TAG_SUBSEC_TIME_DIGITIZED, subSecDig);

        tags.put("OffsetTime", tzOffset);
        tags.put("OffsetTimeOriginal", tzOffset);
        tags.put("OffsetTimeDigitized", tzOffset);
    }

    private static String formatTzOffset(TimeZone tz, long timeMs) {
        int offsetMs = tz.getOffset(timeMs);
        char sign = offsetMs >= 0 ? '+' : '-';
        int absMin = Math.abs(offsetMs) / 60000;
        int hours = absMin / 60;
        int mins = absMin % 60;
        return String.format(Locale.US, "%c%02d:%02d", sign, hours, mins);
    }

    private static void putGpsTags(Map<String, String> tags, double lat, double lon, long timeMs) {
        tags.put(ExifInterface.TAG_GPS_LATITUDE_REF, lat >= 0.0 ? "N" : "S");
        tags.put(ExifInterface.TAG_GPS_LATITUDE, toExifDms(Math.abs(lat)));
        tags.put(ExifInterface.TAG_GPS_LONGITUDE_REF, lon >= 0.0 ? "E" : "W");
        tags.put(ExifInterface.TAG_GPS_LONGITUDE, toExifDms(Math.abs(lon)));

        SimpleDateFormat gpsDateFmt = new SimpleDateFormat("yyyy:MM:dd", Locale.US);
        gpsDateFmt.setTimeZone(TimeZone.getTimeZone("UTC"));
        SimpleDateFormat gpsHourFmt = new SimpleDateFormat("HH", Locale.US);
        gpsHourFmt.setTimeZone(TimeZone.getTimeZone("UTC"));
        SimpleDateFormat gpsMinFmt = new SimpleDateFormat("mm", Locale.US);
        gpsMinFmt.setTimeZone(TimeZone.getTimeZone("UTC"));
        SimpleDateFormat gpsSecFmt = new SimpleDateFormat("ss", Locale.US);
        gpsSecFmt.setTimeZone(TimeZone.getTimeZone("UTC"));

        Date d = new Date(timeMs);
        tags.put(ExifInterface.TAG_GPS_DATESTAMP, gpsDateFmt.format(d));
        tags.put(
            ExifInterface.TAG_GPS_TIMESTAMP,
            gpsHourFmt.format(d) + "/1," + gpsMinFmt.format(d) + "/1," + gpsSecFmt.format(d) + "/1"
        );
    }

    private static String toExifDms(double coord) {
        int degrees = (int) coord;
        double rem = (coord - degrees) * 60.0;
        int minutes = (int) rem;
        int secondsScaled = (int) Math.round((rem - minutes) * 60.0 * 10000.0);
        if (secondsScaled >= 600000) {
            secondsScaled = 0;
            minutes += 1;
        }
        if (minutes >= 60) {
            minutes = 0;
            degrees += 1;
        }
        return degrees + "/1," + minutes + "/1," + secondsScaled + "/10000";
    }

    private static void writeExifTagsToFile(
        Context ctx,
        File file,
        Map<String, String> tags,
        long timestampMs
    ) {
        boolean written = false;

        // 1. Try AndroidX ExifInterface bundled in BeReal (supports WebP, PNG, and JPEG EXIF chunks)
        if (ctx != null) {
            try {
                ClassLoader cl = ctx.getClassLoader();
                Class<?> axExifClass = Class.forName("androidx.exifinterface.media.ExifInterface", false, cl);
                Constructor<?> ctor = axExifClass.getConstructor(String.class);
                Object exifObj = ctor.newInstance(file.getAbsolutePath());

                Method setAttrMethod = null;
                try {
                    setAttrMethod = axExifClass.getMethod("setAttribute", String.class, String.class);
                } catch (NoSuchMethodException ignored) {
                    setAttrMethod = axExifClass.getMethod("I", String.class, String.class);
                }

                Method saveAttrMethod = null;
                try {
                    saveAttrMethod = axExifClass.getMethod("saveAttributes");
                } catch (NoSuchMethodException ignored) {
                    saveAttrMethod = axExifClass.getMethod("E");
                }

                for (Map.Entry<String, String> entry : tags.entrySet()) {
                    if (entry.getValue() != null) {
                        setAttrMethod.invoke(exifObj, entry.getKey(), entry.getValue());
                    }
                }
                saveAttrMethod.invoke(exifObj);
                written = true;
            } catch (Throwable t) {
                XposedBridge.log(TAG + "AndroidX ExifInterface fallback: " + t.getMessage());
            }
        }

        // 2. Fallback to Android framework ExifInterface (API 30+ supports WebP, PNG, JPEG)
        if (!written) {
            try {
                ExifInterface exif = new ExifInterface(file.getAbsolutePath());
                for (Map.Entry<String, String> entry : tags.entrySet()) {
                    if (entry.getValue() != null) {
                        exif.setAttribute(entry.getKey(), entry.getValue());
                    }
                }
                exif.saveAttributes();
                written = true;
            } catch (Throwable t) {
                XposedBridge.log(TAG + "Framework ExifInterface error: " + t.getMessage());
            }
        }

        try {
            file.setLastModified(timestampMs);
        } catch (Throwable ignored) {
        }
    }
}
