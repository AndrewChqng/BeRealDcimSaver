.class Lcom/bereal/dcimsaver/SettingsUi$8;
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

.field private final synthetic val$dialog:Landroid/app/AlertDialog;


# direct methods
.method constructor <init>(Landroid/app/AlertDialog;Landroid/app/Activity;)V
    .locals 0

    .line 352
    iput-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$8;->val$dialog:Landroid/app/AlertDialog;

    iput-object p2, p0, Lcom/bereal/dcimsaver/SettingsUi$8;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 355
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$8;->val$dialog:Landroid/app/AlertDialog;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$8;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 356
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$8;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    .line 358
    :cond_0
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$8;->val$activity:Landroid/app/Activity;

    invoke-static {p1}, Lcom/bereal/dcimsaver/SettingsUi;->showInAppDialog(Landroid/app/Activity;)V

    .line 359
    return-void
.end method
