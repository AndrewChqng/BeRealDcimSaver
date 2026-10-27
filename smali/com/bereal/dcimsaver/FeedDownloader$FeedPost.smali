.class public final Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;
.super Ljava/lang/Object;
.source "FeedDownloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bereal/dcimsaver/FeedDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FeedPost"
.end annotation


# instance fields
.field public caption:Ljava/lang/String;

.field public fullName:Ljava/lang/String;

.field public latitude:Ljava/lang/Double;

.field public longitude:Ljava/lang/Double;

.field public ownerId:Ljava/lang/String;

.field public postId:Ljava/lang/String;

.field public postedAt:J

.field public primaryBtsUrl:Ljava/lang/String;

.field public primaryPictureUrl:Ljava/lang/String;

.field public primaryVideoUrl:Ljava/lang/String;

.field public secondaryBtsUrl:Ljava/lang/String;

.field public secondaryPictureUrl:Ljava/lang/String;

.field public secondaryVideoUrl:Ljava/lang/String;

.field public takenAt:J

.field public userName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDisplayUser()Ljava/lang/String;
    .locals 3

    .line 54
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 55
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->fullName:Ljava/lang/String;

    const-string v1, "@"

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->fullName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->fullName:Ljava/lang/String;

    iget-object v2, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 58
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 60
    :cond_1
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->fullName:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->fullName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 61
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->fullName:Ljava/lang/String;

    return-object v0

    .line 63
    :cond_2
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->ownerId:Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->ownerId:Ljava/lang/String;

    goto :goto_0

    :cond_3
    const-string v0, "unknown_user"

    :goto_0
    return-object v0
.end method

.method public getFormattedTime()Ljava/lang/String;
    .locals 5

    .line 74
    iget-wide v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->takenAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 75
    const-string v0, ""

    return-object v0

    .line 77
    :cond_0
    iget-wide v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->takenAt:J

    invoke-static {v0, v1}, Lcom/bereal/dcimsaver/ExifHelper;->normalizeEpochMs(J)J

    move-result-wide v0

    .line 79
    :try_start_0
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "MMM d, HH:mm"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v2, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 80
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 81
    :catchall_0
    move-exception v0

    .line 82
    iget-wide v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->takenAt:J

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSafeUsername()Ljava/lang/String;
    .locals 3

    .line 67
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 68
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    goto :goto_0

    .line 69
    :cond_0
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->ownerId:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->ownerId:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string v0, "user"

    .line 67
    :goto_0
    nop

    .line 70
    const-string v1, "[^a-zA-Z0-9._-]"

    const-string v2, "_"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasVideoOrBts()Z
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryBtsUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 88
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryBtsUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryVideoUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryVideoUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 87
    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method
