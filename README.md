# BeReal DCIM Saver (`BeRealDcimSaver`)

An **Xposed / LSPosed module** for Android that automatically exports original **BeReal** (`com.bereal.ft`) camera `.webp` captures—both primary (back) and secondary (front) lenses, as well as instant/chat captures—directly to `/sdcard/DCIM/BeReal/`.

---

## 1. Technical Analysis: How BeReal Stores Camera Files (`v3.98.0+`)

Reverse-engineering `com.bereal.ft` (`v3.98.0-3600852`) reveals that BeReal never writes unscaled sensor JPEGs to external storage during capture. Instead, all media directories are managed internally by [`Ltt7`](src/com/bereal/dcimsaver/MainHook.java) via directory enum `Lps7` and root selector `Lut7`:

| Enum (`Lps7`) | Root (`Lpu7`) | On-Device Path | Contents |
| :--- | :--- | :--- | :--- |
| `Camera` (`Lps7;->f`) | `FilesDirectory` (`Context.getFilesDir()`) | `/data/user/0/com.bereal.ft/files/camera/` | Original camera captures (`primary_<ts>.webp`, `secondary_<ts>.webp`, `instant_primary_<ts>.webp`, `instant_secondary_<ts>.webp`, `BtsVideoRaw_<ts>.mp4`) |
| `PostDraft` (`Lps7;->g`) | `FilesDirectory` (`Context.getFilesDir()`) | `/data/user/0/com.bereal.ft/files/post_drafts/` | Queued / draft posts (`<postId>_<idx>.webp`) |
| `RealMojisCapture` (`Lps7;->b`) | `CacheDirectory` (`Context.getCacheDir()`) | `/data/user/0/com.bereal.ft/cache/realmojis_temp/` | Temporary RealMoji reaction captures |
| `ProcessingCache` (`Lps7;->n`) | `CacheDirectory` (`Context.getCacheDir()`) | `/data/user/0/com.bereal.ft/cache/processing/` | Intermediate transcoding / compositing files |

### Capture & Encoding Pipeline
1. **In-Memory Capture**: CameraX `ImageCapture` (`Lgf2;->d`) captures the frame in memory and scales/crops it to `1080x1440` (`Lgf2;->a` $\rightarrow$ `Lis4;->w`).
2. **WebP Encoding**: `Lknm;->f(Ltf2;Ljava/io/File;)Lyo6;` passes the `Bitmap` and target `File` (`/data/user/0/com.bereal.ft/files/camera/{primary,secondary}_<timestamp>.webp`) to `Llz9;->a(Landroid/graphics/Bitmap;Ldz9;)Lyo6;`, which encodes the image as **WebP (quality 90)** via `FileOutputStream`.
3. **URI Handoff & Cleanup**: Immediately after closing the `FileOutputStream`, `Llz9;->a` invokes `android.net.Uri.fromFile(File)` on the `.webp` file. Once the post is uploaded or discarded, `Lrm2` / `Lf7k` wipes `files/camera/`.

---

## 2. Module Architecture

Because BeReal's internal classes (`Lknm`, `Llz9`, `Ltt7`) are obfuscated with R8 and change names across releases, `BeRealDcimSaver` hooks stable **Android framework boundaries** inside `com.bereal.ft`:

1. **`Uri.fromFile(File)` (`UriFromFileHook` - `afterHookedMethod`)**:
   - Fires immediately at the end of `Llz9;->a` right after `FileOutputStream.close()` finishes flushing the `.webp` file to `/data/user/0/com.bereal.ft/files/camera/`.
2. **`Application.onCreate()` (`AppOnCreateHook` - `afterHookedMethod`)**:
   - Scans `/data/user/0/com.bereal.ft/files/camera/` on app startup and exports any existing `.webp` captures that have not yet been copied to `DCIM/BeReal/`.
3. **`File.delete()` (`FileDeleteHook` - `beforeHookedMethod`)**:
   - Acts as a pre-deletion safety net to ensure no `.webp` file in `files/camera/` is removed before being exported.
4. **Zero-Permission Scoped Storage Export (`MediaStore`)**:
   - In `AndroidManifest.xml`, BeReal declares `WRITE_EXTERNAL_STORAGE` with `android:maxSdkVersion="29"`. On Android 10+ (API 29+), direct `java.io.File` writes to `/sdcard/DCIM` are restricted, whereas inserting via `ContentResolver` into `MediaStore.Images.Media.EXTERNAL_CONTENT_URI` (`RELATIVE_PATH = "DCIM/BeReal"`, `MIME_TYPE = "image/webp"`) requires **no storage permissions**.
   - Deduplicates both in-memory `(path, lastModified, length)` and on-disk (`DCIM/BeReal/BeReal_<filename>.webp`) so each photo is exported once.

---

## 3. Project Structure & Building

The module can be built either as a standalone CLI project using `apktool` + `zipalign` + `apksigner` (`./build.sh`) or with Gradle (`app/`).

```text
.
├── AndroidManifest.xml       # Declares xposedmodule, minversion (82), and xposedscope
├── apktool.yml               # Apktool build configuration
├── assets/
│   └── xposed_init           # Entrypoint: com.bereal.dcimsaver.MainHook
├── build.sh                  # One-step CLI build, zipalign, and APK v2/v3 signing script
├── res/
│   └── values/
│       ├── arrays.xml        # Defines xposed_scope (com.bereal.ft)
│       ├── public.xml        # Resource ID table
│       └── strings.xml       # Module label and description
├── smali/
│   └── com/bereal/dcimsaver/
│       ├── MainHook.smali
│       ├── MainHook_AppOnCreateHook.smali
│       ├── MainHook_FileDeleteHook.smali
│       └── MainHook_UriFromFileHook.smali
├── src/
│   └── com/bereal/dcimsaver/
│       └── MainHook.java     # Java source implementation
└── app/                      # Standard Android Studio / Gradle module layout
```

### Build with `./build.sh`
```bash
./build.sh
```
Produces the signed APK at `dist/bereal-dcim-lsposed.apk`.

---

## 4. Installation & Usage

1. Install the signed APK via ADB:
   ```bash
   adb install -r dist/bereal-dcim-lsposed.apk
   ```
2. Open **LSPosed Manager**, enable **BeReal DCIM Saver**, and ensure **BeReal** (`com.bereal.ft`) is checked in the module scope.
3. Force-stop and relaunch **BeReal**:
   ```bash
   adb shell am force-stop com.bereal.ft
   ```
4. Any existing or newly captured camera `.webp` photos in `/data/user/0/com.bereal.ft/files/camera/` will appear in `/sdcard/DCIM/BeReal/` as:
   - `BeReal_primary_<timestamp>.webp`
   - `BeReal_secondary_<timestamp>.webp`

---

## 5. Credits & Disclaimers

- **Engineering, Reverse Engineering & Module Development**: Assisted by **Antigravity (Google DeepMind)**. Decompiled `com.bereal.ft` (`v3.98.0`) with `apktool`, traced the CameraX $\rightarrow$ WebP storage pipeline (`Ltt7`/`Lps7`/`Lknm`/`Llz9`), and implemented the Scoped Storage `MediaStore` LSPosed hooks.
- **Disclaimer**: *This project is an experimental tool created for personal archival, educational research, and interoperability. It is not affiliated with or endorsed by BeReal. Use at your own risk.*
