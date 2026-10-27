.class Lcom/bereal/dcimsaver/MainHook$6;
.super Lde/robv/android/xposed/XC_MethodHook;
.source "MainHook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/MainHook;->hookCoreDatabase(Ljava/lang/ClassLoader;)V
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

    .line 246
    iput-object p1, p0, Lcom/bereal/dcimsaver/MainHook$6;->this$0:Lcom/bereal/dcimsaver/MainHook;

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 249
    iget-object v0, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 250
    iget-object p1, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    invoke-static {p1}, Lcom/bereal/dcimsaver/FeedDownloader;->setCoreDatabase(Ljava/lang/Object;)V

    .line 252
    :cond_0
    return-void
.end method
