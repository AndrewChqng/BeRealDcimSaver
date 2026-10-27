.class public Lcom/bereal/dcimsaver/SettingsActivity;
.super Landroid/app/Activity;
.source "SettingsActivity.java"


# instance fields
.field private final syncReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 14
    new-instance v0, Lcom/bereal/dcimsaver/SettingsActivity$1;

    invoke-direct {v0, p0}, Lcom/bereal/dcimsaver/SettingsActivity$1;-><init>(Lcom/bereal/dcimsaver/SettingsActivity;)V

    iput-object v0, p0, Lcom/bereal/dcimsaver/SettingsActivity;->syncReceiver:Landroid/content/BroadcastReceiver;

    .line 12
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 27
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 29
    const/4 p1, 0x1

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/bereal/dcimsaver/SettingsActivity;->requestWindowFeature(I)Z

    .line 30
    invoke-virtual {p0}, Lcom/bereal/dcimsaver/SettingsActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 31
    invoke-virtual {p0}, Lcom/bereal/dcimsaver/SettingsActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, -0xf1f1f0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 32
    invoke-virtual {p0}, Lcom/bereal/dcimsaver/SettingsActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 34
    :catchall_0
    move-exception v0

    :goto_0
    nop

    .line 36
    :cond_0
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/bereal/dcimsaver/SettingsUi;->buildSettingsView(Landroid/content/Context;ZLjava/lang/Runnable;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bereal/dcimsaver/SettingsActivity;->setContentView(Landroid/view/View;)V

    .line 38
    :try_start_1
    new-instance p1, Landroid/content/IntentFilter;

    const-string v0, "com.bereal.dcimsaver.ACTION_SYNC_PREFS"

    invoke-direct {p1, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 39
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 42
    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsActivity;->syncReceiver:Landroid/content/BroadcastReceiver;

    .line 39
    const/16 v2, 0x21

    if-lt v0, v2, :cond_1

    .line 40
    const/4 v0, 0x2

    :try_start_2
    invoke-virtual {p0, v1, p1, v0}, Lcom/bereal/dcimsaver/SettingsActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 41
    goto :goto_2

    .line 42
    :cond_1
    invoke-virtual {p0, v1, p1}, Lcom/bereal/dcimsaver/SettingsActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    .line 44
    :catchall_1
    move-exception p1

    :goto_1
    nop

    .line 46
    :goto_2
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 57
    :try_start_0
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsActivity;->syncReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/bereal/dcimsaver/SettingsActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 58
    :catchall_0
    move-exception v0

    :goto_0
    nop

    .line 60
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 61
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 50
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 51
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->buildSettingsView(Landroid/content/Context;ZLjava/lang/Runnable;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bereal/dcimsaver/SettingsActivity;->setContentView(Landroid/view/View;)V

    .line 52
    return-void
.end method
