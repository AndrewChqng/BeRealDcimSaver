.class Lcom/bereal/dcimsaver/MainHook$3;
.super Lde/robv/android/xposed/XC_MethodHook;
.source "MainHook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/MainHook;->hookMainActivityUi()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bereal/dcimsaver/MainHook;


# direct methods
.method constructor <init>(Lcom/bereal/dcimsaver/MainHook;)V
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/bereal/dcimsaver/MainHook$3;->this$0:Lcom/bereal/dcimsaver/MainHook;

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 131
    iget-object p1, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    check-cast p1, Landroid/app/Activity;

    .line 132
    if-eqz p1, :cond_4

    iget-object v0, p0, Lcom/bereal/dcimsaver/MainHook$3;->this$0:Lcom/bereal/dcimsaver/MainHook;

    invoke-static {v0, p1}, Lcom/bereal/dcimsaver/MainHook;->access$2(Lcom/bereal/dcimsaver/MainHook;Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 135
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 136
    if-eqz v0, :cond_3

    const-string v1, "sync_bereal_dcim_prefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 137
    invoke-static {v0, p1}, Lcom/bereal/dcimsaver/ModConfig;->fromIntent(Landroid/content/Intent;Landroid/content/Context;)Lcom/bereal/dcimsaver/ModConfig;

    move-result-object v3

    .line 138
    invoke-virtual {v3, p1}, Lcom/bereal/dcimsaver/ModConfig;->save(Landroid/content/Context;)V

    .line 139
    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 140
    const-string v1, "[BeRealDcimSaver] Synced settings from launch intent"

    invoke-static {v1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 141
    const-string v1, "open_bereal_feed_downloader"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 142
    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 143
    invoke-static {p1}, Lcom/bereal/dcimsaver/SettingsUi;->showFeedDownloaderDialog(Landroid/app/Activity;)V

    goto :goto_0

    .line 144
    :cond_1
    const-string v1, "open_bereal_dcim_settings"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 145
    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 146
    invoke-static {p1}, Lcom/bereal/dcimsaver/SettingsUi;->showInAppDialog(Landroid/app/Activity;)V

    goto :goto_1

    .line 144
    :cond_2
    :goto_0
    nop

    .line 149
    :cond_3
    :goto_1
    return-void

    .line 133
    :cond_4
    :goto_2
    return-void
.end method
