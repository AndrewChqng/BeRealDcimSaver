.class Lcom/bereal/dcimsaver/MainHook$4;
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

    .line 157
    iput-object p1, p0, Lcom/bereal/dcimsaver/MainHook$4;->this$0:Lcom/bereal/dcimsaver/MainHook;

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 160
    iget-object v0, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    check-cast v0, Landroid/app/Activity;

    .line 161
    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/bereal/dcimsaver/MainHook$4;->this$0:Lcom/bereal/dcimsaver/MainHook;

    invoke-static {v1, v0}, Lcom/bereal/dcimsaver/MainHook;->access$2(Lcom/bereal/dcimsaver/MainHook;Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 164
    :cond_0
    iget-object p1, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v1, 0x0

    aget-object p1, p1, v1

    check-cast p1, Landroid/view/MotionEvent;

    .line 165
    if-nez p1, :cond_1

    .line 166
    return-void

    .line 168
    :cond_1
    iget-object v1, p0, Lcom/bereal/dcimsaver/MainHook$4;->this$0:Lcom/bereal/dcimsaver/MainHook;

    invoke-static {v1, v0, p1}, Lcom/bereal/dcimsaver/MainHook;->access$3(Lcom/bereal/dcimsaver/MainHook;Landroid/app/Activity;Landroid/view/MotionEvent;)V

    .line 169
    return-void

    .line 162
    :cond_2
    :goto_0
    return-void
.end method
