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

.field public ownerId:Ljava/lang/String;

.field public postId:Ljava/lang/String;

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

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDisplayUser()Ljava/lang/String;
    .locals 3

    .line 50
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 51
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

    .line 52
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

    .line 54
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 56
    :cond_1
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->fullName:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->fullName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 57
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->fullName:Ljava/lang/String;

    return-object v0

    .line 59
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

    .line 70
    iget-wide v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->takenAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 71
    const-string v0, ""

    return-object v0

    .line 73
    :cond_0
    iget-wide v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->takenAt:J

    const-wide v2, 0x2540be400L

    cmp-long v0, v0, v2

    iget-wide v1, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->takenAt:J

    if-gez v0, :cond_1

    const-wide/16 v3, 0x3e8

    mul-long/2addr v1, v3

    .line 75
    :cond_1
    :try_start_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v3, "MMM d, HH:mm"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 76
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3, v1, v2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 77
    :catchall_0
    move-exception v0

    .line 78
    iget-wide v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->takenAt:J

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSafeUsername()Ljava/lang/String;
    .locals 3

    .line 63
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    goto :goto_0

    .line 65
    :cond_0
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->ownerId:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->ownerId:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string v0, "user"

    .line 63
    :goto_0
    nop

    .line 66
    const-string v1, "[^a-zA-Z0-9._-]"

    const-string v2, "_"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasVideoOrBts()Z
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryBtsUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryBtsUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->primaryVideoUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 86
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->secondaryVideoUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 83
    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method
