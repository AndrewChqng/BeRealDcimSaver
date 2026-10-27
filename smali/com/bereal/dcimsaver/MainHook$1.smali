.class Lcom/bereal/dcimsaver/MainHook$1;
.super Lde/robv/android/xposed/XC_MethodHook;
.source "MainHook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/MainHook;->hookApplicationLifecycle()V
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

    .line 75
    iput-object p1, p0, Lcom/bereal/dcimsaver/MainHook$1;->this$0:Lcom/bereal/dcimsaver/MainHook;

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 78
    iget-object p1, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    check-cast p1, Landroid/app/Application;

    .line 79
    if-eqz p1, :cond_1

    const-string v0, "com.bereal.ft"

    invoke-virtual {p1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 82
    :cond_0
    iget-object v0, p0, Lcom/bereal/dcimsaver/MainHook$1;->this$0:Lcom/bereal/dcimsaver/MainHook;

    invoke-static {v0, p1}, Lcom/bereal/dcimsaver/MainHook;->access$0(Lcom/bereal/dcimsaver/MainHook;Landroid/app/Application;)V

    .line 83
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/bereal/dcimsaver/MainHook$1$1;

    invoke-direct {v1, p0, p1}, Lcom/bereal/dcimsaver/MainHook$1$1;-><init>(Lcom/bereal/dcimsaver/MainHook$1;Landroid/app/Application;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 88
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 89
    return-void

    .line 80
    :cond_1
    :goto_0
    return-void
.end method
