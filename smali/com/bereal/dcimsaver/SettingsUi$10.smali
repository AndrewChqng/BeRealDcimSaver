.class Lcom/bereal/dcimsaver/SettingsUi$10;
.super Ljava/lang/Object;
.source "SettingsUi.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/SettingsUi;->buildSettingsView(Landroid/content/Context;ZLjava/lang/Runnable;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$cfg:Lcom/bereal/dcimsaver/ModConfig;

.field private final synthetic val$ctx:Landroid/content/Context;

.field private final synthetic val$isStandaloneApp:Z

.field private final synthetic val$onCloseCallback:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(ZLandroid/content/Context;Ljava/lang/Runnable;Lcom/bereal/dcimsaver/ModConfig;)V
    .locals 0

    .line 438
    iput-boolean p1, p0, Lcom/bereal/dcimsaver/SettingsUi$10;->val$isStandaloneApp:Z

    iput-object p2, p0, Lcom/bereal/dcimsaver/SettingsUi$10;->val$ctx:Landroid/content/Context;

    iput-object p3, p0, Lcom/bereal/dcimsaver/SettingsUi$10;->val$onCloseCallback:Ljava/lang/Runnable;

    iput-object p4, p0, Lcom/bereal/dcimsaver/SettingsUi$10;->val$cfg:Lcom/bereal/dcimsaver/ModConfig;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 441
    iget-boolean p1, p0, Lcom/bereal/dcimsaver/SettingsUi$10;->val$isStandaloneApp:Z

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$10;->val$ctx:Landroid/content/Context;

    instance-of p1, p1, Landroid/app/Activity;

    if-eqz p1, :cond_1

    .line 442
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$10;->val$onCloseCallback:Ljava/lang/Runnable;

    if-eqz p1, :cond_0

    .line 443
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$10;->val$onCloseCallback:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 445
    :cond_0
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$10;->val$ctx:Landroid/content/Context;

    check-cast p1, Landroid/app/Activity;

    invoke-static {p1}, Lcom/bereal/dcimsaver/SettingsUi;->showFeedDownloaderDialog(Landroid/app/Activity;)V

    .line 446
    goto :goto_0

    .line 448
    :cond_1
    const/4 p1, 0x0

    :try_start_0
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$10;->val$ctx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "com.bereal.ft"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 449
    if-eqz v0, :cond_2

    .line 450
    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$10;->val$cfg:Lcom/bereal/dcimsaver/ModConfig;

    invoke-virtual {v1, v0}, Lcom/bereal/dcimsaver/ModConfig;->writeToIntent(Landroid/content/Intent;)V

    .line 451
    const-string v1, "open_bereal_feed_downloader"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 452
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 453
    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$10;->val$ctx:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 454
    goto :goto_0

    .line 455
    :cond_2
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$10;->val$ctx:Landroid/content/Context;

    const-string v1, "BeReal (com.bereal.ft) is not installed"

    invoke-static {v0, v1, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 457
    goto :goto_0

    :catchall_0
    move-exception v0

    .line 458
    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$10;->val$ctx:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Could not launch BeReal: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 461
    :goto_0
    return-void
.end method
