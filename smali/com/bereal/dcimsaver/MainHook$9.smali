.class Lcom/bereal/dcimsaver/MainHook$9;
.super Lde/robv/android/xposed/XC_MethodHook;
.source "MainHook.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/MainHook;->hookWebpCompressorAndSizeCap(Ljava/lang/ClassLoader;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bereal/dcimsaver/MainHook;

.field private final synthetic val$cl:Ljava/lang/ClassLoader;


# direct methods
.method constructor <init>(Lcom/bereal/dcimsaver/MainHook;Ljava/lang/ClassLoader;)V
    .locals 0

    .line 387
    iput-object p1, p0, Lcom/bereal/dcimsaver/MainHook$9;->this$0:Lcom/bereal/dcimsaver/MainHook;

    iput-object p2, p0, Lcom/bereal/dcimsaver/MainHook$9;->val$cl:Ljava/lang/ClassLoader;

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 390
    iget-object p1, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v0, 0x1

    aget-object p1, p1, v0

    .line 391
    if-nez p1, :cond_0

    .line 392
    return-void

    .line 394
    :cond_0
    invoke-static {}, Landroid/app/AndroidAppHelper;->currentApplication()Landroid/app/Application;

    move-result-object v0

    .line 395
    invoke-static {v0}, Lcom/bereal/dcimsaver/ModConfig;->load(Landroid/content/Context;)Lcom/bereal/dcimsaver/ModConfig;

    move-result-object v0

    .line 398
    const-string v1, "d"

    iget v2, v0, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    invoke-static {p1, v1, v2}, Lde/robv/android/xposed/XposedHelpers;->setIntField(Ljava/lang/Object;Ljava/lang/String;I)V

    .line 401
    iget-boolean v1, v0, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    if-eqz v1, :cond_1

    .line 402
    const-string v1, "kvb"

    iget-object v2, p0, Lcom/bereal/dcimsaver/MainHook$9;->val$cl:Ljava/lang/ClassLoader;

    invoke-static {v1, v2}, Lde/robv/android/xposed/XposedHelpers;->findClassIfExists(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    .line 403
    if-eqz v1, :cond_1

    .line 404
    const-string v2, "a"

    invoke-static {v1, v2}, Lde/robv/android/xposed/XposedHelpers;->getStaticObjectField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 405
    if-eqz v1, :cond_1

    .line 406
    const-string v2, "c"

    invoke-static {p1, v2, v1}, Lde/robv/android/xposed/XposedHelpers;->setObjectField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 410
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "[BeRealDcimSaver] Configured WebP encoder: quality="

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 411
    iget v1, v0, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "%, bypass700KB="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-boolean v0, v0, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 410
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 412
    return-void
.end method
