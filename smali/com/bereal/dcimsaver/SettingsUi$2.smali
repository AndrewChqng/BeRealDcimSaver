.class Lcom/bereal/dcimsaver/SettingsUi$2;
.super Ljava/lang/Object;
.source "SettingsUi.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/SettingsUi;->showFeedDownloaderDialog(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 0

    .line 72
    iput-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$2;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 76
    :try_start_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .line 77
    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$2;->val$activity:Landroid/app/Activity;

    .line 76
    const v2, 0x10302d1

    invoke-direct {v0, v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 79
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 80
    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$2;->val$activity:Landroid/app/Activity;

    invoke-static {v1, v0}, Lcom/bereal/dcimsaver/SettingsUi;->access$1(Landroid/app/Activity;Landroid/app/AlertDialog;)Landroid/view/View;

    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setView(Landroid/view/View;)V

    .line 82
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 83
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 84
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 85
    const v2, -0xededec

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 86
    iget-object v2, p0, Lcom/bereal/dcimsaver/SettingsUi$2;->val$activity:Landroid/app/Activity;

    const/16 v3, 0x10

    invoke-static {v2, v3}, Lcom/bereal/dcimsaver/SettingsUi;->access$0(Landroid/content/Context;I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 87
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 89
    :catchall_0
    move-exception v0

    :goto_0
    nop

    .line 91
    :cond_0
    return-void
.end method
