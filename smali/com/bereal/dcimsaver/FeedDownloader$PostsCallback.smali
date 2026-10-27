.class public interface abstract Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;
.super Ljava/lang/Object;
.source "FeedDownloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bereal/dcimsaver/FeedDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PostsCallback"
.end annotation


# virtual methods
.method public abstract onPostsLoaded(Ljava/util/List;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation
.end method
