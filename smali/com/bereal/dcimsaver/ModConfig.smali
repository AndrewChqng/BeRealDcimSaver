.class public final Lcom/bereal/dcimsaver/ModConfig;
.super Ljava/lang/Object;
.source "ModConfig.java"


# static fields
.field public static final ACTION_SYNC_PREFS:Ljava/lang/String; = "com.bereal.dcimsaver.ACTION_SYNC_PREFS"

.field public static final EXTRA_OPEN_DOWNLOADER:Ljava/lang/String; = "open_bereal_feed_downloader"

.field public static final EXTRA_OPEN_SETTINGS:Ljava/lang/String; = "open_bereal_dcim_settings"

.field public static final EXTRA_SYNC_PREFS:Ljava/lang/String; = "sync_bereal_dcim_prefs"

.field public static final FORMAT_JPEG_100:I = 0x1

.field public static final FORMAT_PNG:I = 0x2

.field public static final FORMAT_WEBP_100:I = 0x0

.field private static final KEY_BYPASS_SIZE_CAP:Ljava/lang/String; = "bypass_size_cap_v2"

.field private static final KEY_FULL_RES_FORMAT:Ljava/lang/String; = "full_res_format"

.field private static final KEY_SAVE_BTS_VIDEOS:Ljava/lang/String; = "save_bts_videos"

.field private static final KEY_SAVE_MODE:Ljava/lang/String; = "save_mode"

.field private static final KEY_SAVE_REALMOJIS:Ljava/lang/String; = "save_realmojis"

.field private static final KEY_UPLOAD_RES_PRESET:Ljava/lang/String; = "upload_res_preset_v2"

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

    .line 35
    const/4 v0, 0x2

    iput v0, p0, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    .line 36
    const/4 v0, 0x0

    iput v0, p0, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    .line 37
    iput v0, p0, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    .line 38
    const/16 v1, 0x64

    iput v1, p0, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    .line 39
    iput-boolean v0, p0, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    .line 40
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    .line 41
    iput-boolean v0, p0, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    .line 7
    return-void
.end method

.method private static clampQuality(I)I
    .locals 1

    .line 130
    const/16 v0, 0x32

    if-ge p0, v0, :cond_0

    return v0

    .line 131
    :cond_0
    const/16 v0, 0x64

    if-le p0, v0, :cond_1

    return v0

    .line 132
    :cond_1
    return p0
.end method

.method public static fromIntent(Landroid/content/Intent;Landroid/content/Context;)Lcom/bereal/dcimsaver/ModConfig;
    .locals 2

    .line 96
    invoke-static {p1}, Lcom/bereal/dcimsaver/ModConfig;->load(Landroid/content/Context;)Lcom/bereal/dcimsaver/ModConfig;

    move-result-object p1

    .line 97
    if-eqz p0, :cond_1

    const-string v0, "sync_bereal_dcim_prefs"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 100
    :cond_0
    const-string v0, "save_mode"

    iget v1, p1, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p1, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    .line 101
    const-string v0, "full_res_format"

    iget v1, p1, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p1, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    .line 102
    const-string v0, "upload_res_preset_v2"

    iget v1, p1, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p1, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    .line 103
    const-string v0, "upload_webp_quality"

    iget v1, p1, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Lcom/bereal/dcimsaver/ModConfig;->clampQuality(I)I

    move-result v0

    iput v0, p1, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    .line 104
    const-string v0, "bypass_size_cap_v2"

    iget-boolean v1, p1, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p1, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    .line 105
    const-string v0, "save_bts_videos"

    iget-boolean v1, p1, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p1, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    .line 106
    const-string v0, "save_realmojis"

    iget-boolean v1, p1, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    iput-boolean p0, p1, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    .line 107
    return-object p1

    .line 98
    :cond_1
    :goto_0
    return-object p1
.end method

.method public static load(Landroid/content/Context;)Lcom/bereal/dcimsaver/ModConfig;
    .locals 4

    .line 44
    new-instance v0, Lcom/bereal/dcimsaver/ModConfig;

    invoke-direct {v0}, Lcom/bereal/dcimsaver/ModConfig;-><init>()V

    .line 45
    if-nez p0, :cond_0

    .line 46
    return-object v0

    .line 49
    :cond_0
    :try_start_0
    const-string v1, "bereal_dcim_prefs"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 50
    const-string v1, "save_mode"

    const/4 v3, 0x2

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    .line 51
    const-string v1, "full_res_format"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    .line 52
    const-string v1, "upload_res_preset_v2"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    .line 53
    const-string v1, "upload_webp_quality"

    const/16 v3, 0x64

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Lcom/bereal/dcimsaver/ModConfig;->clampQuality(I)I

    move-result v1

    iput v1, v0, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    .line 54
    const-string v1, "bypass_size_cap_v2"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, v0, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    .line 55
    const-string v1, "save_bts_videos"

    const/4 v2, 0x1

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, v0, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    .line 56
    const-string v1, "save_realmojis"

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    iput-boolean p0, v0, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 57
    :catchall_0
    move-exception p0

    :goto_0
    nop

    .line 59
    return-object v0
.end method


# virtual methods
.method public save(Landroid/content/Context;)V
    .locals 2

    .line 63
    if-nez p1, :cond_0

    .line 64
    return-void

    .line 67
    :cond_0
    :try_start_0
    const-string v0, "bereal_dcim_prefs"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 68
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 69
    const-string v0, "save_mode"

    iget v1, p0, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 70
    const-string v0, "full_res_format"

    iget v1, p0, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 71
    const-string v0, "upload_res_preset_v2"

    iget v1, p0, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 72
    const-string v0, "upload_webp_quality"

    iget v1, p0, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    invoke-static {v1}, Lcom/bereal/dcimsaver/ModConfig;->clampQuality(I)I

    move-result v1

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 73
    const-string v0, "bypass_size_cap_v2"

    iget-boolean v1, p0, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 74
    const-string v0, "save_bts_videos"

    iget-boolean v1, p0, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 75
    const-string v0, "save_realmojis"

    iget-boolean v1, p0, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 76
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 77
    :catchall_0
    move-exception p1

    :goto_0
    nop

    .line 79
    return-void
.end method

.method public saveAndBroadcast(Landroid/content/Context;)V
    .locals 3

    .line 111
    const-string v0, "com.bereal.dcimsaver.ACTION_SYNC_PREFS"

    invoke-virtual {p0, p1}, Lcom/bereal/dcimsaver/ModConfig;->save(Landroid/content/Context;)V

    .line 112
    if-nez p1, :cond_0

    .line 113
    return-void

    .line 116
    :cond_0
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 117
    const-string v2, "com.bereal.ft"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 118
    invoke-virtual {p0, v1}, Lcom/bereal/dcimsaver/ModConfig;->writeToIntent(Landroid/content/Intent;)V

    .line 119
    invoke-virtual {p1, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 121
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 122
    const-string v0, "com.bereal.dcimsaver"

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 123
    invoke-virtual {p0, v1}, Lcom/bereal/dcimsaver/ModConfig;->writeToIntent(Landroid/content/Intent;)V

    .line 124
    invoke-virtual {p1, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 125
    :catchall_0
    move-exception p1

    :goto_0
    nop

    .line 127
    return-void
.end method

.method public writeToIntent(Landroid/content/Intent;)V
    .locals 2

    .line 82
    if-nez p1, :cond_0

    .line 83
    return-void

    .line 85
    :cond_0
    const-string v0, "sync_bereal_dcim_prefs"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 86
    const-string v0, "save_mode"

    iget v1, p0, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 87
    const-string v0, "full_res_format"

    iget v1, p0, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 88
    const-string v0, "upload_res_preset_v2"

    iget v1, p0, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 89
    iget v0, p0, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    invoke-static {v0}, Lcom/bereal/dcimsaver/ModConfig;->clampQuality(I)I

    move-result v0

    const-string v1, "upload_webp_quality"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 90
    const-string v0, "bypass_size_cap_v2"

    iget-boolean v1, p0, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 91
    const-string v0, "save_bts_videos"

    iget-boolean v1, p0, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 92
    const-string v0, "save_realmojis"

    iget-boolean v1, p0, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 93
    return-void
.end method
