.class Lcom/bereal/dcimsaver/FeedDownloader$2;
.super Ljava/lang/Object;
.source "FeedDownloader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/FeedDownloader;->downloadPostMedia(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$ctx:Landroid/content/Context;

.field private final synthetic val$dlPrimary:Z

.field private final synthetic val$dlSecondary:Z

.field private final synthetic val$dlVideoBts:Z

.field private final synthetic val$post:Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)V
    .locals 0

    .line 191
    iput-object p1, p0, Lcom/bereal/dcimsaver/FeedDownloader$2;->val$ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/bereal/dcimsaver/FeedDownloader$2;->val$post:Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;

    iput-boolean p3, p0, Lcom/bereal/dcimsaver/FeedDownloader$2;->val$dlPrimary:Z

    iput-boolean p4, p0, Lcom/bereal/dcimsaver/FeedDownloader$2;->val$dlSecondary:Z

    iput-boolean p5, p0, Lcom/bereal/dcimsaver/FeedDownloader$2;->val$dlVideoBts:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 194
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$2;->val$ctx:Landroid/content/Context;

    iget-object v1, p0, Lcom/bereal/dcimsaver/FeedDownloader$2;->val$post:Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;

    iget-boolean v2, p0, Lcom/bereal/dcimsaver/FeedDownloader$2;->val$dlPrimary:Z

    iget-boolean v3, p0, Lcom/bereal/dcimsaver/FeedDownloader$2;->val$dlSecondary:Z

    iget-boolean v4, p0, Lcom/bereal/dcimsaver/FeedDownloader$2;->val$dlVideoBts:Z

    invoke-static {v0, v1, v2, v3, v4}, Lcom/bereal/dcimsaver/FeedDownloader;->access$2(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)I

    move-result v0

    .line 195
    nop

    .line 198
    iget-object v1, p0, Lcom/bereal/dcimsaver/FeedDownloader$2;->val$ctx:Landroid/content/Context;

    .line 195
    if-lez v0, :cond_0

    .line 196
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Saved "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " file(s) with EXIF from "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/bereal/dcimsaver/FeedDownloader$2;->val$post:Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;

    invoke-virtual {v2}, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->getDisplayUser()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " to DCIM/BeReal"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/bereal/dcimsaver/FeedDownloader;->access$3(Landroid/content/Context;Ljava/lang/String;)V

    .line 197
    goto :goto_0

    .line 198
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Failed to download media for "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/bereal/dcimsaver/FeedDownloader$2;->val$post:Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;

    invoke-virtual {v2}, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->getDisplayUser()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/bereal/dcimsaver/FeedDownloader;->access$3(Landroid/content/Context;Ljava/lang/String;)V

    .line 200
    :goto_0
    return-void
.end method
