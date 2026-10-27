.class public final Lcom/bereal/dcimsaver/MainHook;
.super Ljava/lang/Object;
.source "MainHook.java"

# interfaces
.implements Lde/robv/android/xposed/IXposedHookLoadPackage;

# static fields
.field private static final SAVED_FILES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "BeRealDCIM: "

.field private static final TARGET_PACKAGE:Ljava/lang/String; = "com.bereal.ft"

# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashSet;
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V
    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;
    move-result-object v0
    sput-object v0, Lcom/bereal/dcimsaver/MainHook;->SAVED_FILES:Ljava/util/Set;
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static maybeExportCameraWebp(Ljava/io/File;)V
    .locals 9

    if-nez p0, :cond_0
    return-void

    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v0
    const-string v1, ".webp"
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :cond_1
    return-void

    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object v1
    if-nez v1, :cond_2
    return-void

    :cond_2
    const-string v2, "camera"
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_3
    return-void

    :cond_3
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z
    move-result v1
    if-nez v1, :cond_4
    return-void

    :cond_4
    invoke-virtual {p0}, Ljava/io/File;->length()J
    move-result-wide v1
    const-wide/16 v3, 0x0
    cmp-long v5, v1, v3
    if-gtz v5, :cond_5
    return-void

    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;
    const-string v6, "BeReal_"
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0

    new-instance v5, Ljava/io/File;
    new-instance v6, Ljava/io/File;
    sget-object v7, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;
    invoke-static {v7}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;
    move-result-object v7
    const-string v8, "BeReal"
    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-direct {v5, v6, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z
    move-result v6
    if-eqz v6, :cond_6
    invoke-virtual {v5}, Ljava/io/File;->length()J
    move-result-wide v5
    cmp-long v3, v5, v3
    if-lez v3, :cond_6
    return-void

    :cond_6
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v4, ":"
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J
    move-result-wide v5
    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1

    sget-object v2, Lcom/bereal/dcimsaver/MainHook;->SAVED_FILES:Ljava/util/Set;
    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_7
    return-void

    :cond_7
    :try_start_0
    invoke-static {p0}, Lcom/bereal/dcimsaver/MainHook;->readAllBytes(Ljava/io/File;)[B
    move-result-object v1
    array-length v2, v1
    if-nez v2, :cond_8
    return-void

    :cond_8
    invoke-static {v0, v1}, Lcom/bereal/dcimsaver/MainHook;->saveToDcim(Ljava/lang/String;[B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    return-void

    :catchall_0
    move-exception v0
    new-instance v1, Ljava/lang/StringBuilder;
    const-string v2, "BeRealDCIM: Failed to export "
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object p0
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string p0, ": "
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    return-void
.end method

.method private static readAllBytes(Ljava/io/File;)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/io/FileInputStream;
    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0}, Ljava/io/File;->length()J
    move-result-wide v2
    long-to-int p0, v2
    invoke-direct {v1, p0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    const/16 p0, 0x2000
    new-array p0, p0, [B

    :goto_0
    invoke-virtual {v0, p0}, Ljava/io/FileInputStream;->read([B)I
    move-result v2
    const/4 v3, -0x1
    if-eq v2, v3, :cond_0
    const/4 v3, 0x0
    invoke-virtual {v1, p0, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    return-object p0

    :catchall_0
    move-exception p0
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    throw p0
.end method

.method private static saveToDcim(Ljava/lang/String;[B)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {}, Landroid/app/AndroidAppHelper;->currentApplication()Landroid/app/Application;
    move-result-object v0
    if-eqz v0, :cond_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I
    const/16 v2, 0x1d
    if-lt v1, v2, :cond_2

    invoke-virtual {v0}, Landroid/app/Application;->getContentResolver()Landroid/content/ContentResolver;
    move-result-object v0
    new-instance v1, Landroid/content/ContentValues;
    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "_display_name"
    invoke-virtual {v1, v2, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "mime_type"
    const-string v3, "image/webp"
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    sget-object v3, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v3, "/BeReal"
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    const-string v3, "relative_path"
    invoke-virtual {v1, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    const-string v3, "is_pending"
    invoke-virtual {v1, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    sget-object v2, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    move-result-object v1
    if-eqz v1, :cond_2

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;
    move-result-object v2
    if-eqz v2, :cond_0

    :try_start_0
    invoke-virtual {v2, p1}, Ljava/io/OutputStream;->write([B)V
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    goto :goto_0

    :catchall_0
    move-exception p0
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    throw p0

    :cond_0
    :goto_0
    new-instance p1, Landroid/content/ContentValues;
    invoke-direct {p1}, Landroid/content/ContentValues;-><init>()V
    const/4 v2, 0x0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual {p1, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    const/4 v2, 0x0
    invoke-virtual {v0, v1, p1, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    new-instance p1, Ljava/lang/StringBuilder;
    const-string v0, "BeRealDCIM: Saved "
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string p0, " to DCIM/BeReal via MediaStore ("
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    const-string p0, ")"
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    return-void

    :cond_2
    new-instance v0, Ljava/io/File;
    sget-object v1, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;
    invoke-static {v1}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
    const-string v2, "BeReal"
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :cond_3
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_3
    new-instance v1, Ljava/io/File;
    invoke-direct {v1, v0, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    new-instance p0, Ljava/io/FileOutputStream;
    invoke-direct {p0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    :try_start_1
    invoke-virtual {p0, p1}, Ljava/io/FileOutputStream;->write([B)V
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V

    new-instance p0, Ljava/lang/StringBuilder;
    const-string p1, "BeRealDCIM: Saved "
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object p1
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static {p0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V
    return-void

    :catchall_1
    move-exception p1
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V
    throw p1
.end method

# virtual methods
.method public handleLoadPackage(Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    const-string v0, "com.bereal.ft"
    iget-object v1, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->packageName:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :cond_0
    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v1, "BeRealDCIM: Loaded into "
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    iget-object p1, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->packageName:Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static {p1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    const-class p1, Landroid/app/Application;
    const/4 v0, 0x1
    new-array v1, v0, [Ljava/lang/Object;
    new-instance v2, Lcom/bereal/dcimsaver/MainHook$AppOnCreateHook;
    invoke-direct {v2}, Lcom/bereal/dcimsaver/MainHook$AppOnCreateHook;-><init>()V
    const/4 v3, 0x0
    aput-object v2, v1, v3
    const-string v2, "onCreate"
    invoke-static {p1, v2, v1}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-class p1, Landroid/net/Uri;
    const/4 v1, 0x2
    new-array v1, v1, [Ljava/lang/Object;
    const-class v2, Ljava/io/File;
    aput-object v2, v1, v3
    new-instance v2, Lcom/bereal/dcimsaver/MainHook$UriFromFileHook;
    invoke-direct {v2}, Lcom/bereal/dcimsaver/MainHook$UriFromFileHook;-><init>()V
    aput-object v2, v1, v0
    const-string v2, "fromFile"
    invoke-static {p1, v2, v1}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    const-class p1, Ljava/io/File;
    new-array v0, v0, [Ljava/lang/Object;
    new-instance v1, Lcom/bereal/dcimsaver/MainHook$FileDeleteHook;
    invoke-direct {v1}, Lcom/bereal/dcimsaver/MainHook$FileDeleteHook;-><init>()V
    aput-object v1, v0, v3
    const-string v1, "delete"
    invoke-static {p1, v1, v0}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    return-void
.end method
