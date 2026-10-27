.class public final Lcom/bereal/dcimsaver/FeedDownloader;
.super Ljava/lang/Object;
.source "FeedDownloader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;,
        Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "[BeRealDcimSaver] "

.field private static volatile sCoreDatabase:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Ljava/lang/Object;
    .locals 1

    .line 34
    sget-object v0, Lcom/bereal/dcimsaver/FeedDownloader;->sCoreDatabase:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1(Landroid/database/Cursor;I)Ljava/lang/String;
    .locals 0

    .line 412
    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/FeedDownloader;->getStr(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)I
    .locals 0

    .line 222
    invoke-static {p0, p1, p2, p3, p4}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadPostSync(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)I

    move-result p0

    return p0
.end method

.method static synthetic access$3(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 423
    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/FeedDownloader;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static downloadAllPosts(Landroid/content/Context;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;",
            ">;)V"
        }
    .end annotation

    .line 205
    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 209
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Downloading "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " posts with EXIF to DCIM/BeReal..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/bereal/dcimsaver/FeedDownloader;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 210
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/bereal/dcimsaver/FeedDownloader$3;

    invoke-direct {v1, p1, p0}, Lcom/bereal/dcimsaver/FeedDownloader$3;-><init>(Ljava/util/List;Landroid/content/Context;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 219
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 220
    return-void

    .line 206
    :cond_1
    :goto_0
    const-string p1, "No feed posts to download"

    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/FeedDownloader;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 207
    return-void
.end method

.method public static downloadPostMedia(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)V
    .locals 7

    .line 187
    if-nez p1, :cond_0

    .line 188
    return-void

    .line 190
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Downloading "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->getDisplayUser()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/bereal/dcimsaver/FeedDownloader;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 191
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/bereal/dcimsaver/FeedDownloader$2;

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/bereal/dcimsaver/FeedDownloader$2;-><init>(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 201
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 202
    return-void
.end method

.method private static downloadPostSync(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)I
    .locals 12

    .line 229
    nop

    .line 230
    iget-wide v0, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->takenAt:J

    invoke-static {v0, v1}, Lcom/bereal/dcimsaver/ExifHelper;->normalizeEpochMs(J)J

    move-result-wide v0

    .line 231
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "BeReal_"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->getSafeUsername()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 233
    const-string v1, "image/jpeg"

    const-string v2, "image/webp"

    const-string v3, ".jpg"

    if-eqz p2, :cond_1

    iget-object p2, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryPictureUrl:Ljava/lang/String;

    invoke-static {p2}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 234
    iget-object p2, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryPictureUrl:Ljava/lang/String;

    invoke-static {p2}, Lcom/bereal/dcimsaver/FeedDownloader;->guessImageExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 235
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move-object v10, v1

    goto :goto_0

    :cond_0
    move-object v10, v2

    .line 236
    :goto_0
    iget-object v8, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryPictureUrl:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "_primary"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v11, 0x0

    const-string v7, "primary"

    move-object v5, p0

    move-object v6, p1

    invoke-static/range {v5 .. v11}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadUrlToDcim(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 237
    const/4 p2, 0x1

    goto :goto_1

    .line 240
    :cond_1
    const/4 p2, 0x0

    :goto_1
    if-eqz p3, :cond_3

    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryPictureUrl:Ljava/lang/String;

    invoke-static {p3}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_3

    .line 241
    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryPictureUrl:Ljava/lang/String;

    invoke-static {p3}, Lcom/bereal/dcimsaver/FeedDownloader;->guessImageExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 242
    invoke-virtual {v3, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move-object v9, v1

    goto :goto_2

    :cond_2
    move-object v9, v2

    .line 243
    :goto_2
    iget-object v7, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryPictureUrl:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "_secondary"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v10, 0x0

    const-string v6, "secondary"

    move-object v4, p0

    move-object v5, p1

    invoke-static/range {v4 .. v10}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadUrlToDcim(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p3

    if-eqz p3, :cond_3

    .line 244
    add-int/lit8 p2, p2, 0x1

    .line 247
    :cond_3
    if-eqz p4, :cond_7

    .line 248
    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryBtsUrl:Ljava/lang/String;

    invoke-static {p3}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 249
    iget-object v7, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryBtsUrl:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "_bts_primary.mp4"

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "video/mp4"

    const/4 v10, 0x1

    const-string v6, "bts_primary"

    move-object v4, p0

    move-object v5, p1

    invoke-static/range {v4 .. v10}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadUrlToDcim(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 250
    add-int/lit8 p2, p2, 0x1

    .line 253
    :cond_4
    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryBtsUrl:Ljava/lang/String;

    invoke-static {p3}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_5

    .line 254
    iget-object v7, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryBtsUrl:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "_bts_secondary.mp4"

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "video/mp4"

    const/4 v10, 0x1

    const-string v6, "bts_secondary"

    move-object v4, p0

    move-object v5, p1

    invoke-static/range {v4 .. v10}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadUrlToDcim(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p3

    if-eqz p3, :cond_5

    .line 255
    add-int/lit8 p2, p2, 0x1

    .line 258
    :cond_5
    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryVideoUrl:Ljava/lang/String;

    invoke-static {p3}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_6

    .line 259
    iget-object v7, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryVideoUrl:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "_video_primary.mp4"

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "video/mp4"

    const/4 v10, 0x1

    const-string v6, "video_primary"

    move-object v4, p0

    move-object v5, p1

    invoke-static/range {v4 .. v10}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadUrlToDcim(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p3

    if-eqz p3, :cond_6

    .line 260
    add-int/lit8 p2, p2, 0x1

    .line 263
    :cond_6
    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryVideoUrl:Ljava/lang/String;

    invoke-static {p3}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_7

    .line 264
    iget-object v7, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryVideoUrl:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "_video_secondary.mp4"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "video/mp4"

    const/4 v10, 0x1

    const-string v6, "video_secondary"

    move-object v4, p0

    move-object v5, p1

    invoke-static/range {v4 .. v10}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadUrlToDcim(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_7

    .line 265
    add-int/lit8 p2, p2, 0x1

    .line 269
    :cond_7
    return p2
.end method

.method private static downloadUrlToDcim(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 16

    .line 281
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    const-string v3, "is_pending"

    .line 282
    nop

    .line 283
    nop

    .line 285
    const/4 v4, 0x0

    const/4 v5, 0x0

    if-eqz p0, :cond_0

    move-object/from16 v6, p0

    goto :goto_0

    :cond_0
    :try_start_0
    invoke-static {}, Landroid/app/AndroidAppHelper;->currentApplication()Landroid/app/Application;

    move-result-object v6

    .line 286
    :goto_0
    if-eqz v6, :cond_1

    invoke-virtual {v6}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v7

    if-eqz v7, :cond_1

    .line 287
    invoke-virtual {v6}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v7

    goto :goto_1

    .line 288
    :cond_1
    new-instance v7, Ljava/io/File;

    const-string v8, "/data/local/tmp"

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 286
    :goto_1
    nop

    .line 289
    new-instance v8, Ljava/io/File;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "bereal_dl_"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v7, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_e

    .line 291
    :try_start_1
    new-instance v7, Ljava/net/URL;

    invoke-direct {v7, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 292
    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v7

    check-cast v7, Ljava/net/HttpURLConnection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_d

    .line 293
    const/16 v9, 0x3a98

    :try_start_2
    invoke-virtual {v7, v9}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 294
    const/16 v9, 0x4e20

    invoke-virtual {v7, v9}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 295
    const/4 v9, 0x1

    invoke-virtual {v7, v9}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 296
    const-string v10, "User-Agent"

    const-string v11, "BeReal/3.98.0 (Android)"

    invoke-virtual {v7, v10, v11}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v10

    .line 298
    const/16 v11, 0xc8

    if-lt v10, v11, :cond_11

    const/16 v11, 0x12c

    if-lt v10, v11, :cond_2

    goto/16 :goto_12

    .line 302
    :cond_2
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_c

    .line 304
    :try_start_3
    new-instance v10, Ljava/io/FileOutputStream;

    invoke-direct {v10, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_9

    .line 306
    const/16 v11, 0x2000

    :try_start_4
    new-array v12, v11, [B

    .line 308
    nop

    :goto_2
    invoke-virtual {v1, v12}, Ljava/io/InputStream;->read([B)I

    move-result v13

    if-gtz v13, :cond_10

    .line 311
    invoke-virtual {v10}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/FileDescriptor;->sync()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_8

    .line 312
    nop

    .line 313
    :try_start_5
    invoke-virtual {v10}, Ljava/io/FileOutputStream;->close()V

    .line 316
    if-eqz v0, :cond_3

    iget-wide v12, v0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->takenAt:J

    goto :goto_3

    :cond_3
    const-wide/16 v12, 0x0

    :goto_3
    invoke-static {v12, v13}, Lcom/bereal/dcimsaver/ExifHelper;->normalizeEpochMs(J)J

    move-result-wide v12

    .line 319
    if-nez p6, :cond_4

    if-eqz v0, :cond_4

    .line 320
    move-object/from16 v14, p2

    invoke-static {v6, v8, v0, v14}, Lcom/bereal/dcimsaver/ExifHelper;->applyFeedPostExif(Landroid/content/Context;Ljava/io/File;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;Ljava/lang/String;)V

    .line 321
    goto :goto_4

    .line 322
    :cond_4
    invoke-virtual {v8, v12, v13}, Ljava/io/File;->setLastModified(J)Z

    .line 325
    :goto_4
    if-eqz v6, :cond_a

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x1d

    if-lt v0, v10, :cond_a

    .line 326
    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 327
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 328
    const-string v10, "_display_name"

    invoke-virtual {v6, v10, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    const-string v10, "mime_type"

    move-object/from16 v15, p5

    invoke-virtual {v6, v10, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 330
    const-string v10, "relative_path"

    new-instance v14, Ljava/lang/StringBuilder;

    sget-object v15, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-static {v15}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v15, "/BeReal"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v10, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    invoke-static {v6, v12, v13}, Lcom/bereal/dcimsaver/ExifHelper;->populateMediaStoreTimestamps(Landroid/content/ContentValues;J)V

    .line 332
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v6, v3, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 334
    if-eqz p6, :cond_5

    .line 335
    sget-object v10, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_5

    .line 336
    :cond_5
    sget-object v10, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 334
    :goto_5
    nop

    .line 337
    invoke-virtual {v0, v10, v6}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v6

    .line 338
    if-eqz v6, :cond_a

    .line 339
    invoke-virtual {v0, v6}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v10

    .line 340
    if-eqz v10, :cond_a

    .line 341
    new-instance v14, Ljava/io/FileInputStream;

    invoke-direct {v14, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_9

    .line 343
    :try_start_6
    new-array v11, v11, [B

    .line 345
    nop

    :goto_6
    invoke-virtual {v14, v11}, Ljava/io/FileInputStream;->read([B)I

    move-result v15

    if-gtz v15, :cond_9

    .line 348
    invoke-virtual {v10}, Ljava/io/OutputStream;->flush()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 349
    nop

    .line 350
    :try_start_7
    invoke-virtual {v14}, Ljava/io/FileInputStream;->close()V

    .line 351
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V

    .line 353
    new-instance v10, Landroid/content/ContentValues;

    invoke-direct {v10}, Landroid/content/ContentValues;-><init>()V

    .line 354
    invoke-static {v10, v12, v13}, Lcom/bereal/dcimsaver/ExifHelper;->populateMediaStoreTimestamps(Landroid/content/ContentValues;J)V

    .line 355
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v10, v3, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 356
    invoke-virtual {v0, v6, v10, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 357
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "[BeRealDcimSaver] Downloaded feed media with EXIF -> DCIM/BeReal/"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_9

    .line 391
    if-eqz v1, :cond_6

    :try_start_8
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 392
    :goto_7
    goto :goto_8

    :catchall_0
    move-exception v0

    goto :goto_7

    .line 394
    :cond_6
    :goto_8
    if-eqz v7, :cond_7

    :try_start_9
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 395
    :goto_9
    goto :goto_a

    :catchall_1
    move-exception v0

    goto :goto_9

    .line 397
    :cond_7
    :goto_a
    :try_start_a
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 398
    invoke-virtual {v8}, Ljava/io/File;->delete()Z
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    goto :goto_b

    .line 400
    :catchall_2
    move-exception v0

    :goto_b
    nop

    .line 358
    :cond_8
    return v9

    .line 346
    :cond_9
    :try_start_b
    invoke-virtual {v10, v11, v4, v15}, Ljava/io/OutputStream;->write([BII)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    goto :goto_6

    .line 349
    :catchall_3
    move-exception v0

    .line 350
    :try_start_c
    invoke-virtual {v14}, Ljava/io/FileInputStream;->close()V

    .line 351
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V

    .line 352
    throw v0

    .line 364
    :cond_a
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 365
    new-instance v3, Ljava/io/File;

    const-string v5, "BeReal"

    invoke-direct {v3, v0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 366
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_b

    .line 367
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    .line 369
    :cond_b
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v3, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 370
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 371
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_9

    .line 373
    :try_start_d
    new-array v5, v11, [B

    .line 375
    nop

    :goto_c
    invoke-virtual {v2, v5}, Ljava/io/FileInputStream;->read([B)I

    move-result v6

    if-gtz v6, :cond_f

    .line 378
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/FileDescriptor;->sync()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    .line 379
    nop

    .line 380
    :try_start_e
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 381
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 383
    invoke-virtual {v0, v12, v13}, Ljava/io/File;->setLastModified(J)Z

    .line 384
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[BeRealDcimSaver] Downloaded feed media with EXIF direct -> "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_9

    .line 391
    if-eqz v1, :cond_c

    :try_start_f
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    .line 392
    :goto_d
    goto :goto_e

    :catchall_4
    move-exception v0

    goto :goto_d

    .line 394
    :cond_c
    :goto_e
    if-eqz v7, :cond_d

    :try_start_10
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_5

    .line 395
    :goto_f
    goto :goto_10

    :catchall_5
    move-exception v0

    goto :goto_f

    .line 397
    :cond_d
    :goto_10
    :try_start_11
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 398
    invoke-virtual {v8}, Ljava/io/File;->delete()Z
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_6

    goto :goto_11

    .line 400
    :catchall_6
    move-exception v0

    :goto_11
    nop

    .line 385
    :cond_e
    return v9

    .line 376
    :cond_f
    :try_start_12
    invoke-virtual {v3, v5, v4, v6}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_7

    goto :goto_c

    .line 379
    :catchall_7
    move-exception v0

    .line 380
    :try_start_13
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 381
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 382
    throw v0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_9

    .line 309
    :cond_10
    move-object/from16 v14, p2

    move-object/from16 v15, p5

    :try_start_14
    invoke-virtual {v10, v12, v4, v13}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_8

    goto/16 :goto_2

    .line 312
    :catchall_8
    move-exception v0

    .line 313
    :try_start_15
    invoke-virtual {v10}, Ljava/io/FileOutputStream;->close()V

    .line 314
    throw v0
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_9

    .line 386
    :catchall_9
    move-exception v0

    move-object v5, v1

    goto :goto_16

    .line 299
    :cond_11
    :goto_12
    :try_start_16
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "[BeRealDcimSaver] HTTP "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " downloading "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_c

    .line 391
    nop

    .line 394
    if-eqz v7, :cond_12

    :try_start_17
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_a

    .line 395
    :goto_13
    goto :goto_14

    :catchall_a
    move-exception v0

    goto :goto_13

    .line 397
    :cond_12
    :goto_14
    :try_start_18
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 398
    invoke-virtual {v8}, Ljava/io/File;->delete()Z
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_b

    goto :goto_15

    .line 400
    :catchall_b
    move-exception v0

    :goto_15
    nop

    .line 300
    :cond_13
    return v4

    .line 386
    :catchall_c
    move-exception v0

    goto :goto_16

    :catchall_d
    move-exception v0

    move-object v7, v5

    goto :goto_16

    :catchall_e
    move-exception v0

    move-object v7, v5

    move-object v8, v7

    .line 387
    :goto_16
    :try_start_19
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_12

    .line 391
    if-eqz v5, :cond_14

    :try_start_1a
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_f

    .line 392
    :goto_17
    goto :goto_18

    :catchall_f
    move-exception v0

    goto :goto_17

    .line 394
    :cond_14
    :goto_18
    if-eqz v7, :cond_15

    :try_start_1b
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_10

    .line 395
    :goto_19
    goto :goto_1a

    :catchall_10
    move-exception v0

    goto :goto_19

    .line 397
    :cond_15
    :goto_1a
    if-eqz v8, :cond_16

    :try_start_1c
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 398
    invoke-virtual {v8}, Ljava/io/File;->delete()Z
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_11

    goto :goto_1b

    .line 400
    :catchall_11
    move-exception v0

    :goto_1b
    nop

    .line 388
    :cond_16
    return v4

    .line 389
    :catchall_12
    move-exception v0

    move-object v1, v0

    .line 391
    if-eqz v5, :cond_17

    :try_start_1d
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_13

    .line 392
    :goto_1c
    goto :goto_1d

    :catchall_13
    move-exception v0

    goto :goto_1c

    .line 394
    :cond_17
    :goto_1d
    if-eqz v7, :cond_18

    :try_start_1e
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_14

    .line 395
    :goto_1e
    goto :goto_1f

    :catchall_14
    move-exception v0

    goto :goto_1e

    .line 397
    :cond_18
    :goto_1f
    if-eqz v8, :cond_19

    :try_start_1f
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 398
    invoke-virtual {v8}, Ljava/io/File;->delete()Z
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_15

    goto :goto_20

    .line 400
    :catchall_15
    move-exception v0

    :goto_20
    nop

    .line 401
    :cond_19
    throw v1
.end method

.method private static getStr(Landroid/database/Cursor;I)Ljava/lang/String;
    .locals 1

    .line 413
    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 414
    const/4 p0, 0x0

    return-object p0

    .line 416
    :cond_0
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static guessImageExt(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 405
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 406
    const-string v0, ".jpg"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, ".jpeg"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    .line 409
    :cond_0
    const-string p0, ".webp"

    return-object p0

    .line 407
    :cond_1
    :goto_0
    return-object v0
.end method

.method public static hasDatabase()Z
    .locals 1

    .line 106
    sget-object v0, Lcom/bereal/dcimsaver/FeedDownloader;->sCoreDatabase:Ljava/lang/Object;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static isNonEmpty(Ljava/lang/String;)Z
    .locals 0

    .line 420
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static loadFeedPostsAsync(Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;)V
    .locals 2

    .line 110
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/bereal/dcimsaver/FeedDownloader$1;

    invoke-direct {v1, p0}, Lcom/bereal/dcimsaver/FeedDownloader$1;-><init>(Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 177
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 178
    return-void
.end method

.method public static setCoreDatabase(Ljava/lang/Object;)V
    .locals 2

    .line 99
    if-eqz p0, :cond_0

    sget-object v0, Lcom/bereal/dcimsaver/FeedDownloader;->sCoreDatabase:Ljava/lang/Object;

    if-eq v0, p0, :cond_0

    .line 100
    sput-object p0, Lcom/bereal/dcimsaver/FeedDownloader;->sCoreDatabase:Ljava/lang/Object;

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[BeRealDcimSaver] Captured CoreDatabase instance: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 103
    :cond_0
    return-void
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 424
    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/app/AndroidAppHelper;->currentApplication()Landroid/app/Application;

    move-result-object p0

    .line 425
    :goto_0
    if-nez p0, :cond_1

    .line 426
    return-void

    .line 428
    :cond_1
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/bereal/dcimsaver/FeedDownloader$4;

    invoke-direct {v1, p0, p1}, Lcom/bereal/dcimsaver/FeedDownloader$4;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 437
    return-void
.end method
