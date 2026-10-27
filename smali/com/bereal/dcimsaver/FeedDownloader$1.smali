.class Lcom/bereal/dcimsaver/FeedDownloader$1;
.super Ljava/lang/Object;
.source "FeedDownloader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/FeedDownloader;->loadFeedPostsAsync(Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$callback:Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;


# direct methods
.method constructor <init>(Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;)V
    .locals 0

    .line 110
    iput-object p1, p0, Lcom/bereal/dcimsaver/FeedDownloader$1;->val$callback:Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 113
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 114
    nop

    .line 116
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/16 v3, 0x1e

    if-ge v2, v3, :cond_1

    :try_start_0
    invoke-static {}, Lcom/bereal/dcimsaver/FeedDownloader;->access$0()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    goto :goto_1

    .line 117
    :cond_0
    const-wide/16 v3, 0x64

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 116
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 119
    :cond_1
    :goto_1
    invoke-static {}, Lcom/bereal/dcimsaver/FeedDownloader;->access$0()Ljava/lang/Object;

    move-result-object v2

    .line 120
    if-nez v2, :cond_2

    .line 121
    const-string v1, "Database not initialized yet. Browse your BeReal feed first, then reopen this menu."

    .line 122
    goto/16 :goto_8

    .line 124
    :cond_2
    const-string v3, "SELECT p.id, p.ownerId, u.userName, u.fullName, p.takenAt, p.postedAt, p.latitude, p.longitude, p.caption, p.primary_picture_url, p.secondary_picture_url, p.primary_btsMedia_url, p.secondary_btsMedia_url, p.primary_video_url, p.secondary_video_url FROM PostEntity p LEFT JOIN UserEntity u ON p.ownerId = u.id ORDER BY p.takenAt DESC LIMIT 150"

    .line 123
    nop

    .line 132
    const-string v4, "query"

    new-array v5, v1, [Ljava/lang/Object;

    filled-new-array {v3, v5}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v4, v3}, Lde/robv/android/xposed/XposedHelpers;->callMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 133
    const/4 v3, 0x0

    if-eqz v2, :cond_a

    .line 135
    nop

    :cond_3
    :goto_2
    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v4, :cond_4

    .line 158
    nop

    .line 159
    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto/16 :goto_7

    .line 136
    :cond_4
    :try_start_3
    new-instance v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;

    invoke-direct {v4}, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;-><init>()V

    .line 137
    invoke-static {v2, v1}, Lcom/bereal/dcimsaver/FeedDownloader;->access$1(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->postId:Ljava/lang/String;

    .line 138
    const/4 v5, 0x1

    invoke-static {v2, v5}, Lcom/bereal/dcimsaver/FeedDownloader;->access$1(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->ownerId:Ljava/lang/String;

    .line 139
    const/4 v5, 0x2

    invoke-static {v2, v5}, Lcom/bereal/dcimsaver/FeedDownloader;->access$1(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    .line 140
    const/4 v5, 0x3

    invoke-static {v2, v5}, Lcom/bereal/dcimsaver/FeedDownloader;->access$1(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->fullName:Ljava/lang/String;

    .line 141
    const/4 v5, 0x4

    invoke-interface {v2, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_5

    const-wide/16 v5, 0x0

    goto :goto_3

    :cond_5
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    :goto_3
    iput-wide v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->takenAt:J

    .line 142
    const/4 v5, 0x5

    invoke-interface {v2, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_6

    iget-wide v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->takenAt:J

    goto :goto_4

    :cond_6
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    :goto_4
    iput-wide v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->postedAt:J

    .line 143
    const/4 v5, 0x6

    invoke-interface {v2, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_7

    move-object v5, v3

    goto :goto_5

    :cond_7
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    :goto_5
    iput-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->latitude:Ljava/lang/Double;

    .line 144
    const/4 v5, 0x7

    invoke-interface {v2, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_8

    move-object v5, v3

    goto :goto_6

    :cond_8
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    :goto_6
    iput-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->longitude:Ljava/lang/Double;

    .line 145
    const/16 v5, 0x8

    invoke-static {v2, v5}, Lcom/bereal/dcimsaver/FeedDownloader;->access$1(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->caption:Ljava/lang/String;

    .line 146
    const/16 v5, 0x9

    invoke-static {v2, v5}, Lcom/bereal/dcimsaver/FeedDownloader;->access$1(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryPictureUrl:Ljava/lang/String;

    .line 147
    const/16 v5, 0xa

    invoke-static {v2, v5}, Lcom/bereal/dcimsaver/FeedDownloader;->access$1(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryPictureUrl:Ljava/lang/String;

    .line 148
    const/16 v5, 0xb

    invoke-static {v2, v5}, Lcom/bereal/dcimsaver/FeedDownloader;->access$1(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryBtsUrl:Ljava/lang/String;

    .line 149
    const/16 v5, 0xc

    invoke-static {v2, v5}, Lcom/bereal/dcimsaver/FeedDownloader;->access$1(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryBtsUrl:Ljava/lang/String;

    .line 150
    const/16 v5, 0xd

    invoke-static {v2, v5}, Lcom/bereal/dcimsaver/FeedDownloader;->access$1(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryVideoUrl:Ljava/lang/String;

    .line 151
    const/16 v5, 0xe

    invoke-static {v2, v5}, Lcom/bereal/dcimsaver/FeedDownloader;->access$1(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryVideoUrl:Ljava/lang/String;

    .line 152
    iget-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryPictureUrl:Ljava/lang/String;

    invoke-static {v5}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_9

    .line 153
    iget-object v5, v4, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryPictureUrl:Ljava/lang/String;

    invoke-static {v5}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_9

    .line 154
    invoke-virtual {v4}, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->hasVideoOrBts()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 155
    :cond_9
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_2

    .line 158
    :catchall_0
    move-exception v1

    .line 159
    :try_start_4
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 160
    throw v1

    .line 162
    :cond_a
    :goto_7
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "[BeRealDcimSaver] Loaded "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " feed posts from CoreDatabase"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 164
    move-object v1, v3

    goto :goto_8

    :catchall_1
    move-exception v1

    .line 165
    invoke-static {v1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    .line 166
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Query error: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 169
    :goto_8
    nop

    .line 170
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v3, Lcom/bereal/dcimsaver/FeedDownloader$1$1;

    iget-object v4, p0, Lcom/bereal/dcimsaver/FeedDownloader$1;->val$callback:Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;

    invoke-direct {v3, p0, v4, v0, v1}, Lcom/bereal/dcimsaver/FeedDownloader$1$1;-><init>(Lcom/bereal/dcimsaver/FeedDownloader$1;Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 176
    return-void
.end method
