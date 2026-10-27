.class Lcom/bereal/dcimsaver/MainHook$1$1;
.super Ljava/lang/Object;
.source "MainHook.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/MainHook$1;->afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bereal/dcimsaver/MainHook$1;

.field private final synthetic val$app:Landroid/app/Application;


# direct methods
.method constructor <init>(Lcom/bereal/dcimsaver/MainHook$1;Landroid/app/Application;)V
    .locals 0

    .line 83
    iput-object p1, p0, Lcom/bereal/dcimsaver/MainHook$1$1;->this$1:Lcom/bereal/dcimsaver/MainHook$1;

    iput-object p2, p0, Lcom/bereal/dcimsaver/MainHook$1$1;->val$app:Landroid/app/Application;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/bereal/dcimsaver/MainHook$1$1;->val$app:Landroid/app/Application;

    invoke-static {v0}, Lcom/bereal/dcimsaver/MainHook;->access$1(Landroid/content/Context;)V

    .line 87
    return-void
.end method
