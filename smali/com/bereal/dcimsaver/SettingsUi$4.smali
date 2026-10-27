.class Lcom/bereal/dcimsaver/SettingsUi$4;
.super Ljava/lang/Object;
.source "SettingsUi.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/SettingsUi;->buildFeedDownloaderView(Landroid/app/Activity;Landroid/app/AlertDialog;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$allPosts:Ljava/util/List;

.field private final synthetic val$renderList:Ljava/lang/Runnable;

.field private final synthetic val$statusTv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;Ljava/util/List;Ljava/lang/Runnable;)V
    .locals 0

    .line 293
    iput-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$4;->val$statusTv:Landroid/widget/TextView;

    iput-object p2, p0, Lcom/bereal/dcimsaver/SettingsUi$4;->val$allPosts:Ljava/util/List;

    iput-object p3, p0, Lcom/bereal/dcimsaver/SettingsUi$4;->val$renderList:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 296
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$4;->val$statusTv:Landroid/widget/TextView;

    const-string v1, "Querying BeReal feed database..."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 297
    new-instance v0, Lcom/bereal/dcimsaver/SettingsUi$4$1;

    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$4;->val$allPosts:Ljava/util/List;

    iget-object v2, p0, Lcom/bereal/dcimsaver/SettingsUi$4;->val$statusTv:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/bereal/dcimsaver/SettingsUi$4;->val$renderList:Ljava/lang/Runnable;

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/bereal/dcimsaver/SettingsUi$4$1;-><init>(Lcom/bereal/dcimsaver/SettingsUi$4;Ljava/util/List;Landroid/widget/TextView;Ljava/lang/Runnable;)V

    invoke-static {v0}, Lcom/bereal/dcimsaver/FeedDownloader;->loadFeedPostsAsync(Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;)V

    .line 313
    return-void
.end method
