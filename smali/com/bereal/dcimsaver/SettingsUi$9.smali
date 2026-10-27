.class Lcom/bereal/dcimsaver/SettingsUi$9;
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
.field private final synthetic val$dialog:Landroid/app/AlertDialog;


# direct methods
.method constructor <init>(Landroid/app/AlertDialog;)V
    .locals 0

    .line 366
    iput-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$9;->val$dialog:Landroid/app/AlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 369
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$9;->val$dialog:Landroid/app/AlertDialog;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$9;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 370
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$9;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    .line 372
    :cond_0
    return-void
.end method
