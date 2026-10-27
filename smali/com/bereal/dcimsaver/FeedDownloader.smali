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

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0()Ljava/lang/Object;
    .locals 1

    .line 33
    sget-object v0, Lcom/bereal/dcimsaver/FeedDownloader;->sCoreDatabase:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1(Landroid/database/Cursor;I)Ljava/lang/String;
    .locals 0

    .line 360
    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/FeedDownloader;->getStr(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)I
    .locals 0

    .line 212
    invoke-static {p0, p1, p2, p3, p4}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadPostSync(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)I

    move-result p0

    return p0
.end method

.method static synthetic access$3(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 371
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

    .line 195
    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 199
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Downloading "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " posts to DCIM/BeReal..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/bereal/dcimsaver/FeedDownloader;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 200
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/bereal/dcimsaver/FeedDownloader$3;

    invoke-direct {v1, p1, p0}, Lcom/bereal/dcimsaver/FeedDownloader$3;-><init>(Ljava/util/List;Landroid/content/Context;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 209
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 210
    return-void

    .line 196
    :cond_1
    :goto_0
    const-string p1, "No feed posts to download"

    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/FeedDownloader;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 197
    return-void
.end method

.method public static downloadPostMedia(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)V
    .locals 7

    .line 177
    if-nez p1, :cond_0

    .line 178
    return-void

    .line 180
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

    .line 181
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/bereal/dcimsaver/FeedDownloader$2;

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/bereal/dcimsaver/FeedDownloader$2;-><init>(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 191
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 192
    return-void
.end method

.method private static downloadPostSync(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)I
    .locals 10

    .line 219
    nop

    .line 220
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "BeReal_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->getSafeUsername()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->takenAt:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    iget-wide v1, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->takenAt:J

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    :goto_0
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 222
    const-string v1, "image/jpeg"

    const-string v2, "image/webp"

    const-string v3, ".jpg"

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz p2, :cond_2

    iget-object p2, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryPictureUrl:Ljava/lang/String;

    invoke-static {p2}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 223
    iget-object p2, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryPictureUrl:Ljava/lang/String;

    invoke-static {p2}, Lcom/bereal/dcimsaver/FeedDownloader;->guessImageExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 224
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    move-object v6, v1

    goto :goto_1

    :cond_1
    move-object v6, v2

    .line 225
    :goto_1
    iget-object v7, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryPictureUrl:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "_primary"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, v7, p2, v6, v5}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadUrlToDcim(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 226
    move p2, v4

    goto :goto_2

    .line 229
    :cond_2
    move p2, v5

    :goto_2
    if-eqz p3, :cond_4

    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryPictureUrl:Ljava/lang/String;

    invoke-static {p3}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 230
    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryPictureUrl:Ljava/lang/String;

    invoke-static {p3}, Lcom/bereal/dcimsaver/FeedDownloader;->guessImageExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 231
    invoke-virtual {v3, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_3

    :cond_3
    move-object v1, v2

    .line 232
    :goto_3
    iget-object v2, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryPictureUrl:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "_secondary"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p0, v2, p3, v1, v5}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadUrlToDcim(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 233
    add-int/lit8 p2, p2, 0x1

    .line 236
    :cond_4
    if-eqz p4, :cond_8

    .line 237
    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryBtsUrl:Ljava/lang/String;

    invoke-static {p3}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result p3

    const-string p4, "video/mp4"

    if-eqz p3, :cond_5

    .line 238
    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryBtsUrl:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "_bts_primary.mp4"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p3, v1, p4, v4}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadUrlToDcim(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p3

    if-eqz p3, :cond_5

    .line 239
    add-int/lit8 p2, p2, 0x1

    .line 242
    :cond_5
    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryBtsUrl:Ljava/lang/String;

    invoke-static {p3}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_6

    .line 243
    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryBtsUrl:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "_bts_secondary.mp4"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p3, v1, p4, v4}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadUrlToDcim(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p3

    if-eqz p3, :cond_6

    .line 244
    add-int/lit8 p2, p2, 0x1

    .line 247
    :cond_6
    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryVideoUrl:Ljava/lang/String;

    invoke-static {p3}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_7

    .line 248
    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryVideoUrl:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "_video_primary.mp4"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p3, v1, p4, v4}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadUrlToDcim(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p3

    if-eqz p3, :cond_7

    .line 249
    add-int/lit8 p2, p2, 0x1

    .line 252
    :cond_7
    iget-object p3, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryVideoUrl:Ljava/lang/String;

    invoke-static {p3}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_8

    .line 253
    iget-object p1, p1, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryVideoUrl:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "_video_secondary.mp4"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p0, p1, p3, p4, v4}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadUrlToDcim(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_8

    .line 254
    add-int/lit8 p2, p2, 0x1

    .line 258
    :cond_8
    return p2
.end method

.method private static downloadUrlToDcim(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 9

    .line 268
    const-string v0, "is_pending"

    .line 269
    nop

    .line 271
    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_0
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 272
    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v3

    check-cast v3, Ljava/net/HttpURLConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_9

    .line 273
    const/16 v4, 0x3a98

    :try_start_1
    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 274
    const/16 v4, 0x4e20

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 275
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 276
    const-string v5, "User-Agent"

    const-string v6, "BeReal/3.98.0 (Android)"

    invoke-virtual {v3, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v5

    .line 278
    const/16 v6, 0xc8

    if-lt v5, v6, :cond_b

    const/16 v6, 0x12c

    if-lt v5, v6, :cond_0

    goto/16 :goto_c

    .line 282
    :cond_0
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_8

    .line 284
    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    :try_start_2
    invoke-static {}, Landroid/app/AndroidAppHelper;->currentApplication()Landroid/app/Application;

    move-result-object p0

    .line 285
    :goto_0
    const/16 v5, 0x2000

    if-eqz p0, :cond_6

    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x1d

    if-lt v6, v7, :cond_6

    .line 286
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    .line 287
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 288
    const-string v7, "_display_name"

    invoke-virtual {v6, v7, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    const-string v7, "mime_type"

    invoke-virtual {v6, v7, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    const-string p3, "relative_path"

    new-instance v7, Ljava/lang/StringBuilder;

    sget-object v8, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "/BeReal"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, p3, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {v6, v0, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 293
    if-eqz p4, :cond_2

    .line 294
    sget-object p3, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_1

    .line 295
    :cond_2
    sget-object p3, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 293
    :goto_1
    nop

    .line 296
    invoke-virtual {p0, p3, v6}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p3

    .line 297
    if-eqz p3, :cond_6

    .line 298
    invoke-virtual {p0, p3}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object p4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_6

    .line 299
    if-eqz p4, :cond_6

    .line 301
    :try_start_3
    new-array v5, v5, [B

    .line 303
    nop

    :goto_2
    invoke-virtual {p1, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6

    if-gtz v6, :cond_5

    .line 306
    invoke-virtual {p4}, Ljava/io/OutputStream;->flush()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 307
    nop

    .line 308
    :try_start_4
    invoke-virtual {p4}, Ljava/io/OutputStream;->close()V

    .line 310
    new-instance p4, Landroid/content/ContentValues;

    invoke-direct {p4}, Landroid/content/ContentValues;-><init>()V

    .line 311
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p4, v0, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 312
    invoke-virtual {p0, p3, p4, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 313
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p3, "[BeRealDcimSaver] Downloaded feed media -> DCIM/BeReal/"

    invoke-direct {p0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_6

    .line 344
    if-eqz p1, :cond_3

    :try_start_5
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 345
    :goto_3
    goto :goto_4

    :catchall_0
    move-exception p0

    goto :goto_3

    .line 347
    :cond_3
    :goto_4
    if-eqz v3, :cond_4

    :try_start_6
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 348
    :goto_5
    goto :goto_6

    :catchall_1
    move-exception p0

    goto :goto_5

    .line 314
    :cond_4
    :goto_6
    return v4

    .line 304
    :cond_5
    :try_start_7
    invoke-virtual {p4, v5, v1, v6}, Ljava/io/OutputStream;->write([BII)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto :goto_2

    .line 307
    :catchall_2
    move-exception p0

    .line 308
    :try_start_8
    invoke-virtual {p4}, Ljava/io/OutputStream;->close()V

    .line 309
    throw p0

    .line 320
    :cond_6
    sget-object p0, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-static {p0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    .line 321
    new-instance p3, Ljava/io/File;

    const-string p4, "BeReal"

    invoke-direct {p3, p0, p4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 322
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_7

    .line 323
    invoke-virtual {p3}, Ljava/io/File;->mkdirs()Z

    .line 325
    :cond_7
    new-instance p0, Ljava/io/File;

    invoke-direct {p0, p3, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 326
    new-instance p2, Ljava/io/FileOutputStream;

    invoke-direct {p2, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    .line 328
    :try_start_9
    new-array p3, v5, [B

    .line 330
    nop

    :goto_7
    invoke-virtual {p1, p3}, Ljava/io/InputStream;->read([B)I

    move-result p4

    if-gtz p4, :cond_a

    .line 333
    invoke-virtual {p2}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object p3

    invoke-virtual {p3}, Ljava/io/FileDescriptor;->sync()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 334
    nop

    .line 335
    :try_start_a
    invoke-virtual {p2}, Ljava/io/FileOutputStream;->close()V

    .line 337
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "[BeRealDcimSaver] Downloaded feed media direct -> "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 344
    if-eqz p1, :cond_8

    :try_start_b
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 345
    :goto_8
    goto :goto_9

    :catchall_3
    move-exception p0

    goto :goto_8

    .line 347
    :cond_8
    :goto_9
    if-eqz v3, :cond_9

    :try_start_c
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    .line 348
    :goto_a
    goto :goto_b

    :catchall_4
    move-exception p0

    goto :goto_a

    .line 338
    :cond_9
    :goto_b
    return v4

    .line 331
    :cond_a
    :try_start_d
    invoke-virtual {p2, p3, v1, p4}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    goto :goto_7

    .line 334
    :catchall_5
    move-exception p0

    .line 335
    :try_start_e
    invoke-virtual {p2}, Ljava/io/FileOutputStream;->close()V

    .line 336
    throw p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    .line 339
    :catchall_6
    move-exception p0

    move-object v2, p1

    goto :goto_f

    .line 279
    :cond_b
    :goto_c
    :try_start_f
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "[BeRealDcimSaver] HTTP "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, " downloading "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_8

    .line 344
    nop

    .line 347
    if-eqz v3, :cond_c

    :try_start_10
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_7

    .line 348
    :goto_d
    goto :goto_e

    :catchall_7
    move-exception p0

    goto :goto_d

    .line 280
    :cond_c
    :goto_e
    return v1

    .line 339
    :catchall_8
    move-exception p0

    goto :goto_f

    :catchall_9
    move-exception p0

    move-object v3, v2

    .line 340
    :goto_f
    :try_start_11
    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_c

    .line 344
    if-eqz v2, :cond_d

    :try_start_12
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_a

    .line 345
    :goto_10
    goto :goto_11

    :catchall_a
    move-exception p0

    goto :goto_10

    .line 347
    :cond_d
    :goto_11
    if-eqz v3, :cond_e

    :try_start_13
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_b

    .line 348
    :goto_12
    goto :goto_13

    :catchall_b
    move-exception p0

    goto :goto_12

    .line 341
    :cond_e
    :goto_13
    return v1

    .line 342
    :catchall_c
    move-exception p0

    .line 344
    if-eqz v2, :cond_f

    :try_start_14
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_d

    .line 345
    :goto_14
    goto :goto_15

    :catchall_d
    move-exception p1

    goto :goto_14

    .line 347
    :cond_f
    :goto_15
    if-eqz v3, :cond_10

    :try_start_15
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_e

    .line 348
    :goto_16
    goto :goto_17

    :catchall_e
    move-exception p1

    goto :goto_16

    .line 349
    :cond_10
    :goto_17
    throw p0
.end method

.method private static getStr(Landroid/database/Cursor;I)Ljava/lang/String;
    .locals 1

    .line 361
    invoke-interface {p0, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 362
    const/4 p0, 0x0

    return-object p0

    .line 364
    :cond_0
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static guessImageExt(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 353
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 354
    const-string v0, ".jpg"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, ".jpeg"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    .line 357
    :cond_0
    const-string p0, ".webp"

    return-object p0

    .line 355
    :cond_1
    :goto_0
    return-object v0
.end method

.method public static hasDatabase()Z
    .locals 1

    .line 102
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

    .line 368
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

    .line 106
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/bereal/dcimsaver/FeedDownloader$1;

    invoke-direct {v1, p0}, Lcom/bereal/dcimsaver/FeedDownloader$1;-><init>(Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 167
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 168
    return-void
.end method

.method public static setCoreDatabase(Ljava/lang/Object;)V
    .locals 2

    .line 95
    if-eqz p0, :cond_0

    sget-object v0, Lcom/bereal/dcimsaver/FeedDownloader;->sCoreDatabase:Ljava/lang/Object;

    if-eq v0, p0, :cond_0

    .line 96
    sput-object p0, Lcom/bereal/dcimsaver/FeedDownloader;->sCoreDatabase:Ljava/lang/Object;

    .line 97
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

    .line 99
    :cond_0
    return-void
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 372
    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/app/AndroidAppHelper;->currentApplication()Landroid/app/Application;

    move-result-object p0

    .line 373
    :goto_0
    if-nez p0, :cond_1

    .line 374
    return-void

    .line 376
    :cond_1
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/bereal/dcimsaver/FeedDownloader$4;

    invoke-direct {v1, p0, p1}, Lcom/bereal/dcimsaver/FeedDownloader$4;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 385
    return-void
.end method
