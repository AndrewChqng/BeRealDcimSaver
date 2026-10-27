# BeReal DCIM & Quality Mod (`BeRealDcimSaver`)

An **Xposed / LSPosed module** for Android targeting **BeReal** (`com.bereal.ft` `v3.98.0+`) that:
1. **Dumps Full-Resolution Raw Camera Sensor Captures** (`12 MP` / `4096×3072` back & `8 MP` front `Bitmap` frames) to `/sdcard/DCIM/BeReal/` **before** BeReal downscales and recycles them.
2. **Boosts Uploaded BeReal Post Resolution & Quality** — overrides the hardcoded `1080×1440` (`0x438` × `0x5a0`) downscale target up to **2K (`1440×1920`)**, **4K (`2160×2880`)**, or **Full Sensor 3:4**, sets custom WebP compression quality (`50%–100%`), and bypasses BeReal's **700 KB upload file size cap** (`Lxg1` $\rightarrow$ `Lkvb.a` `Unlimited`).
3. **Exports Processed Captures, BTS Videos & RealMojis** — automatically saves `files/camera/*.webp`, Behind-the-Scenes raw videos (`BtsVideoRaw_*.mp4`), and `realmojis_temp/*.webp` to `/sdcard/DCIM/BeReal/`.
4. **Downloads Other Users' Primary / Secondary / BTS Posts (`FeedDownloader`)** — hooks BeReal's SQLCipher-encrypted `CoreDatabase` (`PostEntity` joined with `UserEntity`) in-process so you can browse/search active feed posts and memories by `@username` and save any user's Primary photo, Secondary photo, or BTS video directly to `/sdcard/DCIM/BeReal/`.
5. **Dual Configuration UI** — includes both a **Standalone Settings App** (launcher + LSPosed Manager module settings) and an **In-App Settings & Downloader Dialog** inside BeReal (triggered by **long-pressing the top-center `"BeReal."` header logo** for ~600ms).

---

## 1. Reverse-Engineered BeReal Camera & Compression Pipeline (`v3.98.0-3600852`)

### Internal Storage Layout (`Ltt7` / `Lps7` / `Lut7`)

| Enum (`Lps7`) | Root (`Lpu7`) | On-Device Path | Contents |
| :--- | :--- | :--- | :--- |
| `Camera` (`Lps7;->f`) | `FilesDirectory` (`Context.getFilesDir()`) | `/data/user/0/com.bereal.ft/files/camera/` | Processed captures (`primary_<ts>.webp`, `secondary_<ts>.webp`, `instant_primary_<ts>.webp`, `instant_secondary_<ts>.webp`, `BtsVideoRaw_<ts>.mp4`, `BtsVideo_upload_<ts>.mp4`) |
| `PostDraft` (`Lps7;->g`) | `FilesDirectory` (`Context.getFilesDir()`) | `/data/user/0/com.bereal.ft/files/post_drafts/` | Queued / draft posts (`<postId>_<idx>.webp`) |
| `RealMojisCapture` (`Lps7;->b`) | `CacheDirectory` (`Context.getCacheDir()`) | `/data/user/0/com.bereal.ft/cache/realmojis_temp/` | Temporary RealMoji reaction captures (`*.webp`) |
| `ProcessingCache` (`Lps7;->n`) | `CacheDirectory` (`Context.getCacheDir()`) | `/data/user/0/com.bereal.ft/cache/processing/` | Intermediate transcoding / compositing files |

### Three-Stage Image Quality Bottleneck & How This Module Hooks Each Stage

1. **Stage 1 — Full-Resolution Hardware Capture (`Lao2;->c` & `Lff2;->c`)**:
   - `Lao2;->c(Z)Landroid/util/Size;` queries `StreamConfigurationMap.getOutputSizes(0x100)` (JPEG) and selects the **largest 4:3 hardware sensor resolution** (e.g., `4096×3072` / 12 MP).
   - `Lff2;->c(Landroidx/camera/core/ImageProxy;)V` decodes the `ImageProxy` into a full-resolution `Bitmap` (`Lmy9;->a`).
2. **Stage 2 — Hardcoded `1080×1440` Downscale (`Lknm;->d` $\rightarrow$ `Lgf2;->a` $\rightarrow$ `Lis4;->w`)**:
   - `Lknm;->d` passes `p3 = 1080` (`0x438`) and `p4 = 1440` (`0x5a0`) into `Lgf2;->d` $\rightarrow$ `Lgf2;->a(Landroid/graphics/Bitmap;FZII)Lr1n;`. Immediately after `Lgf2;->d` returns, `Lff2;->c` calls `Bitmap.recycle()` on the full-resolution sensor `Bitmap`.
   - **Our Hook (`gf2.a` `beforeHookedMethod`)**:
     - Applies the exact rotation (`rotationDegrees`) and mirror (`flipHorizontally`) matrix to the full-resolution `Bitmap`, creates an independent copy before `ff2.c` recycles the source, and encodes it on a background thread to `DCIM/BeReal/BeReal_fullres_{primary|secondary}_<ts>.{webp|jpg|png}` at **100% quality**.
     - Overrides `args[3]` (`targetWidth`) and `args[4]` (`targetHeight`) from `1080×1440` to **`1440×1920` (2K)**, **`2160×2880` (4K)**, or **Full Sensor 3:4**.
3. **Stage 3 — WebP Compression & 700 KB Size Cap (`Lknm;->f` $\rightarrow$ `Llz9;->a(Landroid/graphics/Bitmap;Ldz9;)Lyo6;`)**:
   - `Lknm;->f` builds `Ldz9` with initial quality `d = 90` (`0x5a`) and size constraint `c = Lxg1;->a` (`Ljvb` = `LimitedTo(tryToReduceTo=700 KB, maxAccepted=700 KB)`).
   - If the compressed `.webp` exceeds **700 KB** (`0xaf000` bytes), `Llz9;->a` loops in steps of `-10` quality down to `50` and **throws a fatal `Lyb7` error** if still above 700 KB.
   - **Our Hook (`lz9.a` `beforeHookedMethod`)**:
     - Overrides `dz9.d` (`quality`) with the user's configured initial WebP quality (`50–100`, default `100`).
     - Optionally replaces `dz9.c` with `Lkvb.a` (`Unlimited`) if the user explicitly toggles **Bypass 700 KB Client Size Cap**.

> [!WARNING]
> **Server-Side 700 KB Upload Restriction**: BeReal's backend (and signed upload policy) rejects uploaded `.webp` files larger than **700 KB** (`716,800` bytes).
> - By default, **Bypass 700 KB Client Size Cap** is **OFF** and the target upload resolution defaults to **`1080×1440`** with **100% initial WebP quality**, so `Llz9;->a` encodes at up to 100% quality when $\le$ 700 KB and automatically steps down quality if needed to pass server validation.
> - **Local `DCIM/BeReal` Full-Resolution Sensor Dumps** (`BeReal_fullres_*`) are saved directly from the CameraX `Bitmap` before `Lgf2`/`Llz9` and are **never affected** by the 700 KB upload cap.

---

## 2. Features & User Interface

### Accessing the Settings UI
- **In-App Shortcut (Inside BeReal)**: Long-press (~600ms) the top-center **`"BeReal."`** header logo on the main screen to open the dark-themed configuration dialog.
- **Standalone App**: Open **BeReal DCIM & Quality Mod** from your launcher or tap the **Settings** icon for the module inside **LSPosed Manager**. Changes sync live to `com.bereal.ft` via broadcast (`com.bereal.dcimsaver.ACTION_SYNC_PREFS`) or launch `Intent`.

### Configurable Options (`ModConfig`)
- **Photos to Save Locally (`DCIM/BeReal`)**:
  - `Processed / Uploaded (.webp) Only`
  - `Full-Resolution Raw Sensor Dump Only`
  - `Both (Full-Res Sensor + Processed .webp)` *(Default)*
- **Full-Resolution Sensor Dump Format**:
  - `WebP (100% Quality / Lossless)` *(Default)*
  - `JPEG (100% Quality)`
  - `PNG (Uncompressed Lossless)`
- **Extra Media Types**:
  - Save Behind-the-Scenes (BTS) Raw Videos (`BtsVideoRaw_*.mp4`) to `DCIM/BeReal` *(Default: ON)*
  - Save RealMoji Captures (`realmojis_temp/*.webp`) to `DCIM/BeReal` *(Default: ON)*
- **Uploaded BeReal Post Quality Boost**:
  - Target Upload Resolution: `1080×1440 (Default • Recommended for <700 KB)`, `1440×1920 (2K QHD)`, `2160×2880 (4K UHD)`, or `Full Sensor Resolution (Max 3:4 Crop)`
  - Initial Upload WebP Compression Quality Slider: `50% – 100%` *(Default: 100%)*
  - Bypass 700 KB Client Size Cap (`Unlimited` via `kvb.a` — ⚠️ Server rejects >700 KB) *(Default: OFF)*

---

## 3. Building & Installation

```bash
./build.sh
adb install -r dist/bereal-dcim-lsposed.apk
```

1. Enable **BeReal DCIM & Quality Mod** in **LSPosed Manager** with **BeReal** (`com.bereal.ft`) checked in scope.
2. Force-stop and relaunch **BeReal**:
   ```bash
   adb shell am force-stop com.bereal.ft
   ```

---

## 4. Credits & Disclaimers

- **Engineering, Reverse Engineering & Module Development**: Assisted by **Antigravity (Google DeepMind)**. Decompiled `com.bereal.ft` (`v3.98.0-3600852`) with `apktool`, traced the CameraX `ImageProxy` $\rightarrow$ `gf2.a` (`1080×1440` downscale) $\rightarrow$ `lz9.a` (`dz9` WebP 90 / 700 KB `LimitedTo` cap) pipeline, and implemented the full-resolution sensor dump, upload resolution/quality overrides, Scoped Storage `MediaStore` exporter, and dual settings UI.
- **Disclaimer**: *This project is an experimental, AI-assisted tool created for personal archival, educational research, and interoperability. Increasing upload dimensions beyond BeReal's default `1080×1440` modifies client-side encoding behavior; use at your own risk. Not affiliated with or endorsed by BeReal.*
