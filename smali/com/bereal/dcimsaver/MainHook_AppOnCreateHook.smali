.class public final Lcom/bereal/dcimsaver/MainHook$AppOnCreateHook;
.super Lde/robv/android/xposed/XC_MethodHook;
.source "MainHook.java"

# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V
    return-void
.end method

# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 3

    iget-object v0, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;
    check-cast v0, Landroid/app/Application;
    if-nez v0, :cond_0
    return-void

    :cond_0
    new-instance v1, Ljava/io/File;
    invoke-virtual {v0}, Landroid/app/Application;->getFilesDir()Ljava/io/File;
    move-result-object v0
    const-string v2, "camera"
    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
    if-nez v0, :cond_1
    return-void

    :cond_1
    array-length v1, v0
    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2
    aget-object p1, v0, v2
    invoke-static {p1}, Lcom/bereal/dcimsaver/MainHook;->maybeExportCameraWebp(Ljava/io/File;)V
    add-int/lit8 v2, v2, 0x1
    goto :goto_0

    :cond_2
    return-void
.end method
