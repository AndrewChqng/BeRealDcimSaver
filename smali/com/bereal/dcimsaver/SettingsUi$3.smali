.class Lcom/bereal/dcimsaver/SettingsUi$3;
.super Ljava/lang/Object;
.source "SettingsUi.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/SettingsUi;->buildSettingsView(Landroid/content/Context;ZLjava/lang/Runnable;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$cbBts:Landroid/widget/CheckBox;

.field private final synthetic val$cbBypassCap:Landroid/widget/CheckBox;

.field private final synthetic val$cbRealMojis:Landroid/widget/CheckBox;

.field private final synthetic val$cfg:Lcom/bereal/dcimsaver/ModConfig;

.field private final synthetic val$ctx:Landroid/content/Context;

.field private final synthetic val$rgFormat:Landroid/widget/RadioGroup;

.field private final synthetic val$rgSaveMode:Landroid/widget/RadioGroup;

.field private final synthetic val$rgUploadRes:Landroid/widget/RadioGroup;

.field private final synthetic val$sbQuality:Landroid/widget/SeekBar;


# direct methods
.method constructor <init>(Lcom/bereal/dcimsaver/ModConfig;Landroid/widget/RadioGroup;Landroid/widget/RadioGroup;Landroid/widget/RadioGroup;Landroid/widget/SeekBar;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/content/Context;)V
    .locals 0

    .line 228
    iput-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cfg:Lcom/bereal/dcimsaver/ModConfig;

    iput-object p2, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$rgSaveMode:Landroid/widget/RadioGroup;

    iput-object p3, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$rgFormat:Landroid/widget/RadioGroup;

    iput-object p4, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$rgUploadRes:Landroid/widget/RadioGroup;

    iput-object p5, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$sbQuality:Landroid/widget/SeekBar;

    iput-object p6, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cbBypassCap:Landroid/widget/CheckBox;

    iput-object p7, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cbBts:Landroid/widget/CheckBox;

    iput-object p8, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cbRealMojis:Landroid/widget/CheckBox;

    iput-object p9, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 231
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cfg:Lcom/bereal/dcimsaver/ModConfig;

    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$rgSaveMode:Landroid/widget/RadioGroup;

    const/4 v2, 0x2

    invoke-static {v1, v2}, Lcom/bereal/dcimsaver/SettingsUi;->access$1(Landroid/widget/RadioGroup;I)I

    move-result v1

    iput v1, v0, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    .line 232
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cfg:Lcom/bereal/dcimsaver/ModConfig;

    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$rgFormat:Landroid/widget/RadioGroup;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/bereal/dcimsaver/SettingsUi;->access$1(Landroid/widget/RadioGroup;I)I

    move-result v1

    iput v1, v0, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    .line 233
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cfg:Lcom/bereal/dcimsaver/ModConfig;

    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$rgUploadRes:Landroid/widget/RadioGroup;

    invoke-static {v1, v2}, Lcom/bereal/dcimsaver/SettingsUi;->access$1(Landroid/widget/RadioGroup;I)I

    move-result v1

    iput v1, v0, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    .line 234
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cfg:Lcom/bereal/dcimsaver/ModConfig;

    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$sbQuality:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    add-int/lit8 v1, v1, 0x32

    iput v1, v0, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    .line 235
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cfg:Lcom/bereal/dcimsaver/ModConfig;

    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cbBypassCap:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    iput-boolean v1, v0, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    .line 236
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cfg:Lcom/bereal/dcimsaver/ModConfig;

    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cbBts:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    iput-boolean v1, v0, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    .line 237
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cfg:Lcom/bereal/dcimsaver/ModConfig;

    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cbRealMojis:Landroid/widget/CheckBox;

    invoke-virtual {v1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    iput-boolean v1, v0, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    .line 238
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$cfg:Lcom/bereal/dcimsaver/ModConfig;

    iget-object v1, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$ctx:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/bereal/dcimsaver/ModConfig;->saveAndBroadcast(Landroid/content/Context;)V

    .line 239
    return-void
.end method
