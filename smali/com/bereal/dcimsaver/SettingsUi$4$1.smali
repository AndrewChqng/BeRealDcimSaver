.class Lcom/bereal/dcimsaver/SettingsUi$4$1;
.super Ljava/lang/Object;
.source "SettingsUi.java"

# interfaces
.implements Lcom/bereal/dcimsaver/FeedDownloader$PostsCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/SettingsUi$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bereal/dcimsaver/SettingsUi$4;

.field private final synthetic val$allPosts:Ljava/util/List;

.field private final synthetic val$renderList:Ljava/lang/Runnable;

.field private final synthetic val$statusTv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/bereal/dcimsaver/SettingsUi$4;Ljava/util/List;Landroid/widget/TextView;Ljava/lang/Runnable;)V
    .locals 0

    .line 297
    iput-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$4$1;->this$1:Lcom/bereal/dcimsaver/SettingsUi$4;

    iput-object p2, p0, Lcom/bereal/dcimsaver/SettingsUi$4$1;->val$allPosts:Ljava/util/List;

    iput-object p3, p0, Lcom/bereal/dcimsaver/SettingsUi$4$1;->val$statusTv:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/bereal/dcimsaver/SettingsUi$4$1;->val$renderList:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPostsLoaded(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
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

    .line 300
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$4$1;->val$allPosts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 301
    if-eqz p1, :cond_0

    .line 302
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$4$1;->val$allPosts:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 304
    :cond_0
    nop

    .line 307
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$4$1;->val$statusTv:Landroid/widget/TextView;

    .line 304
    if-eqz p2, :cond_1

    .line 305
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 306
    goto :goto_0

    .line 307
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Loaded "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$4$1;->val$allPosts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 308
    const-string v0, " posts \u2022 Saved to DCIM/BeReal/BeReal_<username>_<time>_*.webp"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 307
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 310
    :goto_0
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$4$1;->val$renderList:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 311
    return-void
.end method
