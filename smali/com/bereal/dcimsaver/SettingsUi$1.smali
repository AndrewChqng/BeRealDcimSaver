.class Lcom/bereal/dcimsaver/SettingsUi$1;
.super Ljava/lang/Object;
.source "SettingsUi.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/SettingsUi;->showInAppDialog(Landroid/app/Activity;)V
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

    .line 38
    iput-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 42
    :try_start_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .line 43
    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$1;->val$activity:Landroid/app/Activity;

    .line 42
    const v2, 0x10302d1

    invoke-direct {v0, v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 45
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 46
    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$1;->val$activity:Landroid/app/Activity;

    new-instance v2, Lcom/bereal/dcimsaver/SettingsUi$1$1;

    invoke-direct {v2, p0, v0}, Lcom/bereal/dcimsaver/SettingsUi$1$1;-><init>(Lcom/bereal/dcimsaver/SettingsUi$1;Landroid/app/AlertDialog;)V

    const/4 v3, 0x0

    invoke-static {v1, v3, v2}, Lcom/bereal/dcimsaver/SettingsUi;->buildSettingsView(Landroid/content/Context;ZLjava/lang/Runnable;)Landroid/view/View;

    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setView(Landroid/view/View;)V

    .line 55
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 56
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 57
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 58
    const v2, -0xededec

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 59
    iget-object v2, p0, Lcom/bereal/dcimsaver/SettingsUi$1;->val$activity:Landroid/app/Activity;

    const/16 v3, 0x10

    invoke-static {v2, v3}, Lcom/bereal/dcimsaver/SettingsUi;->access$0(Landroid/content/Context;I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 60
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 62
    :catchall_0
    move-exception v0

    :goto_0
    nop

    .line 64
    :cond_0
    return-void
.end method
