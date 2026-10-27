.class Lcom/bereal/dcimsaver/SettingsActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "SettingsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bereal/dcimsaver/SettingsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bereal/dcimsaver/SettingsActivity;


# direct methods
.method constructor <init>(Lcom/bereal/dcimsaver/SettingsActivity;)V
    .locals 0

    .line 14
    iput-object p1, p0, Lcom/bereal/dcimsaver/SettingsActivity$1;->this$0:Lcom/bereal/dcimsaver/SettingsActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 17
    if-eqz p2, :cond_0

    const-string v0, "com.bereal.dcimsaver.ACTION_SYNC_PREFS"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 18
    invoke-static {p2, p1}, Lcom/bereal/dcimsaver/ModConfig;->fromIntent(Landroid/content/Intent;Landroid/content/Context;)Lcom/bereal/dcimsaver/ModConfig;

    move-result-object p2

    .line 19
    invoke-virtual {p2, p1}, Lcom/bereal/dcimsaver/ModConfig;->save(Landroid/content/Context;)V

    .line 20
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsActivity$1;->this$0:Lcom/bereal/dcimsaver/SettingsActivity;

    iget-object p2, p0, Lcom/bereal/dcimsaver/SettingsActivity$1;->this$0:Lcom/bereal/dcimsaver/SettingsActivity;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p2, v0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->buildSettingsView(Landroid/content/Context;ZLjava/lang/Runnable;)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/bereal/dcimsaver/SettingsActivity;->setContentView(Landroid/view/View;)V

    .line 22
    :cond_0
    return-void
.end method
