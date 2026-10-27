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

    .line 398
    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$1(Landroid/widget/RadioGroup;I)I
    .locals 0

    .line 362
    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->getSelectedIndex(Landroid/widget/RadioGroup;I)I

    move-result p0

    return p0
.end method

.method private static addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .locals 2

    .line 325
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 326
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 327
    const p2, -0x333334

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 328
    const/high16 p2, 0x41500000    # 13.0f

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 329
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 330
    invoke-static {p0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p2

    const/4 v1, 0x4

    invoke-static {p0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2, v1, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 331
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 332
    return-void
.end method

.method private static addSectionHeader(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .locals 2

    .line 315
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 316
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 317
    const/4 p2, -0x1

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 318
    const/4 p2, 0x2

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, p2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 319
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 320
    const/16 p2, 0xa

    invoke-static {p0, p2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    const/4 p2, 0x0

    invoke-virtual {v0, p2, p2, p2, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 321
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 322
    return-void
.end method

.method private static addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V
    .locals 2

    .line 335
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 336
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 337
    nop

    .line 338
    invoke-static {p0, p2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    const/4 p2, -0x1

    invoke-direct {v1, p2, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 336
    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 340
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
    const/16 v2, 0x14

    invoke-static {v9, v2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v2

    .line 75
    invoke-virtual {v11, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 76
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    .line 77
    nop

    .line 78
    const/4 v12, -0x1

    const/4 v13, -0x2

    invoke-direct {v2, v12, v13}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 76
    invoke-virtual {v10, v11, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 82
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 83
    const-string v3, "BeReal. Quality & DCIM Mod"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    invoke-virtual {v2, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 85
    const/high16 v3, 0x41b00000    # 22.0f

    const/4 v4, 0x2

    invoke-virtual {v2, v4, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 86
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 87
    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 89
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 90
    if-eqz p1, :cond_0

    .line 91
    const-string v3, "Standalone Configuration \u2022 Long-press \'BeReal.\' logo in-app for quick settings"

    goto :goto_0

    .line 92
    :cond_0
    const-string v3, "In-App Settings \u2022 Changes apply immediately to your next capture"

    .line 90
    :goto_0
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    const v3, -0x555556

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 94
    const/high16 v3, 0x41400000    # 12.0f

    invoke-virtual {v2, v4, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 95
    const/4 v3, 0x4

    invoke-static {v9, v3}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v5

    const/16 v6, 0x10

    invoke-static {v9, v6}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v2, v7, v5, v7, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 96
    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 99
    invoke-static {v9}, Lcom/bereal/dcimsaver/SettingsUi;->createCard(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    .line 100
    invoke-static {v9}, Lcom/bereal/dcimsaver/SettingsUi;->createCardParams(Landroid/content/Context;)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v5

    invoke-virtual {v11, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    const-string v5, "1. Local DCIM Export (DCIM/BeReal)"

    invoke-static {v9, v2, v5}, Lcom/bereal/dcimsaver/SettingsUi;->addSectionHeader(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 104
    const-string v5, "Photos to Save Locally:"

    invoke-static {v9, v2, v5}, Lcom/bereal/dcimsaver/SettingsUi;->addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 105
    nop

    .line 106
    nop

    .line 107
    nop

    .line 108
    const-string v5, "Both (Full-Res Sensor + Processed .webp)"

    const-string v6, "Processed / Uploaded (.webp) Only"

    const-string v8, "Full-Resolution Raw Sensor Dump Only"

    filled-new-array {v6, v8, v5}, [Ljava/lang/String;

    move-result-object v5

    .line 109
    iget v6, v1, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    .line 105
    invoke-static {v9, v5, v6}, Lcom/bereal/dcimsaver/SettingsUi;->createRadioGroup(Landroid/content/Context;[Ljava/lang/String;I)Landroid/widget/RadioGroup;

    move-result-object v5

    .line 110
    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 112
    const/16 v14, 0xa

    invoke-static {v9, v2, v14}, Lcom/bereal/dcimsaver/SettingsUi;->addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V

    .line 113
    const-string v6, "Full-Resolution Sensor Dump Format:"

    invoke-static {v9, v2, v6}, Lcom/bereal/dcimsaver/SettingsUi;->addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 114
    nop

    .line 115
    nop

    .line 116
    nop

    .line 117
    const-string v6, "PNG (Uncompressed Lossless)"

    const-string v8, "WebP (100% Quality / Lossless)"

    const-string v15, "JPEG (100% Quality)"

    filled-new-array {v8, v15, v6}, [Ljava/lang/String;

    move-result-object v6

    .line 118
    iget v8, v1, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    .line 114
    invoke-static {v9, v6, v8}, Lcom/bereal/dcimsaver/SettingsUi;->createRadioGroup(Landroid/content/Context;[Ljava/lang/String;I)Landroid/widget/RadioGroup;

    move-result-object v6

    .line 119
    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 121
    invoke-static {v9, v2, v14}, Lcom/bereal/dcimsaver/SettingsUi;->addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V

    .line 122
    const-string v8, "Extra Media Types:"

    invoke-static {v9, v2, v8}, Lcom/bereal/dcimsaver/SettingsUi;->addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 124
    nop

    .line 125
    nop

    .line 126
    iget-boolean v8, v1, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    .line 123
    const-string v15, "Save Behind-the-Scenes (BTS) Raw Videos (.mp4)"

    invoke-static {v9, v15, v8}, Lcom/bereal/dcimsaver/SettingsUi;->createCheckBox(Landroid/content/Context;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v8

    .line 128
    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 131
    nop

    .line 132
    nop

    .line 133
    iget-boolean v15, v1, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    .line 130
    const-string v12, "Save RealMoji Captures (.webp)"

    invoke-static {v9, v12, v15}, Lcom/bereal/dcimsaver/SettingsUi;->createCheckBox(Landroid/content/Context;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v12

    .line 135
    invoke-virtual {v2, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 138
    invoke-static {v9}, Lcom/bereal/dcimsaver/SettingsUi;->createCard(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    .line 139
    invoke-static {v9}, Lcom/bereal/dcimsaver/SettingsUi;->createCardParams(Landroid/content/Context;)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v15

    invoke-virtual {v11, v2, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 141
    const-string v15, "2. Uploaded BeReal Post Quality Boost"

    invoke-static {v9, v2, v15}, Lcom/bereal/dcimsaver/SettingsUi;->addSectionHeader(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 144
    new-instance v15, Landroid/widget/LinearLayout;

    invoke-direct {v15, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 145
    invoke-virtual {v15, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 146
    const/16 v13, 0xc

    invoke-static {v9, v13}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v7

    .line 147
    invoke-virtual {v15, v7, v7, v7, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 148
    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 149
    const v13, -0xd4e3ec

    invoke-virtual {v7, v13}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 150
    invoke-static {v9, v14}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v13

    int-to-float v13, v13

    invoke-virtual {v7, v13}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 151
    invoke-static {v9, v0}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v0

    const/16 v13, -0x6800

    invoke-virtual {v7, v0, v13}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 152
    invoke-virtual {v15, v7}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 154
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 155
    const-string v7, "\u26a0\ufe0f Server-Side 700 KB Upload Limit"

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    const/16 v7, -0x48b3

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 157
    const/high16 v7, 0x41500000    # 13.0f

    invoke-virtual {v0, v4, v7}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 158
    sget-object v7, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 159
    invoke-virtual {v15, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 161
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 162
    const-string v7, "BeReal\'s servers strictly reject uploaded .webp files larger than 700 KB. For reliable uploads, keep \'1080 \u00d7 1440\' selected and leave \'Bypass 700 KB Cap\' UNCHECKED so BeReal starts at your chosen WebP quality and automatically steps down if needed to fit under 700 KB. (Your local Full-Res DCIM/BeReal photos are completely unaffected by this limit.)"

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    const/16 v7, -0x1f4e

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 167
    const/high16 v7, 0x41380000    # 11.5f

    invoke-virtual {v0, v4, v7}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 168
    invoke-static {v9, v3}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v7

    const/4 v13, 0x0

    invoke-virtual {v0, v13, v7, v13, v13}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 169
    invoke-virtual {v15, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 171
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 172
    nop

    .line 173
    nop

    .line 171
    const/4 v7, -0x1

    const/4 v13, -0x2

    invoke-direct {v0, v7, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 175
    const/16 v7, 0xc

    invoke-static {v9, v7}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v13

    iput v13, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 176
    invoke-virtual {v2, v15, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 178
    const-string v0, "Target Upload Resolution (3:4 Aspect):"

    invoke-static {v9, v2, v0}, Lcom/bereal/dcimsaver/SettingsUi;->addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 179
    nop

    .line 180
    nop

    .line 181
    nop

    .line 182
    nop

    .line 183
    const-string v0, "Full Sensor Resolution (Max 3:4 Crop \u2022 Exceeds 700 KB)"

    const-string v7, "1080 \u00d7 1440 (BeReal Default \u2022 Recommended for <700 KB)"

    const-string v13, "1440 \u00d7 1920 (2K QHD \u2022 May exceed 700 KB)"

    const-string v15, "2160 \u00d7 2880 (4K UHD \u2022 Exceeds 700 KB)"

    filled-new-array {v7, v13, v15, v0}, [Ljava/lang/String;

    move-result-object v0

    .line 184
    iget v7, v1, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    .line 179
    invoke-static {v9, v0, v7}, Lcom/bereal/dcimsaver/SettingsUi;->createRadioGroup(Landroid/content/Context;[Ljava/lang/String;I)Landroid/widget/RadioGroup;

    move-result-object v0

    .line 185
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 187
    const/16 v7, 0xc

    invoke-static {v9, v2, v7}, Lcom/bereal/dcimsaver/SettingsUi;->addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V

    .line 188
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 189
    const v13, -0x111112

    invoke-virtual {v7, v13}, Landroid/widget/TextView;->setTextColor(I)V

    .line 190
    const/high16 v13, 0x41600000    # 14.0f

    invoke-virtual {v7, v4, v13}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 191
    sget-object v13, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v7, v13}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 192
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v15, "Initial Upload WebP Quality: "

    invoke-direct {v13, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v15, v1, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v15, "%"

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v7, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 193
    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 195
    move-object v13, v5

    new-instance v5, Landroid/widget/SeekBar;

    invoke-direct {v5, v9}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 196
    const/16 v15, 0x32

    invoke-virtual {v5, v15}, Landroid/widget/SeekBar;->setMax(I)V

    .line 197
    iget v14, v1, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    sub-int/2addr v14, v15

    invoke-static {v15, v14}, Ljava/lang/Math;->min(II)I

    move-result v14

    const/4 v15, 0x0

    invoke-static {v15, v14}, Ljava/lang/Math;->max(II)I

    move-result v14

    invoke-virtual {v5, v14}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 198
    invoke-static {v9, v3}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v14

    const/16 v15, 0x8

    invoke-static {v9, v15}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v4

    move-object/from16 v16, v0

    invoke-static {v9, v3}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-static {v9, v15}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v5, v14, v4, v0, v3}, Landroid/widget/SeekBar;->setPadding(IIII)V

    .line 199
    new-instance v0, Lcom/bereal/dcimsaver/SettingsUi$2;

    invoke-direct {v0, v7}, Lcom/bereal/dcimsaver/SettingsUi$2;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {v5, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 210
    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 212
    const/4 v0, 0x6

    invoke-static {v9, v2, v0}, Lcom/bereal/dcimsaver/SettingsUi;->addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V

    .line 214
    nop

    .line 215
    nop

    .line 216
    iget-boolean v0, v1, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    .line 213
    const-string v3, "Bypass 700 KB Client Size Cap (\u26a0\ufe0f Server rejects >700 KB)"

    invoke-static {v9, v3, v0}, Lcom/bereal/dcimsaver/SettingsUi;->createCheckBox(Landroid/content/Context;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v0

    .line 218
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 220
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 221
    const-string v4, "\u26a0\ufe0f Warning: Enabling this disables client-side 700 KB auto-reduction, which will cause BeReal\'s server to reject uploads larger than 700 KB."

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 222
    const/16 v4, -0x7580

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 223
    const/high16 v4, 0x41300000    # 11.0f

    const/4 v7, 0x2

    invoke-virtual {v3, v7, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 224
    invoke-static {v9, v15}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {v9, v7}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v7

    const/4 v14, 0x4

    invoke-static {v9, v14}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v14

    const/4 v15, 0x0

    invoke-virtual {v3, v4, v7, v15, v14}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 225
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 228
    move-object v3, v6

    move-object v6, v0

    new-instance v0, Lcom/bereal/dcimsaver/SettingsUi$3;

    move-object v7, v8

    move-object v8, v12

    move-object v2, v13

    move-object/from16 v4, v16

    invoke-direct/range {v0 .. v9}, Lcom/bereal/dcimsaver/SettingsUi$3;-><init>(Lcom/bereal/dcimsaver/ModConfig;Landroid/widget/RadioGroup;Landroid/widget/RadioGroup;Landroid/widget/RadioGroup;Landroid/widget/SeekBar;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/content/Context;)V

    .line 243
    const-string v2, "Save Settings"

    const/high16 v3, -0x1000000

    const/4 v7, -0x1

    invoke-static {v9, v2, v7, v3}, Lcom/bereal/dcimsaver/SettingsUi;->createButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v2

    .line 244
    new-instance v3, Lcom/bereal/dcimsaver/SettingsUi$4;

    move-object/from16 v4, p2

    invoke-direct {v3, v0, v9, v4}, Lcom/bereal/dcimsaver/SettingsUi$4;-><init>(Ljava/lang/Runnable;Landroid/content/Context;Ljava/lang/Runnable;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 254
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 255
    nop

    .line 256
    nop

    .line 254
    const/4 v13, -0x2

    invoke-direct {v3, v7, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 258
    const/16 v4, 0x8

    invoke-static {v9, v4}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 259
    invoke-virtual {v11, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 261
    if-eqz p1, :cond_1

    .line 262
    const-string v2, "Save & Open BeReal"

    const v3, -0xd9d9d5

    invoke-static {v9, v2, v3, v7}, Lcom/bereal/dcimsaver/SettingsUi;->createButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v2

    .line 263
    new-instance v3, Lcom/bereal/dcimsaver/SettingsUi$5;

    invoke-direct {v3, v0, v9, v1}, Lcom/bereal/dcimsaver/SettingsUi$5;-><init>(Ljava/lang/Runnable;Landroid/content/Context;Lcom/bereal/dcimsaver/ModConfig;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 281
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 282
    nop

    .line 283
    nop

    .line 281
    const/4 v13, -0x2

    invoke-direct {v0, v7, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 285
    const/16 v1, 0xa

    invoke-static {v9, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 286
    invoke-virtual {v11, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 289
    :cond_1
    return-object v10
.end method

.method private static createButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;
    .locals 1

    .line 382
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 383
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 384
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 385
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 386
    const/4 p1, 0x2

    const/high16 p3, 0x41700000    # 15.0f

    invoke-virtual {v0, p1, p3}, Landroid/widget/Button;->setTextSize(IF)V

    .line 387
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 388
    const/16 p1, 0x11

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setGravity(I)V

    .line 389
    const/16 p1, 0xc

    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p3

    .line 390
    invoke-virtual {v0, p3, p3, p3, p3}, Landroid/widget/Button;->setPadding(IIII)V

    .line 391
    new-instance p3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 392
    invoke-virtual {p3, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 393
    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {p3, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 394
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 395
    return-object v0
.end method

.method private static createCard(Landroid/content/Context;)Landroid/widget/LinearLayout;
    .locals 4

    .line 293
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 294
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 295
    const/16 v2, 0x10

    invoke-static {p0, v2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v2

    .line 296
    invoke-virtual {v0, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 297
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 298
    const v3, -0xe5e5e2

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 299
    const/16 v3, 0xe

    invoke-static {p0, v3}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 300
    invoke-static {p0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    const v1, -0xd3d3ce

    invoke-virtual {v2, p0, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 301
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 302
    return-object v0
.end method

.method private static createCardParams(Landroid/content/Context;)Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .line 306
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 307
    nop

    .line 308
    nop

    .line 306
    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 310
    const/16 v1, 0x10

    invoke-static {p0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    iput p0, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 311
    return-object v0
.end method

.method private static createCheckBox(Landroid/content/Context;Ljava/lang/String;Z)Landroid/widget/CheckBox;
    .locals 3

    .line 371
    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 372
    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 373
    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 374
    const p1, -0x111112

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 375
    const/4 p1, 0x2

    const/high16 p2, 0x41500000    # 13.0f

    invoke-virtual {v0, p1, p2}, Landroid/widget/CheckBox;->setTextSize(IF)V

    .line 376
    const/4 p1, -0x1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 377
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

    .line 378
    return-object v0
.end method

.method private static createRadioGroup(Landroid/content/Context;[Ljava/lang/String;I)Landroid/widget/RadioGroup;
    .locals 9

    .line 343
    new-instance v0, Landroid/widget/RadioGroup;

    invoke-direct {v0, p0}, Landroid/widget/RadioGroup;-><init>(Landroid/content/Context;)V

    .line 344
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->setOrientation(I)V

    .line 345
    const/4 v2, -0x1

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 346
    const/4 v3, 0x0

    :goto_0
    array-length v4, p1

    if-lt v3, v4, :cond_0

    .line 359
    return-object v0

    .line 347
    :cond_0
    new-instance v4, Landroid/widget/RadioButton;

    invoke-direct {v4, p0}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    .line 348
    add-int/lit16 v5, v3, 0x3e8

    invoke-virtual {v4, v5}, Landroid/widget/RadioButton;->setId(I)V

    .line 349
    aget-object v5, p1, v3

    invoke-virtual {v4, v5}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 350
    const v5, -0x111112

    invoke-virtual {v4, v5}, Landroid/widget/RadioButton;->setTextColor(I)V

    .line 351
    const/4 v5, 0x2

    const/high16 v6, 0x41500000    # 13.0f

    invoke-virtual {v4, v5, v6}, Landroid/widget/RadioButton;->setTextSize(IF)V

    .line 352
    invoke-virtual {v4, v2}, Landroid/widget/RadioButton;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 353
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

    .line 354
    invoke-virtual {v0, v4}, Landroid/widget/RadioGroup;->addView(Landroid/view/View;)V

    .line 355
    if-ne v3, p2, :cond_1

    .line 356
    invoke-virtual {v4, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 346
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private static dp(Landroid/content/Context;I)I
    .locals 0

    .line 399
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 400
    int-to-float p1, p1

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private static getSelectedIndex(Landroid/widget/RadioGroup;I)I
    .locals 1

    .line 363
    invoke-virtual {p0}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result p0

    .line 364
    const/16 v0, 0x3e8

    if-lt p0, v0, :cond_0

    .line 365
    sub-int/2addr p0, v0

    return p0

    .line 367
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
