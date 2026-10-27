.class Lcom/bereal/dcimsaver/MainHook$8$1;
.super Ljava/lang/Object;
.source "MainHook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/MainHook$8;->beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bereal/dcimsaver/MainHook$8;

.field private final synthetic val$fmt:I

.field private final synthetic val$role:Ljava/lang/String;

.field private final synthetic val$toSave:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Lcom/bereal/dcimsaver/MainHook$8;Landroid/graphics/Bitmap;Ljava/lang/String;I)V
    .locals 0

    .line 327
    iput-object p1, p0, Lcom/bereal/dcimsaver/MainHook$8$1;->this$1:Lcom/bereal/dcimsaver/MainHook$8;

    iput-object p2, p0, Lcom/bereal/dcimsaver/MainHook$8$1;->val$toSave:Landroid/graphics/Bitmap;

    iput-object p3, p0, Lcom/bereal/dcimsaver/MainHook$8$1;->val$role:Ljava/lang/String;

    iput p4, p0, Lcom/bereal/dcimsaver/MainHook$8$1;->val$fmt:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 330
    iget-object v0, p0, Lcom/bereal/dcimsaver/MainHook$8$1;->val$toSave:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/bereal/dcimsaver/MainHook$8$1;->val$role:Ljava/lang/String;

    iget v2, p0, Lcom/bereal/dcimsaver/MainHook$8$1;->val$fmt:I

    invoke-static {v0, v1, v2}, Lcom/bereal/dcimsaver/MainHook;->access$5(Landroid/graphics/Bitmap;Ljava/lang/String;I)V

    .line 331
    return-void
.end method
