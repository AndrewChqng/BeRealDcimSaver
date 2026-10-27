.class Lcom/bereal/dcimsaver/SettingsUi$6;
.super Ljava/lang/Object;
.source "SettingsUi.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/SettingsUi;->buildFeedDownloaderView(Landroid/app/Activity;Landroid/app/AlertDialog;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$activity:Landroid/app/Activity;

.field private final synthetic val$filteredPosts:Ljava/util/List;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/util/List;)V
    .locals 0

    .line 323
    iput-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$6;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/bereal/dcimsaver/SettingsUi$6;->val$filteredPosts:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 326
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$6;->val$activity:Landroid/app/Activity;

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$6;->val$filteredPosts:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p1, v0}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadAllPosts(Landroid/content/Context;Ljava/util/List;)V

    .line 327
    return-void
.end method
