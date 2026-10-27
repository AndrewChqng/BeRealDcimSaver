.class Lcom/bereal/dcimsaver/SettingsUi$3$3;
.super Ljava/lang/Object;
.source "SettingsUi.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/SettingsUi$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bereal/dcimsaver/SettingsUi$3;

.field private final synthetic val$activity:Landroid/app/Activity;

.field private final synthetic val$post:Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;


# direct methods
.method constructor <init>(Lcom/bereal/dcimsaver/SettingsUi$3;Landroid/app/Activity;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;)V
    .locals 0

    .line 268
    iput-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$3$3;->this$1:Lcom/bereal/dcimsaver/SettingsUi$3;

    iput-object p2, p0, Lcom/bereal/dcimsaver/SettingsUi$3$3;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/bereal/dcimsaver/SettingsUi$3$3;->val$post:Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 271
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$3$3;->val$activity:Landroid/app/Activity;

    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3$3;->val$post:Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {p1, v0, v1, v2, v1}, Lcom/bereal/dcimsaver/FeedDownloader;->downloadPostMedia(Landroid/content/Context;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;ZZZ)V

    .line 272
    return-void
.end method
