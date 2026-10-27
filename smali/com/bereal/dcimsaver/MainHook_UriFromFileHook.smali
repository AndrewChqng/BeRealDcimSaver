.class public final Lcom/bereal/dcimsaver/MainHook$UriFromFileHook;
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
    .locals 2

    iget-object v0, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;
    const/4 v1, 0x0
    aget-object v0, v0, v1
    check-cast v0, Ljava/io/File;
    invoke-static {v0}, Lcom/bereal/dcimsaver/MainHook;->maybeExportCameraWebp(Ljava/io/File;)V
    return-void
.end method
