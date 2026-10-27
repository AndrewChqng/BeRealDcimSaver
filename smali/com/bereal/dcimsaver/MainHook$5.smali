.class Lcom/bereal/dcimsaver/MainHook$5;
.super Ljava/lang/Object;
.source "MainHook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/MainHook;->handleHeaderLongPressGesture(Landroid/app/Activity;Landroid/view/MotionEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bereal/dcimsaver/MainHook;

.field private final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/bereal/dcimsaver/MainHook;Landroid/app/Activity;)V
    .locals 0

    .line 195
    iput-object p1, p0, Lcom/bereal/dcimsaver/MainHook$5;->this$0:Lcom/bereal/dcimsaver/MainHook;

    iput-object p2, p0, Lcom/bereal/dcimsaver/MainHook$5;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 198
    iget-object v0, p0, Lcom/bereal/dcimsaver/MainHook$5;->this$0:Lcom/bereal/dcimsaver/MainHook;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/bereal/dcimsaver/MainHook;->access$4(Lcom/bereal/dcimsaver/MainHook;Z)V

    .line 200
    :try_start_0
    iget-object v0, p0, Lcom/bereal/dcimsaver/MainHook$5;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bereal/dcimsaver/MainHook$5;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 201
    :goto_0
    if-eqz v0, :cond_1

    .line 202
    invoke-virtual {v0, v1}, Landroid/view/View;->performHapticFeedback(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 204
    :catchall_0
    move-exception v0

    :goto_1
    nop

    .line 206
    :cond_1
    iget-object v0, p0, Lcom/bereal/dcimsaver/MainHook$5;->val$activity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/bereal/dcimsaver/SettingsUi;->showInAppDialog(Landroid/app/Activity;)V

    .line 207
    return-void
.end method
