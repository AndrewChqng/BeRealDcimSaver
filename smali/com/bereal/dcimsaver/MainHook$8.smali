.class Lcom/bereal/dcimsaver/MainHook$8;
.super Lde/robv/android/xposed/XC_MethodHook;
.source "MainHook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/MainHook;->hookCameraDownscaleAndFullRes(Ljava/lang/ClassLoader;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bereal/dcimsaver/MainHook;


# direct methods
.method constructor <init>(Lcom/bereal/dcimsaver/MainHook;)V
    .locals 0

    .line 290
    iput-object p1, p0, Lcom/bereal/dcimsaver/MainHook$8;->this$0:Lcom/bereal/dcimsaver/MainHook;

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 293
    move-object/from16 v1, p1

    iget-object v0, v1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v2, 0x0

    aget-object v0, v0, v2

    move-object v3, v0

    check-cast v3, Landroid/graphics/Bitmap;

    .line 294
    if-eqz v3, :cond_10

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object/from16 v8, p0

    goto/16 :goto_a

    .line 297
    :cond_0
    iget-object v0, v1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v10, 0x1

    aget-object v0, v0, v10

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v11

    .line 298
    iget-object v0, v1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v12, 0x2

    aget-object v0, v0, v12

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 299
    iget-object v4, v1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v13, 0x3

    aget-object v4, v4, v13

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v14

    .line 300
    iget-object v4, v1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v15, 0x4

    aget-object v4, v4, v15

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 302
    invoke-static {}, Landroid/app/AndroidAppHelper;->currentApplication()Landroid/app/Application;

    move-result-object v5

    .line 303
    invoke-static {v5}, Lcom/bereal/dcimsaver/ModConfig;->load(Landroid/content/Context;)Lcom/bereal/dcimsaver/ModConfig;

    move-result-object v5

    .line 306
    iget v6, v5, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    if-eq v6, v10, :cond_2

    .line 307
    iget v6, v5, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    if-ne v6, v12, :cond_1

    goto :goto_0

    :cond_1
    move-object/from16 v8, p0

    move/from16 v16, v13

    move/from16 v18, v15

    move v15, v4

    move-object v13, v5

    goto/16 :goto_4

    .line 309
    :cond_2
    :goto_0
    :try_start_0
    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    .line 310
    const/4 v6, 0x0

    cmpl-float v6, v11, v6

    if-eqz v6, :cond_3

    .line 311
    invoke-virtual {v8, v11}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 313
    :cond_3
    if-eqz v0, :cond_4

    .line 314
    const/high16 v6, -0x40800000    # -1.0f

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-virtual {v8, v6, v7}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 317
    :cond_4
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 316
    move v9, v4

    const/4 v4, 0x0

    move-object/from16 v16, v5

    const/4 v5, 0x0

    move/from16 v17, v9

    const/4 v9, 0x1

    move-object/from16 v18, v16

    move/from16 v16, v13

    move-object/from16 v13, v18

    move/from16 v18, v15

    move/from16 v15, v17

    :try_start_1
    invoke-static/range {v3 .. v9}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 319
    if-ne v4, v3, :cond_6

    .line 320
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 321
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v4

    goto :goto_1

    :cond_5
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 320
    :goto_1
    nop

    .line 322
    invoke-virtual {v3, v4, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 324
    :cond_6
    nop

    .line 325
    if-eqz v0, :cond_7

    const-string v0, "secondary"

    goto :goto_2

    :cond_7
    const-string v0, "primary"

    .line 326
    :goto_2
    iget v5, v13, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    .line 327
    new-instance v6, Ljava/lang/Thread;

    new-instance v7, Lcom/bereal/dcimsaver/MainHook$8$1;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object/from16 v8, p0

    :try_start_2
    invoke-direct {v7, v8, v4, v0, v5}, Lcom/bereal/dcimsaver/MainHook$8$1;-><init>(Lcom/bereal/dcimsaver/MainHook$8;Landroid/graphics/Bitmap;Ljava/lang/String;I)V

    invoke-direct {v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 332
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 333
    goto :goto_4

    :catchall_0
    move-exception v0

    goto :goto_3

    :catchall_1
    move-exception v0

    move-object/from16 v8, p0

    goto :goto_3

    :catchall_2
    move-exception v0

    move-object/from16 v8, p0

    move/from16 v16, v13

    move/from16 v18, v15

    move v15, v4

    move-object v13, v5

    .line 334
    :goto_3
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 339
    :goto_4
    const/16 v0, 0x438

    if-ne v14, v0, :cond_f

    const/16 v0, 0x5a0

    if-ne v15, v0, :cond_f

    .line 340
    iget v4, v13, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    if-ne v4, v10, :cond_8

    .line 341
    iget-object v2, v1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v2, v16

    .line 342
    iget-object v0, v1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/16 v1, 0x780

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v18

    .line 343
    const-string v0, "[BeRealDcimSaver] Boosted upload target resolution to 1440x1920 (2K)"

    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 344
    goto/16 :goto_9

    :cond_8
    iget v0, v13, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    if-ne v0, v12, :cond_9

    .line 345
    iget-object v0, v1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/16 v2, 0x870

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v16

    .line 346
    iget-object v0, v1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/16 v1, 0xb40

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v18

    .line 347
    const-string v0, "[BeRealDcimSaver] Boosted upload target resolution to 2160x2880 (4K)"

    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    goto/16 :goto_8

    .line 348
    :cond_9
    iget v0, v13, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    move/from16 v4, v16

    if-ne v0, v4, :cond_e

    .line 349
    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    rem-int/lit16 v0, v0, 0xb4

    if-eqz v0, :cond_a

    move v2, v10

    .line 350
    :cond_a
    if-eqz v2, :cond_b

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    goto :goto_5

    :cond_b
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    .line 351
    :goto_5
    if-eqz v2, :cond_c

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    goto :goto_6

    :cond_c
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    .line 352
    :goto_6
    nop

    .line 353
    mul-int/lit8 v3, v0, 0x4

    const/16 v16, 0x3

    div-int/lit8 v3, v3, 0x3

    .line 354
    if-le v3, v2, :cond_d

    .line 355
    nop

    .line 356
    mul-int/lit8 v0, v2, 0x3

    div-int/lit8 v0, v0, 0x4

    goto :goto_7

    .line 354
    :cond_d
    move v2, v3

    .line 358
    :goto_7
    if-lez v0, :cond_f

    if-lez v2, :cond_f

    .line 359
    iget-object v3, v1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v16, 0x3

    aput-object v4, v3, v16

    .line 360
    iget-object v1, v1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v18

    .line 361
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "[BeRealDcimSaver] Boosted upload target resolution to Full Sensor 3:4 ("

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 362
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 361
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    goto :goto_9

    .line 348
    :cond_e
    :goto_8
    nop

    .line 366
    :cond_f
    :goto_9
    return-void

    .line 294
    :cond_10
    move-object/from16 v8, p0

    .line 295
    :goto_a
    return-void
.end method
