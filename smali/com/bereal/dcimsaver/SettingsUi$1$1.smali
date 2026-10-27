.class Lcom/bereal/dcimsaver/SettingsUi$1$1;
.super Ljava/lang/Object;
.source "SettingsUi.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/SettingsUi$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bereal/dcimsaver/SettingsUi$1;

.field private final synthetic val$dialog:Landroid/app/AlertDialog;


# direct methods
.method constructor <init>(Lcom/bereal/dcimsaver/SettingsUi$1;Landroid/app/AlertDialog;)V
    .locals 0

    .line 39
    iput-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$1$1;->this$1:Lcom/bereal/dcimsaver/SettingsUi$1;

    iput-object p2, p0, Lcom/bereal/dcimsaver/SettingsUi$1$1;->val$dialog:Landroid/app/AlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$1$1;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$1$1;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 45
    :cond_0
    return-void
.end method
