.class public final Lcom/bereal/dcimsaver/MainHook$FileDeleteHook;
.super Lde/robv/android/xposed/XC_MethodHook;
.source "MainHook.java"

# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V
    return-void
.end method

# virtual methods
.method protected beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 1

    iget-object v0, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;
    check-cast v0, Ljava/io/File;
    invoke-static {v0}, Lcom/bereal/dcimsaver/MainHook;->maybeExportCameraWebp(Ljava/io/File;)V
    return-void
.end method
