.class public final Lcom/bereal/dcimsaver/SettingsUi;
.super Ljava/lang/Object;
.source "SettingsUi.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Landroid/content/Context;I)I
    .locals 0

    .line 363
    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$1(Landroid/widget/RadioGroup;I)I
    .locals 0

    .line 327
    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->getSelectedIndex(Landroid/widget/RadioGroup;I)I

    move-result p0

    return p0
.end method

.method private static addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .locals 2

    .line 290
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 291
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 292
    const p2, -0x333334

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 293
    const/high16 p2, 0x41500000    # 13.0f

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 294
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 295
    invoke-static {p0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p2

    const/4 v1, 0x4

    invoke-static {p0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2, v1, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 296
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 297
    return-void
.end method

.method private static addSectionHeader(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .locals 2

    .line 280
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 281
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 282
    const/4 p2, -0x1

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 283
    const/4 p2, 0x2

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, p2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 284
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 285
    const/16 p2, 0xa

    invoke-static {p0, p2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    const/4 p2, 0x0

    invoke-virtual {v0, p2, p2, p2, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 286
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 287
    return-void
.end method

.method private static addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V
    .locals 2

    .line 300
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 301
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 302
    nop

    .line 303
    invoke-static {p0, p2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    const/4 p2, -0x1

    invoke-direct {v1, p2, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 301
    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 305
    return-void
.end method

.method public static buildSettingsView(Landroid/content/Context;ZLjava/lang/Runnable;)Landroid/view/View;
    .locals 17

    .line 66
    move-object/from16 v9, p0

    invoke-static {v9}, Lcom/bereal/dcimsaver/ModConfig;->load(Landroid/content/Context;)Lcom/bereal/dcimsaver/ModConfig;

    move-result-object v1

    .line 68
    new-instance v10, Landroid/widget/ScrollView;

    invoke-direct {v10, v9}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 69
    const/4 v0, 0x1

    invoke-virtual {v10, v0}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 70
    const v2, -0xf1f1f0

    invoke-virtual {v10, v2}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    .line 72
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 73
    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 74
    const/16 v0, 0x14

    invoke-static {v9, v0}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v0

    .line 75
    invoke-virtual {v11, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 76
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 77
    nop

    .line 78
    const/4 v12, -0x1

    const/4 v13, -0x2

    invoke-direct {v0, v12, v13}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 76
    invoke-virtual {v10, v11, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 83
    const-string v2, "BeReal. Quality & DCIM Mod"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    invoke-virtual {v0, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 85
    const/high16 v2, 0x41b00000    # 22.0f

    const/4 v3, 0x2

    invoke-virtual {v0, v3, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 86
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 87
    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 89
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 90
    if-eqz p1, :cond_0

    .line 91
    const-string v2, "Standalone Configuration \u2022 Long-press \'BeReal.\' logo in-app for quick settings"

    goto :goto_0

    .line 92
    :cond_0
    const-string v2, "In-App Settings \u2022 Changes apply immediately to your next capture"

    .line 90
    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    const v2, -0x555556

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 94
    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual {v0, v3, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 95
    const/4 v2, 0x4

    invoke-static {v9, v2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v5, 0x10

    invoke-static {v9, v5}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {v0, v6, v4, v6, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 96
    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 99
    invoke-static {v9}, Lcom/bereal/dcimsaver/SettingsUi;->createCard(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 100
    invoke-static {v9}, Lcom/bereal/dcimsaver/SettingsUi;->createCardParams(Landroid/content/Context;)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v4

    invoke-virtual {v11, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    const-string v4, "1. Local DCIM Export (DCIM/BeReal)"

    invoke-static {v9, v0, v4}, Lcom/bereal/dcimsaver/SettingsUi;->addSectionHeader(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 104
    const-string v4, "Photos to Save Locally:"

    invoke-static {v9, v0, v4}, Lcom/bereal/dcimsaver/SettingsUi;->addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 105
    nop

    .line 106
    nop

    .line 107
    nop

    .line 108
    const-string v4, "Both (Full-Res Sensor + Processed .webp)"

    const-string v5, "Processed / Uploaded (.webp) Only"

    const-string v7, "Full-Resolution Raw Sensor Dump Only"

    filled-new-array {v5, v7, v4}, [Ljava/lang/String;

    move-result-object v4

    .line 109
    iget v5, v1, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    .line 105
    invoke-static {v9, v4, v5}, Lcom/bereal/dcimsaver/SettingsUi;->createRadioGroup(Landroid/content/Context;[Ljava/lang/String;I)Landroid/widget/RadioGroup;

    move-result-object v4

    .line 110
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 112
    const/16 v14, 0xa

    invoke-static {v9, v0, v14}, Lcom/bereal/dcimsaver/SettingsUi;->addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V

    .line 113
    const-string v5, "Full-Resolution Sensor Dump Format:"

    invoke-static {v9, v0, v5}, Lcom/bereal/dcimsaver/SettingsUi;->addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 114
    nop

    .line 115
    nop

    .line 116
    nop

    .line 117
    const-string v5, "PNG (Uncompressed Lossless)"

    const-string v7, "WebP (100% Quality / Lossless)"

    const-string v8, "JPEG (100% Quality)"

    filled-new-array {v7, v8, v5}, [Ljava/lang/String;

    move-result-object v5

    .line 118
    iget v7, v1, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    .line 114
    invoke-static {v9, v5, v7}, Lcom/bereal/dcimsaver/SettingsUi;->createRadioGroup(Landroid/content/Context;[Ljava/lang/String;I)Landroid/widget/RadioGroup;

    move-result-object v5

    .line 119
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 121
    invoke-static {v9, v0, v14}, Lcom/bereal/dcimsaver/SettingsUi;->addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V

    .line 122
    const-string v7, "Extra Media Types:"

    invoke-static {v9, v0, v7}, Lcom/bereal/dcimsaver/SettingsUi;->addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 124
    nop

    .line 125
    nop

    .line 126
    iget-boolean v7, v1, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    .line 123
    const-string v8, "Save Behind-the-Scenes (BTS) Raw Videos (.mp4)"

    invoke-static {v9, v8, v7}, Lcom/bereal/dcimsaver/SettingsUi;->createCheckBox(Landroid/content/Context;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v7

    .line 128
    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 131
    nop

    .line 132
    nop

    .line 133
    iget-boolean v8, v1, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    .line 130
    const-string v15, "Save RealMoji Captures (.webp)"

    invoke-static {v9, v15, v8}, Lcom/bereal/dcimsaver/SettingsUi;->createCheckBox(Landroid/content/Context;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v8

    .line 135
    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 138
    invoke-static {v9}, Lcom/bereal/dcimsaver/SettingsUi;->createCard(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 139
    invoke-static {v9}, Lcom/bereal/dcimsaver/SettingsUi;->createCardParams(Landroid/content/Context;)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v15

    invoke-virtual {v11, v0, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 141
    const-string v15, "2. Uploaded BeReal Post Quality Boost"

    invoke-static {v9, v0, v15}, Lcom/bereal/dcimsaver/SettingsUi;->addSectionHeader(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 143
    const-string v15, "Target Upload Resolution (3:4 Aspect):"

    invoke-static {v9, v0, v15}, Lcom/bereal/dcimsaver/SettingsUi;->addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 144
    nop

    .line 145
    nop

    .line 146
    nop

    .line 147
    nop

    .line 148
    const-string v15, "Full Sensor Resolution (Max 3:4 Crop)"

    const-string v14, "1080 \u00d7 1440 (BeReal Default)"

    const-string v13, "1440 \u00d7 1920 (2K QHD Boost)"

    const-string v12, "2160 \u00d7 2880 (4K UHD Boost)"

    filled-new-array {v14, v13, v12, v15}, [Ljava/lang/String;

    move-result-object v12

    .line 149
    iget v13, v1, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    .line 144
    invoke-static {v9, v12, v13}, Lcom/bereal/dcimsaver/SettingsUi;->createRadioGroup(Landroid/content/Context;[Ljava/lang/String;I)Landroid/widget/RadioGroup;

    move-result-object v12

    .line 150
    invoke-virtual {v0, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 152
    const/16 v13, 0xc

    invoke-static {v9, v0, v13}, Lcom/bereal/dcimsaver/SettingsUi;->addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V

    .line 153
    new-instance v13, Landroid/widget/TextView;

    invoke-direct {v13, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 154
    const v14, -0x111112

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 155
    const/high16 v14, 0x41600000    # 14.0f

    invoke-virtual {v13, v3, v14}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 156
    sget-object v14, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 157
    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "Upload WebP Compression Quality: "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v15, v1, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "%"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    invoke-virtual {v0, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 160
    move-object v14, v5

    new-instance v5, Landroid/widget/SeekBar;

    invoke-direct {v5, v9}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 161
    const/16 v15, 0x32

    invoke-virtual {v5, v15}, Landroid/widget/SeekBar;->setMax(I)V

    .line 162
    iget v3, v1, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    sub-int/2addr v3, v15

    invoke-static {v15, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 163
    invoke-static {v9, v2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const/16 v15, 0x8

    invoke-static {v9, v15}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v6

    move-object/from16 v16, v4

    invoke-static {v9, v2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {v9, v15}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v5, v3, v6, v4, v2}, Landroid/widget/SeekBar;->setPadding(IIII)V

    .line 164
    new-instance v2, Lcom/bereal/dcimsaver/SettingsUi$2;

    invoke-direct {v2, v13}, Lcom/bereal/dcimsaver/SettingsUi$2;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {v5, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 175
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 177
    const/4 v2, 0x6

    invoke-static {v9, v0, v2}, Lcom/bereal/dcimsaver/SettingsUi;->addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V

    .line 179
    nop

    .line 180
    nop

    .line 181
    iget-boolean v2, v1, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    .line 178
    const-string v3, "Bypass 700 KB Upload File Size Cap (Unlimited)"

    invoke-static {v9, v3, v2}, Lcom/bereal/dcimsaver/SettingsUi;->createCheckBox(Landroid/content/Context;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v6

    .line 183
    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 185
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 186
    const-string v3, "Required for 2K/4K/Full-Res uploads so BeReal does not recompress down to 50% quality or fail above 700 KB."

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    const v3, -0x777778

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 188
    const/high16 v3, 0x41300000    # 11.0f

    const/4 v4, 0x2

    invoke-virtual {v2, v4, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 189
    invoke-static {v9, v15}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {v9, v4}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/4 v13, 0x4

    invoke-static {v9, v13}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v13

    const/4 v15, 0x0

    invoke-virtual {v2, v3, v4, v15, v13}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 190
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 193
    new-instance v0, Lcom/bereal/dcimsaver/SettingsUi$3;

    move-object v4, v12

    move-object v3, v14

    move-object/from16 v2, v16

    invoke-direct/range {v0 .. v9}, Lcom/bereal/dcimsaver/SettingsUi$3;-><init>(Lcom/bereal/dcimsaver/ModConfig;Landroid/widget/RadioGroup;Landroid/widget/RadioGroup;Landroid/widget/RadioGroup;Landroid/widget/SeekBar;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/content/Context;)V

    .line 208
    const-string v2, "Save Settings"

    const/high16 v3, -0x1000000

    const/4 v4, -0x1

    invoke-static {v9, v2, v4, v3}, Lcom/bereal/dcimsaver/SettingsUi;->createButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v2

    .line 209
    new-instance v3, Lcom/bereal/dcimsaver/SettingsUi$4;

    move-object/from16 v5, p2

    invoke-direct {v3, v0, v9, v5}, Lcom/bereal/dcimsaver/SettingsUi$4;-><init>(Ljava/lang/Runnable;Landroid/content/Context;Ljava/lang/Runnable;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 219
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 220
    nop

    .line 221
    nop

    .line 219
    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 223
    const/16 v5, 0x8

    invoke-static {v9, v5}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v5

    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 224
    invoke-virtual {v11, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 226
    if-eqz p1, :cond_1

    .line 227
    const-string v2, "Save & Open BeReal"

    const v3, -0xd9d9d5

    invoke-static {v9, v2, v3, v4}, Lcom/bereal/dcimsaver/SettingsUi;->createButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v2

    .line 228
    new-instance v3, Lcom/bereal/dcimsaver/SettingsUi$5;

    invoke-direct {v3, v0, v9, v1}, Lcom/bereal/dcimsaver/SettingsUi$5;-><init>(Ljava/lang/Runnable;Landroid/content/Context;Lcom/bereal/dcimsaver/ModConfig;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 246
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 247
    nop

    .line 248
    nop

    .line 246
    const/4 v5, -0x2

    invoke-direct {v0, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 250
    const/16 v1, 0xa

    invoke-static {v9, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 251
    invoke-virtual {v11, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 254
    :cond_1
    return-object v10
.end method

.method private static createButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;
    .locals 1

    .line 347
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 348
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 349
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 350
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 351
    const/4 p1, 0x2

    const/high16 p3, 0x41700000    # 15.0f

    invoke-virtual {v0, p1, p3}, Landroid/widget/Button;->setTextSize(IF)V

    .line 352
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 353
    const/16 p1, 0x11

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setGravity(I)V

    .line 354
    const/16 p1, 0xc

    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p3

    .line 355
    invoke-virtual {v0, p3, p3, p3, p3}, Landroid/widget/Button;->setPadding(IIII)V

    .line 356
    new-instance p3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 357
    invoke-virtual {p3, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 358
    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {p3, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 359
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 360
    return-object v0
.end method

.method private static createCard(Landroid/content/Context;)Landroid/widget/LinearLayout;
    .locals 4

    .line 258
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 259
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 260
    const/16 v2, 0x10

    invoke-static {p0, v2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v2

    .line 261
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 262
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 263
    const v3, -0xe5e5e2

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 264
    const/16 v3, 0xe

    invoke-static {p0, v3}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 265
    invoke-static {p0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    const v1, -0xd3d3ce

    invoke-virtual {v2, p0, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 266
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 267
    return-object v0
.end method

.method private static createCardParams(Landroid/content/Context;)Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .line 271
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 272
    nop

    .line 273
    nop

    .line 271
    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 275
    const/16 v1, 0x10

    invoke-static {p0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    iput p0, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 276
    return-object v0
.end method

.method private static createCheckBox(Landroid/content/Context;Ljava/lang/String;Z)Landroid/widget/CheckBox;
    .locals 3

    .line 336
    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 337
    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 338
    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 339
    const p1, -0x111112

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 340
    const/4 p1, 0x2

    const/high16 p2, 0x41500000    # 13.0f

    invoke-virtual {v0, p1, p2}, Landroid/widget/CheckBox;->setTextSize(IF)V

    .line 341
    const/4 p1, -0x1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 342
    const/4 p1, 0x6

    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p2

    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {v0, p2, v1, v2, p0}, Landroid/widget/CheckBox;->setPadding(IIII)V

    .line 343
    return-object v0
.end method

.method private static createRadioGroup(Landroid/content/Context;[Ljava/lang/String;I)Landroid/widget/RadioGroup;
    .locals 9

    .line 308
    new-instance v0, Landroid/widget/RadioGroup;

    invoke-direct {v0, p0}, Landroid/widget/RadioGroup;-><init>(Landroid/content/Context;)V

    .line 309
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->setOrientation(I)V

    .line 310
    const/4 v2, -0x1

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 311
    const/4 v3, 0x0

    :goto_0
    array-length v4, p1

    if-lt v3, v4, :cond_0

    .line 324
    return-object v0

    .line 312
    :cond_0
    new-instance v4, Landroid/widget/RadioButton;

    invoke-direct {v4, p0}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    .line 313
    add-int/lit16 v5, v3, 0x3e8

    invoke-virtual {v4, v5}, Landroid/widget/RadioButton;->setId(I)V

    .line 314
    aget-object v5, p1, v3

    invoke-virtual {v4, v5}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 315
    const v5, -0x111112

    invoke-virtual {v4, v5}, Landroid/widget/RadioButton;->setTextColor(I)V

    .line 316
    const/4 v5, 0x2

    const/high16 v6, 0x41500000    # 13.0f

    invoke-virtual {v4, v5, v6}, Landroid/widget/RadioButton;->setTextSize(IF)V

    .line 317
    invoke-virtual {v4, v2}, Landroid/widget/RadioButton;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 318
    const/4 v5, 0x6

    invoke-static {p0, v5}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {p0, v5}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-static {p0, v5}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-static {p0, v5}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v4, v6, v7, v8, v5}, Landroid/widget/RadioButton;->setPadding(IIII)V

    .line 319
    invoke-virtual {v0, v4}, Landroid/widget/RadioGroup;->addView(Landroid/view/View;)V

    .line 320
    if-ne v3, p2, :cond_1

    .line 321
    invoke-virtual {v4, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 311
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private static dp(Landroid/content/Context;I)I
    .locals 0

    .line 364
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 365
    int-to-float p1, p1

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private static getSelectedIndex(Landroid/widget/RadioGroup;I)I
    .locals 1

    .line 328
    invoke-virtual {p0}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result p0

    .line 329
    const/16 v0, 0x3e8

    if-lt p0, v0, :cond_0

    .line 330
    sub-int/2addr p0, v0

    return p0

    .line 332
    :cond_0
    return p1
.end method

.method public static showInAppDialog(Landroid/app/Activity;)V
    .locals 1

    .line 28
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 31
    :cond_0
    new-instance v0, Lcom/bereal/dcimsaver/SettingsUi$1;

    invoke-direct {v0, p0}, Lcom/bereal/dcimsaver/SettingsUi$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 59
    return-void

    .line 29
    :cond_1
    :goto_0
    return-void
.end method
