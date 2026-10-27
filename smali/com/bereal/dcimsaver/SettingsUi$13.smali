.class Lcom/bereal/dcimsaver/SettingsUi$13;
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
.field private final synthetic val$collectAndSave:Ljava/lang/Runnable;

.field private final synthetic val$ctx:Landroid/content/Context;

.field private final synthetic val$onCloseCallback:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;Landroid/content/Context;Ljava/lang/Runnable;)V
    .locals 0

    .line 611
    iput-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$13;->val$collectAndSave:Ljava/lang/Runnable;

    iput-object p2, p0, Lcom/bereal/dcimsaver/SettingsUi$13;->val$ctx:Landroid/content/Context;

    iput-object p3, p0, Lcom/bereal/dcimsaver/SettingsUi$13;->val$onCloseCallback:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 614
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$13;->val$collectAndSave:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 615
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$13;->val$ctx:Landroid/content/Context;

    const-string v0, "BeReal Mod settings saved!"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 616
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$13;->val$onCloseCallback:Ljava/lang/Runnable;

    if-eqz p1, :cond_0

    .line 617
    iget-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$13;->val$onCloseCallback:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 619
    :cond_0
    return-void
.end method
