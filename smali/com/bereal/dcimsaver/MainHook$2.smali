.class Lcom/bereal/dcimsaver/MainHook$2;
.super Landroid/content/BroadcastReceiver;
.source "MainHook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/MainHook;->registerSettingsSyncReceiver(Landroid/app/Application;)V
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

    .line 100
    iput-object p1, p0, Lcom/bereal/dcimsaver/MainHook$2;->this$0:Lcom/bereal/dcimsaver/MainHook;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 103
    if-eqz p2, :cond_0

    const-string v0, "com.bereal.dcimsaver.ACTION_SYNC_PREFS"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    invoke-static {p2, p1}, Lcom/bereal/dcimsaver/ModConfig;->fromIntent(Landroid/content/Intent;Landroid/content/Context;)Lcom/bereal/dcimsaver/ModConfig;

    move-result-object p2

    .line 105
    invoke-virtual {p2, p1}, Lcom/bereal/dcimsaver/ModConfig;->save(Landroid/content/Context;)V

    .line 106
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "[BeRealDcimSaver] Synced settings via broadcast (saveMode="

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 107
    iget v0, p2, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ", uploadRes="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v0, p2, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 108
    const-string v0, ", quality="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget p2, p2, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ")"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 106
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 110
    :cond_0
    return-void
.end method
