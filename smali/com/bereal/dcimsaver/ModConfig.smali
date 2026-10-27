.class public final Lcom/bereal/dcimsaver/ModConfig;
.super Ljava/lang/Object;
.source "ModConfig.java"


# static fields
.field public static final ACTION_SYNC_PREFS:Ljava/lang/String; = "com.bereal.dcimsaver.ACTION_SYNC_PREFS"

.field public static final EXTRA_OPEN_SETTINGS:Ljava/lang/String; = "open_bereal_dcim_settings"

.field public static final EXTRA_SYNC_PREFS:Ljava/lang/String; = "sync_bereal_dcim_prefs"

.field public static final FORMAT_JPEG_100:I = 0x1

.field public static final FORMAT_PNG:I = 0x2

.field public static final FORMAT_WEBP_100:I = 0x0

.field private static final KEY_BYPASS_SIZE_CAP:Ljava/lang/String; = "bypass_size_cap"

.field private static final KEY_FULL_RES_FORMAT:Ljava/lang/String; = "full_res_format"

.field private static final KEY_SAVE_BTS_VIDEOS:Ljava/lang/String; = "save_bts_videos"

.field private static final KEY_SAVE_MODE:Ljava/lang/String; = "save_mode"

.field private static final KEY_SAVE_REALMOJIS:Ljava/lang/String; = "save_realmojis"

.field private static final KEY_UPLOAD_RES_PRESET:Ljava/lang/String; = "upload_res_preset"

.field private static final KEY_UPLOAD_WEBP_QUALITY:Ljava/lang/String; = "upload_webp_quality"

.field public static final PREFS_NAME:Ljava/lang/String; = "bereal_dcim_prefs"

.field public static final SAVE_MODE_BOTH:I = 0x2

.field public static final SAVE_MODE_FULL_RES:I = 0x1

.field public static final SAVE_MODE_PROCESSED:I = 0x0

.field public static final UPLOAD_RES_1080:I = 0x0

.field public static final UPLOAD_RES_1440:I = 0x1

.field public static final UPLOAD_RES_2160:I = 0x2

.field public static final UPLOAD_RES_FULL:I = 0x3


# instance fields
.field public bypassSizeCap:Z

.field public fullResFormat:I

.field public saveBtsVideos:Z

.field public saveMode:I

.field public saveRealMojis:Z

.field public uploadResPreset:I

.field public uploadWebpQuality:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x2

    iput v0, p0, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    .line 35
    const/4 v1, 0x0

    iput v1, p0, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    .line 36
    iput v0, p0, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    .line 37
    const/16 v0, 0x64

    iput v0, p0, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    .line 38
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    .line 39
    iput-boolean v0, p0, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    .line 40
    iput-boolean v0, p0, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    .line 7
    return-void
.end method

.method private static clampQuality(I)I
    .locals 1

    .line 129
    const/16 v0, 0x32

    if-ge p0, v0, :cond_0

    return v0

    .line 130
    :cond_0
    const/16 v0, 0x64

    if-le p0, v0, :cond_1

    return v0

    .line 131
    :cond_1
    return p0
.end method

.method public static fromIntent(Landroid/content/Intent;Landroid/content/Context;)Lcom/bereal/dcimsaver/ModConfig;
    .locals 2

    .line 95
    invoke-static {p1}, Lcom/bereal/dcimsaver/ModConfig;->load(Landroid/content/Context;)Lcom/bereal/dcimsaver/ModConfig;

    move-result-object p1

    .line 96
    if-eqz p0, :cond_1

    const-string v0, "sync_bereal_dcim_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 99
    :cond_0
    const-string v0, "save_mode"

    iget v1, p1, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p1, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    .line 100
    const-string v0, "full_res_format"

    iget v1, p1, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p1, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    .line 101
    const-string v0, "upload_res_preset"

    iget v1, p1, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p1, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    .line 102
    const-string v0, "upload_webp_quality"

    iget v1, p1, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Lcom/bereal/dcimsaver/ModConfig;->clampQuality(I)I

    move-result v0

    iput v0, p1, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    .line 103
    const-string v0, "bypass_size_cap"

    iget-boolean v1, p1, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p1, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    .line 104
    const-string v0, "save_bts_videos"

    iget-boolean v1, p1, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p1, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    .line 105
    const-string v0, "save_realmojis"

    iget-boolean v1, p1, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    iput-boolean p0, p1, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    .line 106
    return-object p1

    .line 97
    :cond_1
    :goto_0
    return-object p1
.end method

.method public static load(Landroid/content/Context;)Lcom/bereal/dcimsaver/ModConfig;
    .locals 4

    .line 43
    new-instance v0, Lcom/bereal/dcimsaver/ModConfig;

    invoke-direct {v0}, Lcom/bereal/dcimsaver/ModConfig;-><init>()V

    .line 44
    if-nez p0, :cond_0

    .line 45
    return-object v0

    .line 48
    :cond_0
    :try_start_0
    const-string v1, "bereal_dcim_prefs"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 49
    const-string v1, "save_mode"

    const/4 v3, 0x2

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    .line 50
    const-string v1, "full_res_format"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    .line 51
    const-string v1, "upload_res_preset"

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    .line 52
    const-string v1, "upload_webp_quality"

    const/16 v2, 0x64

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Lcom/bereal/dcimsaver/ModConfig;->clampQuality(I)I

    move-result v1

    iput v1, v0, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    .line 53
    const-string v1, "bypass_size_cap"

    const/4 v2, 0x1

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, v0, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    .line 54
    const-string v1, "save_bts_videos"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, v0, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    .line 55
    const-string v1, "save_realmojis"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    iput-boolean p0, v0, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 56
    :catchall_0
    move-exception p0

    :goto_0
    nop

    .line 58
    return-object v0
.end method


# virtual methods
.method public save(Landroid/content/Context;)V
    .locals 2

    .line 62
    if-nez p1, :cond_0

    .line 63
    return-void

    .line 66
    :cond_0
    :try_start_0
    const-string v0, "bereal_dcim_prefs"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 67
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 68
    const-string v0, "save_mode"

    iget v1, p0, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 69
    const-string v0, "full_res_format"

    iget v1, p0, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 70
    const-string v0, "upload_res_preset"

    iget v1, p0, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 71
    const-string v0, "upload_webp_quality"

    iget v1, p0, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    invoke-static {v1}, Lcom/bereal/dcimsaver/ModConfig;->clampQuality(I)I

    move-result v1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 72
    const-string v0, "bypass_size_cap"

    iget-boolean v1, p0, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 73
    const-string v0, "save_bts_videos"

    iget-boolean v1, p0, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 74
    const-string v0, "save_realmojis"

    iget-boolean v1, p0, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 75
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 76
    :catchall_0
    move-exception p1

    :goto_0
    nop

    .line 78
    return-void
.end method

.method public saveAndBroadcast(Landroid/content/Context;)V
    .locals 3

    .line 110
    const-string v0, "com.bereal.dcimsaver.ACTION_SYNC_PREFS"

    invoke-virtual {p0, p1}, Lcom/bereal/dcimsaver/ModConfig;->save(Landroid/content/Context;)V

    .line 111
    if-nez p1, :cond_0

    .line 112
    return-void

    .line 115
    :cond_0
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 116
    const-string v2, "com.bereal.ft"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 117
    invoke-virtual {p0, v1}, Lcom/bereal/dcimsaver/ModConfig;->writeToIntent(Landroid/content/Intent;)V

    .line 118
    invoke-virtual {p1, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 120
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 121
    const-string v0, "com.bereal.dcimsaver"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 122
    invoke-virtual {p0, v1}, Lcom/bereal/dcimsaver/ModConfig;->writeToIntent(Landroid/content/Intent;)V

    .line 123
    invoke-virtual {p1, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 124
    :catchall_0
    move-exception p1

    :goto_0
    nop

    .line 126
    return-void
.end method

.method public writeToIntent(Landroid/content/Intent;)V
    .locals 2

    .line 81
    if-nez p1, :cond_0

    .line 82
    return-void

    .line 84
    :cond_0
    const-string v0, "sync_bereal_dcim_prefs"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 85
    const-string v0, "save_mode"

    iget v1, p0, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 86
    const-string v0, "full_res_format"

    iget v1, p0, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 87
    const-string v0, "upload_res_preset"

    iget v1, p0, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 88
    iget v0, p0, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    invoke-static {v0}, Lcom/bereal/dcimsaver/ModConfig;->clampQuality(I)I

    move-result v0

    const-string v1, "upload_webp_quality"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 89
    const-string v0, "bypass_size_cap"

    iget-boolean v1, p0, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 90
    const-string v0, "save_bts_videos"

    iget-boolean v1, p0, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 91
    const-string v0, "save_realmojis"

    iget-boolean v1, p0, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 92
    return-void
.end method
