.class Lcom/bereal/dcimsaver/FeedDownloader$1$1;
.super Ljava/lang/Object;
.source "FeedDownloader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/FeedDownloader$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bereal/dcimsaver/FeedDownloader$1;

.field private final synthetic val$callback:Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;

.field private final synthetic val$finalErr:Ljava/lang/String;

.field private final synthetic val$list:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/bereal/dcimsaver/FeedDownloader$1;Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 160
    iput-object p1, p0, Lcom/bereal/dcimsaver/FeedDownloader$1$1;->this$1:Lcom/bereal/dcimsaver/FeedDownloader$1;

    iput-object p2, p0, Lcom/bereal/dcimsaver/FeedDownloader$1$1;->val$callback:Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;

    iput-object p3, p0, Lcom/bereal/dcimsaver/FeedDownloader$1$1;->val$list:Ljava/util/List;

    iput-object p4, p0, Lcom/bereal/dcimsaver/FeedDownloader$1$1;->val$finalErr:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 163
    iget-object v0, p0, Lcom/bereal/dcimsaver/FeedDownloader$1$1;->val$callback:Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;

    iget-object v1, p0, Lcom/bereal/dcimsaver/FeedDownloader$1$1;->val$list:Ljava/util/List;

    iget-object v2, p0, Lcom/bereal/dcimsaver/FeedDownloader$1$1;->val$finalErr:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;->onPostsLoaded(Ljava/util/List;Ljava/lang/String;)V

    .line 164
    return-void
.end method
