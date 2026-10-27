.class Lcom/bereal/dcimsaver/SettingsUi$5;
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
.field private final synthetic val$triggerLoad:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    .line 316
    iput-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$5;->val$triggerLoad:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 319
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$5;->val$triggerLoad:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 320
    return-void
.end method
