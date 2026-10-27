.class public Lcom/bereal/dcimsaver/MainHook;
.super Ljava/lang/Object;
.source "MainHook.java"

# interfaces
.implements Lde/robv/android/xposed/IXposedHookLoadPackage;


# static fields
.field private static final EXPORTED:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "[BeRealDcimSaver] "

.field private static final TARGET_PACKAGE:Ljava/lang/String; = "com.bereal.ft"


# instance fields
.field private downX:F

.field private downY:F

.field private mainHandler:Landroid/os/Handler;

.field private pendingLongPress:Ljava/lang/Runnable;

.field private trackingHeaderPress:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/bereal/dcimsaver/MainHook;->EXPORTED:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/bereal/dcimsaver/MainHook;Landroid/app/Application;)V
    .locals 0

    .line 97
    invoke-direct {p0, p1}, Lcom/bereal/dcimsaver/MainHook;->registerSettingsSyncReceiver(Landroid/app/Application;)V

    return-void
.end method

.method static synthetic access$1(Landroid/content/Context;)V
    .locals 0

    .line 414
    invoke-static {p0}, Lcom/bereal/dcimsaver/MainHook;->scanExistingDirectories(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$2(Lcom/bereal/dcimsaver/MainHook;Landroid/app/Activity;)Z
    .locals 0

    .line 173
    invoke-direct {p0, p1}, Lcom/bereal/dcimsaver/MainHook;->isBeRealMainActivity(Landroid/app/Activity;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$3(Lcom/bereal/dcimsaver/MainHook;Landroid/app/Activity;Landroid/view/MotionEvent;)V
    .locals 0

    .line 178
    invoke-direct {p0, p1, p2}, Lcom/bereal/dcimsaver/MainHook;->handleHeaderLongPressGesture(Landroid/app/Activity;Landroid/view/MotionEvent;)V

    return-void
.end method

.method static synthetic access$4(Lcom/bereal/dcimsaver/MainHook;Z)V
    .locals 0

    .line 47
    iput-boolean p1, p0, Lcom/bereal/dcimsaver/MainHook;->trackingHeaderPress:Z

    return-void
.end method

.method static synthetic access$5(Landroid/graphics/Bitmap;Ljava/lang/String;I)V
    .locals 0

    .line 499
    invoke-static {p0, p1, p2}, Lcom/bereal/dcimsaver/MainHook;->exportFullResBitmap(Landroid/graphics/Bitmap;Ljava/lang/String;I)V

    return-void
.end method

.method private cancelPendingLongPress()V
    .locals 2

    .line 230
    iget-object v0, p0, Lcom/bereal/dcimsaver/MainHook;->pendingLongPress:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bereal/dcimsaver/MainHook;->mainHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/bereal/dcimsaver/MainHook;->mainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/bereal/dcimsaver/MainHook;->pendingLongPress:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 232
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bereal/dcimsaver/MainHook;->pendingLongPress:Ljava/lang/Runnable;

    .line 234
    :cond_0
    return-void
.end method

.method private static exportFullResBitmap(Landroid/graphics/Bitmap;Ljava/lang/String;I)V
    .locals 8

    .line 500
    if-eqz p0, :cond_b

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_6

    .line 504
    :cond_0
    :try_start_0
    invoke-static {}, Landroid/app/AndroidAppHelper;->currentApplication()Landroid/app/Application;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 505
    if-nez v0, :cond_2

    .line 562
    :try_start_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result p1

    if-nez p1, :cond_1

    .line 563
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 565
    :catchall_0
    move-exception p0

    :goto_0
    nop

    .line 506
    :cond_1
    return-void

    .line 511
    :cond_2
    const/4 v1, 0x1

    if-ne p2, v1, :cond_3

    .line 512
    :try_start_2
    const-string p2, ".jpg"

    .line 513
    const-string v2, "image/jpeg"

    .line 514
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 515
    goto :goto_1

    :cond_3
    const/4 v2, 0x2

    if-ne p2, v2, :cond_4

    .line 516
    const-string p2, ".png"

    .line 517
    const-string v2, "image/png"

    .line 518
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    .line 519
    goto :goto_1

    .line 520
    :cond_4
    const-string p2, ".webp"

    .line 521
    const-string v2, "image/webp"

    .line 522
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1e

    if-lt v3, v4, :cond_5

    .line 523
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->WEBP_LOSSY:Landroid/graphics/Bitmap$CompressFormat;

    .line 524
    goto :goto_1

    .line 525
    :cond_5
    invoke-static {}, Lcom/bereal/dcimsaver/MainHook;->getLegacyWebpFormat()Landroid/graphics/Bitmap$CompressFormat;

    move-result-object v3

    .line 529
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "BeReal_fullres_"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v4, "_"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 530
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    .line 531
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 532
    const-string v4, "_display_name"

    invoke-virtual {v0, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 533
    const-string v4, "mime_type"

    invoke-virtual {v0, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 534
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    const-string v4, "is_pending"

    const/16 v5, 0x1d

    if-lt v2, v5, :cond_6

    .line 535
    :try_start_3
    const-string v2, "relative_path"

    new-instance v6, Ljava/lang/StringBuilder;

    sget-object v7, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "/BeReal"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v2, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 536
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 539
    :cond_6
    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p2, v1, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    .line 540
    if-eqz v0, :cond_8

    .line 541
    invoke-virtual {p2, v0}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 542
    if-eqz v1, :cond_8

    .line 544
    const/16 v2, 0x64

    :try_start_4
    invoke-virtual {p0, v3, v2, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 545
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 546
    nop

    .line 547
    :try_start_5
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 549
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v5, :cond_7

    .line 550
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 551
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 552
    const/4 v2, 0x0

    invoke-virtual {p2, v0, v1, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 554
    :cond_7
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "[BeRealDcimSaver] Exported full-res sensor image ("

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 555
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "x"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, ") -> DCIM/BeReal/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 554
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 558
    goto :goto_2

    .line 546
    :catchall_1
    move-exception p1

    .line 547
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 548
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 562
    :cond_8
    :goto_2
    :try_start_6
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    if-nez p1, :cond_9

    .line 563
    goto :goto_3

    .line 558
    :catchall_2
    move-exception p1

    .line 559
    :try_start_7
    invoke-static {p1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 562
    :try_start_8
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result p1

    if-nez p1, :cond_9

    .line 563
    :goto_3
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    goto :goto_4

    .line 565
    :catchall_3
    move-exception p0

    :goto_4
    nop

    .line 568
    :cond_9
    return-void

    .line 560
    :catchall_4
    move-exception p1

    .line 562
    :try_start_9
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result p2

    if-nez p2, :cond_a

    .line 563
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    goto :goto_5

    .line 565
    :catchall_5
    move-exception p0

    :goto_5
    nop

    .line 567
    :cond_a
    throw p1

    .line 501
    :cond_b
    :goto_6
    return-void
.end method

.method private static getLegacyWebpFormat()Landroid/graphics/Bitmap$CompressFormat;
    .locals 1

    .line 572
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->WEBP:Landroid/graphics/Bitmap$CompressFormat;

    return-object v0
.end method

.method private getMainHandler()Landroid/os/Handler;
    .locals 2

    .line 50
    iget-object v0, p0, Lcom/bereal/dcimsaver/MainHook;->mainHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 51
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/bereal/dcimsaver/MainHook;->mainHandler:Landroid/os/Handler;

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/bereal/dcimsaver/MainHook;->mainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private handleHeaderLongPressGesture(Landroid/app/Activity;Landroid/view/MotionEvent;)V
    .locals 7

    .line 179
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 180
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 181
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 183
    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v0, :cond_1

    .line 184
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    .line 185
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    .line 186
    int-to-float v2, v2

    const v5, 0x3e8f5c29    # 0.28f

    mul-float/2addr v5, v2

    .line 187
    const v6, 0x3f3851ec    # 0.72f

    mul-float/2addr v2, v6

    .line 188
    const/high16 v6, 0x42e60000    # 115.0f

    mul-float/2addr v1, v6

    .line 190
    cmpl-float v5, v0, v5

    if-ltz v5, :cond_0

    cmpg-float v2, v0, v2

    if-gtz v2, :cond_0

    const/4 v2, 0x0

    cmpl-float v2, p2, v2

    if-ltz v2, :cond_0

    cmpg-float v1, p2, v1

    if-gtz v1, :cond_0

    .line 191
    iput v0, p0, Lcom/bereal/dcimsaver/MainHook;->downX:F

    .line 192
    iput p2, p0, Lcom/bereal/dcimsaver/MainHook;->downY:F

    .line 193
    iput-boolean v3, p0, Lcom/bereal/dcimsaver/MainHook;->trackingHeaderPress:Z

    .line 194
    invoke-direct {p0}, Lcom/bereal/dcimsaver/MainHook;->cancelPendingLongPress()V

    .line 195
    new-instance p2, Lcom/bereal/dcimsaver/MainHook$5;

    invoke-direct {p2, p0, p1}, Lcom/bereal/dcimsaver/MainHook$5;-><init>(Lcom/bereal/dcimsaver/MainHook;Landroid/app/Activity;)V

    iput-object p2, p0, Lcom/bereal/dcimsaver/MainHook;->pendingLongPress:Ljava/lang/Runnable;

    .line 209
    invoke-direct {p0}, Lcom/bereal/dcimsaver/MainHook;->getMainHandler()Landroid/os/Handler;

    move-result-object p1

    iget-object p2, p0, Lcom/bereal/dcimsaver/MainHook;->pendingLongPress:Ljava/lang/Runnable;

    const-wide/16 v0, 0x258

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 210
    goto :goto_0

    .line 211
    :cond_0
    iput-boolean v4, p0, Lcom/bereal/dcimsaver/MainHook;->trackingHeaderPress:Z

    .line 213
    goto :goto_0

    :cond_1
    const/4 p1, 0x2

    if-ne v0, p1, :cond_3

    iget-boolean p1, p0, Lcom/bereal/dcimsaver/MainHook;->trackingHeaderPress:Z

    if-eqz p1, :cond_3

    .line 214
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    iget v0, p0, Lcom/bereal/dcimsaver/MainHook;->downX:F

    sub-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    .line 215
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    iget v0, p0, Lcom/bereal/dcimsaver/MainHook;->downY:F

    sub-float/2addr p2, v0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    .line 216
    const/high16 v0, 0x41a00000    # 20.0f

    mul-float/2addr v1, v0

    .line 217
    cmpl-float p1, p1, v1

    if-gtz p1, :cond_2

    cmpl-float p1, p2, v1

    if-lez p1, :cond_5

    .line 218
    :cond_2
    iput-boolean v4, p0, Lcom/bereal/dcimsaver/MainHook;->trackingHeaderPress:Z

    .line 219
    invoke-direct {p0}, Lcom/bereal/dcimsaver/MainHook;->cancelPendingLongPress()V

    .line 221
    goto :goto_0

    :cond_3
    if-eq v0, v3, :cond_4

    .line 222
    const/4 p1, 0x3

    if-eq v0, p1, :cond_4

    .line 223
    const/4 p1, 0x5

    if-ne v0, p1, :cond_5

    .line 224
    :cond_4
    iput-boolean v4, p0, Lcom/bereal/dcimsaver/MainHook;->trackingHeaderPress:Z

    .line 225
    invoke-direct {p0}, Lcom/bereal/dcimsaver/MainHook;->cancelPendingLongPress()V

    .line 227
    :cond_5
    :goto_0
    return-void
.end method

.method private hookApplicationLifecycle()V
    .locals 3

    .line 73
    :try_start_0
    const-class v0, Landroid/app/Application;

    .line 74
    const-string v1, "onCreate"

    .line 75
    new-instance v2, Lcom/bereal/dcimsaver/MainHook$1;

    invoke-direct {v2, p0}, Lcom/bereal/dcimsaver/MainHook$1;-><init>(Lcom/bereal/dcimsaver/MainHook;)V

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 72
    invoke-static {v0, v1, v2}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    goto :goto_0

    :catchall_0
    move-exception v0

    .line 93
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 95
    :goto_0
    return-void
.end method

.method private hookCameraDownscaleAndFullRes(Ljava/lang/ClassLoader;)V
    .locals 7

    .line 238
    :try_start_0
    const-string v0, "gf2"

    invoke-static {v0, p1}, Lde/robv/android/xposed/XposedHelpers;->findClassIfExists(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object p1

    .line 239
    if-nez p1, :cond_0

    .line 240
    const-string p1, "[BeRealDcimSaver] Could not find gf2 class for full-res / resolution hook"

    invoke-static {p1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 241
    return-void

    .line 244
    :cond_0
    nop

    .line 245
    const-string v0, "a"

    .line 246
    const-class v1, Landroid/graphics/Bitmap;

    .line 247
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 248
    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 249
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 250
    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 251
    new-instance v6, Lcom/bereal/dcimsaver/MainHook$6;

    invoke-direct {v6, p0}, Lcom/bereal/dcimsaver/MainHook$6;-><init>(Lcom/bereal/dcimsaver/MainHook;)V

    filled-new-array/range {v1 .. v6}, [Ljava/lang/Object;

    move-result-object v1

    .line 243
    invoke-static {p1, v0, v1}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 330
    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 331
    invoke-static {p1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 333
    :goto_0
    return-void
.end method

.method private hookFileExportTriggers()V
    .locals 4

    .line 384
    :try_start_0
    const-class v0, Landroid/net/Uri;

    .line 385
    const-string v1, "fromFile"

    .line 386
    const-class v2, Ljava/io/File;

    .line 387
    new-instance v3, Lcom/bereal/dcimsaver/MainHook$8;

    invoke-direct {v3, p0}, Lcom/bereal/dcimsaver/MainHook$8;-><init>(Lcom/bereal/dcimsaver/MainHook;)V

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    .line 383
    invoke-static {v0, v1, v2}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    .line 398
    const-class v0, Ljava/io/File;

    .line 399
    const-string v1, "delete"

    .line 400
    new-instance v2, Lcom/bereal/dcimsaver/MainHook$9;

    invoke-direct {v2, p0}, Lcom/bereal/dcimsaver/MainHook$9;-><init>(Lcom/bereal/dcimsaver/MainHook;)V

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 397
    invoke-static {v0, v1, v2}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 409
    goto :goto_0

    :catchall_0
    move-exception v0

    .line 410
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 412
    :goto_0
    return-void
.end method

.method private hookMainActivityUi()V
    .locals 4

    .line 125
    :try_start_0
    const-class v0, Landroid/app/Activity;

    .line 126
    const-string v1, "onResume"

    .line 127
    new-instance v2, Lcom/bereal/dcimsaver/MainHook$3;

    invoke-direct {v2, p0}, Lcom/bereal/dcimsaver/MainHook$3;-><init>(Lcom/bereal/dcimsaver/MainHook;)V

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 124
    invoke-static {v0, v1, v2}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    .line 150
    const-class v0, Landroid/app/Activity;

    .line 151
    const-string v1, "dispatchTouchEvent"

    .line 152
    const-class v2, Landroid/view/MotionEvent;

    .line 153
    new-instance v3, Lcom/bereal/dcimsaver/MainHook$4;

    invoke-direct {v3, p0}, Lcom/bereal/dcimsaver/MainHook$4;-><init>(Lcom/bereal/dcimsaver/MainHook;)V

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    .line 149
    invoke-static {v0, v1, v2}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 168
    goto :goto_0

    :catchall_0
    move-exception v0

    .line 169
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 171
    :goto_0
    return-void
.end method

.method private hookWebpCompressorAndSizeCap(Ljava/lang/ClassLoader;)V
    .locals 5

    .line 337
    :try_start_0
    const-string v0, "lz9"

    invoke-static {v0, p1}, Lde/robv/android/xposed/XposedHelpers;->findClassIfExists(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 338
    const-string v1, "dz9"

    invoke-static {v1, p1}, Lde/robv/android/xposed/XposedHelpers;->findClassIfExists(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    .line 339
    if-eqz v0, :cond_1

    if-nez v1, :cond_0

    goto :goto_0

    .line 344
    :cond_0
    nop

    .line 345
    const-string v2, "a"

    .line 346
    const-class v3, Landroid/graphics/Bitmap;

    .line 347
    nop

    .line 348
    new-instance v4, Lcom/bereal/dcimsaver/MainHook$7;

    invoke-direct {v4, p0, p1}, Lcom/bereal/dcimsaver/MainHook$7;-><init>(Lcom/bereal/dcimsaver/MainHook;Ljava/lang/ClassLoader;)V

    filled-new-array {v3, v1, v4}, [Ljava/lang/Object;

    move-result-object p1

    .line 343
    invoke-static {v0, v2, p1}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    .line 376
    goto :goto_1

    .line 340
    :cond_1
    :goto_0
    const-string p1, "[BeRealDcimSaver] Could not find lz9/dz9 classes for WebP quality hook"

    invoke-static {p1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 341
    return-void

    .line 376
    :catchall_0
    move-exception p1

    .line 377
    invoke-static {p1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 379
    :goto_1
    return-void
.end method

.method private isBeRealMainActivity(Landroid/app/Activity;)Z
    .locals 1

    .line 174
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    .line 175
    const-string v0, "bereal.app.MainActivity"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, ".MainActivity"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public static maybeExportFile(Ljava/io/File;)V
    .locals 12

    .line 440
    const-string v0, "/files/camera/"

    if-eqz p0, :cond_f

    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_6

    .line 443
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v1

    .line 444
    const-wide/16 v3, 0x400

    cmp-long v3, v1, v3

    if-gtz v3, :cond_1

    .line 445
    return-void

    .line 447
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 448
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    .line 449
    invoke-static {}, Landroid/app/AndroidAppHelper;->currentApplication()Landroid/app/Application;

    move-result-object v5

    .line 450
    invoke-static {v5}, Lcom/bereal/dcimsaver/ModConfig;->load(Landroid/content/Context;)Lcom/bereal/dcimsaver/ModConfig;

    move-result-object v6

    .line 452
    invoke-virtual {v3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v8, ".webp"

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eqz v7, :cond_2

    :try_start_1
    invoke-virtual {v4, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    move v7, v9

    goto :goto_0

    :cond_2
    move v7, v10

    .line 453
    :goto_0
    invoke-virtual {v3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, ".mp4"

    invoke-virtual {v4, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v9

    goto :goto_1

    :cond_3
    move v0, v10

    .line 454
    :goto_1
    const-string v11, "/realmojis_temp/"

    invoke-virtual {v3, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_4

    invoke-virtual {v4, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    goto :goto_2

    :cond_4
    move v9, v10

    .line 456
    :goto_2
    if-nez v7, :cond_5

    if-nez v0, :cond_5

    if-nez v9, :cond_5

    .line 457
    return-void

    .line 460
    :cond_5
    if-eqz v7, :cond_6

    .line 461
    iget v7, v6, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    if-eqz v7, :cond_8

    .line 462
    iget v6, v6, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    const/4 v7, 0x2

    if-eq v6, v7, :cond_8

    .line 463
    return-void

    .line 465
    :cond_6
    if-eqz v0, :cond_7

    .line 466
    iget-boolean v6, v6, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    if-nez v6, :cond_8

    .line 467
    return-void

    .line 469
    :cond_7
    if-eqz v9, :cond_8

    .line 470
    iget-boolean v6, v6, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    if-nez v6, :cond_8

    .line 471
    return-void

    .line 475
    :cond_8
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, ":"

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 476
    sget-object v2, Lcom/bereal/dcimsaver/MainHook;->EXPORTED:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 477
    return-void

    .line 480
    :cond_9
    if-eqz v9, :cond_a

    const-string v2, "BeReal_realmoji_"

    goto :goto_3

    :cond_a
    const-string v2, "BeReal_"

    .line 481
    :goto_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 482
    if-eqz v0, :cond_b

    const-string v3, "video/mp4"

    goto :goto_4

    :cond_b
    const-string v3, "image/webp"

    .line 484
    :goto_4
    nop

    .line 485
    if-eqz v5, :cond_c

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1d

    if-lt v4, v6, :cond_c

    .line 486
    invoke-static {v5, p0, v2, v3, v0}, Lcom/bereal/dcimsaver/MainHook;->saveFileViaMediaStore(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v10

    .line 488
    :cond_c
    if-nez v10, :cond_d

    .line 489
    invoke-static {p0, v2}, Lcom/bereal/dcimsaver/MainHook;->saveFileDirectToDcim(Ljava/io/File;Ljava/lang/String;)Z

    move-result v10

    .line 491
    :cond_d
    if-nez v10, :cond_e

    .line 492
    sget-object p0, Lcom/bereal/dcimsaver/MainHook;->EXPORTED:Ljava/util/Set;

    invoke-interface {p0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 494
    goto :goto_5

    :catchall_0
    move-exception p0

    .line 495
    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 497
    :cond_e
    :goto_5
    return-void

    .line 441
    :cond_f
    :goto_6
    return-void
.end method

.method private registerSettingsSyncReceiver(Landroid/app/Application;)V
    .locals 4

    .line 99
    :try_start_0
    new-instance v0, Lcom/bereal/dcimsaver/MainHook$2;

    invoke-direct {v0, p0}, Lcom/bereal/dcimsaver/MainHook$2;-><init>(Lcom/bereal/dcimsaver/MainHook;)V

    .line 111
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "com.bereal.dcimsaver.ACTION_SYNC_PREFS"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 112
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x21

    if-lt v2, v3, :cond_0

    .line 113
    const/4 v2, 0x2

    invoke-virtual {p1, v0, v1, v2}, Landroid/app/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 114
    goto :goto_0

    .line 115
    :cond_0
    invoke-virtual {p1, v0, v1}, Landroid/app/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 117
    goto :goto_0

    :catchall_0
    move-exception p1

    .line 118
    invoke-static {p1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 120
    :goto_0
    return-void
.end method

.method private static saveFileDirectToDcim(Ljava/io/File;Ljava/lang/String;)Z
    .locals 7

    .line 628
    const/4 v0, 0x0

    :try_start_0
    sget-object v1, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 629
    new-instance v2, Ljava/io/File;

    const-string v3, "BeReal"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 630
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 631
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 633
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 634
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p1

    const/4 v2, 0x1

    if-eqz p1, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v5

    cmp-long p1, v3, v5

    if-nez p1, :cond_1

    .line 635
    return v2

    .line 637
    :cond_1
    new-instance p1, Ljava/io/FileInputStream;

    invoke-direct {p1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 638
    new-instance p0, Ljava/io/FileOutputStream;

    invoke-direct {p0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 640
    const/16 v3, 0x2000

    :try_start_1
    new-array v3, v3, [B

    .line 642
    nop

    :goto_0
    invoke-virtual {p1, v3}, Ljava/io/FileInputStream;->read([B)I

    move-result v4

    if-gtz v4, :cond_2

    .line 645
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/FileDescriptor;->sync()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 646
    nop

    .line 647
    :try_start_2
    invoke-virtual {p1}, Ljava/io/FileInputStream;->close()V

    .line 648
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V

    .line 650
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "[BeRealDcimSaver] Exported direct -> "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 651
    return v2

    .line 643
    :cond_2
    :try_start_3
    invoke-virtual {p0, v3, v0, v4}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 646
    :catchall_0
    move-exception v1

    .line 647
    :try_start_4
    invoke-virtual {p1}, Ljava/io/FileInputStream;->close()V

    .line 648
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V

    .line 649
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 652
    :catchall_1
    move-exception p0

    .line 653
    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 654
    return v0
.end method

.method private static saveFileViaMediaStore(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 5

    .line 583
    const-string v0, "is_pending"

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    .line 584
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 585
    const-string v3, "_display_name"

    invoke-virtual {v2, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 586
    const-string v3, "mime_type"

    invoke-virtual {v2, v3, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 587
    const-string p3, "relative_path"

    new-instance v3, Ljava/lang/StringBuilder;

    sget-object v4, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "/BeReal"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, p3, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 588
    const/4 p3, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 590
    if-eqz p4, :cond_0

    .line 591
    sget-object p4, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_0

    .line 592
    :cond_0
    sget-object p4, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 590
    :goto_0
    nop

    .line 594
    invoke-virtual {p0, p4, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p4

    .line 595
    if-nez p4, :cond_1

    .line 596
    return v1

    .line 598
    :cond_1
    invoke-virtual {p0, p4}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v2

    .line 599
    if-nez v2, :cond_2

    .line 600
    return v1

    .line 602
    :cond_2
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 604
    const/16 p1, 0x2000

    :try_start_1
    new-array p1, p1, [B

    .line 606
    nop

    :goto_1
    invoke-virtual {v3, p1}, Ljava/io/FileInputStream;->read([B)I

    move-result v4

    if-gtz v4, :cond_3

    .line 609
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 610
    nop

    .line 611
    :try_start_2
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 612
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 615
    new-instance p1, Landroid/content/ContentValues;

    invoke-direct {p1}, Landroid/content/ContentValues;-><init>()V

    .line 616
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 617
    const/4 v0, 0x0

    invoke-virtual {p0, p4, p1, v0, v0}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 618
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "[BeRealDcimSaver] Exported via MediaStore -> DCIM/BeReal/"

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 619
    return p3

    .line 607
    :cond_3
    :try_start_3
    invoke-virtual {v2, p1, v1, v4}, Ljava/io/OutputStream;->write([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 610
    :catchall_0
    move-exception p0

    .line 611
    :try_start_4
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 612
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 613
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 620
    :catchall_1
    move-exception p0

    .line 621
    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 622
    return v1
.end method

.method private static scanDirectory(Ljava/io/File;)V
    .locals 3

    .line 426
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 429
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    .line 430
    if-nez p0, :cond_1

    .line 431
    return-void

    .line 433
    :cond_1
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v0, :cond_2

    .line 436
    return-void

    .line 433
    :cond_2
    aget-object v2, p0, v1

    .line 434
    invoke-static {v2}, Lcom/bereal/dcimsaver/MainHook;->maybeExportFile(Ljava/io/File;)V

    .line 433
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 427
    :cond_3
    :goto_1
    return-void
.end method

.method private static scanExistingDirectories(Landroid/content/Context;)V
    .locals 3

    .line 416
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "camera"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 417
    invoke-static {v0}, Lcom/bereal/dcimsaver/MainHook;->scanDirectory(Ljava/io/File;)V

    .line 418
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "realmojis_temp"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 419
    invoke-static {v0}, Lcom/bereal/dcimsaver/MainHook;->scanDirectory(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 420
    goto :goto_0

    :catchall_0
    move-exception p0

    .line 421
    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 423
    :goto_0
    return-void
.end method


# virtual methods
.method public handleLoadPackage(Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 58
    if-eqz p1, :cond_1

    const-string v0, "com.bereal.ft"

    iget-object v1, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 61
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[BeRealDcimSaver] Loaded into "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 63
    invoke-direct {p0}, Lcom/bereal/dcimsaver/MainHook;->hookApplicationLifecycle()V

    .line 64
    invoke-direct {p0}, Lcom/bereal/dcimsaver/MainHook;->hookMainActivityUi()V

    .line 65
    iget-object v0, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->classLoader:Ljava/lang/ClassLoader;

    invoke-direct {p0, v0}, Lcom/bereal/dcimsaver/MainHook;->hookCameraDownscaleAndFullRes(Ljava/lang/ClassLoader;)V

    .line 66
    iget-object p1, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->classLoader:Ljava/lang/ClassLoader;

    invoke-direct {p0, p1}, Lcom/bereal/dcimsaver/MainHook;->hookWebpCompressorAndSizeCap(Ljava/lang/ClassLoader;)V

    .line 67
    invoke-direct {p0}, Lcom/bereal/dcimsaver/MainHook;->hookFileExportTriggers()V

    .line 68
    return-void

    .line 59
    :cond_1
    :goto_0
    return-void
.end method
