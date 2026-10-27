.class Lcom/bereal/dcimsaver/FeedDownloader$3;
.super Ljava/lang/Object;
.source "FeedDownloader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/FeedDownloader;->downloadAllPosts(Landroid/content/Context;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$ctx:Landroid/content/Context;

.field private final synthetic val$posts:Ljava/util/List;


# direct methods
.method constructor <init>(Ljava/util/List;Landroid/content/Context;)V
    .locals 0

    .line 210
    iput-object p1, p0, Lcom/bereal/dcimsaver/FeedDownloader$3;->val$posts:Ljava/util/List;

    iput-object p2, p0, Lcom/bereal/dcimsaver/FeedDownloader$3;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 213
    nop

    .line 214
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$3;->val$posts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 217
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$3;->val$ctx:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Finished! Saved "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " files with EXIF to DCIM/BeReal"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/bereal/dcimsaver/FeedDownloader;->access$3(Landroid/content/Context;Ljava/lang/String;)V

    .line 218
    return-void

    .line 214
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;

    .line 215
    iget-object v3, p0, Lcom/bereal/dcimsaver/FeedDownloader$3;->val$ctx:Landroid/content/Context;

    const/4 v4, 0x1

    invoke-static {v3, v2, v4, v4, v4}, Lcom/bereal/dcimsaver/FeedDownloader;->access$2(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_0
.end method
