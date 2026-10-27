.class public final Lcom/bereal/dcimsaver/SettingsUi;
.super Ljava/lang/Object;
.source "SettingsUi.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Landroid/content/Context;I)I
    .locals 0

    .line 785
    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$1(Landroid/app/Activity;Landroid/app/AlertDialog;)Landroid/view/View;
    .locals 0

    .line 95
    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->buildFeedDownloaderView(Landroid/app/Activity;Landroid/app/AlertDialog;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2(Landroid/content/Context;)Landroid/widget/LinearLayout;
    .locals 0

    .line 659
    invoke-static {p0}, Lcom/bereal/dcimsaver/SettingsUi;->createCard(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;
    .locals 0

    .line 765
    invoke-static {p0, p1, p2, p3}, Lcom/bereal/dcimsaver/SettingsUi;->createSmallButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4(Landroid/widget/RadioGroup;I)I
    .locals 0

    .line 729
    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->getSelectedIndex(Landroid/widget/RadioGroup;I)I

    move-result p0

    return p0
.end method

.method private static addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .locals 2

    .line 692
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 693
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 694
    const p2, -0x333334

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 695
    const/high16 p2, 0x41500000    # 13.0f

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 696
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 697
    invoke-static {p0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p2

    const/4 v1, 0x4

    invoke-static {p0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2, v1, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 698
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 699
    return-void
.end method

.method private static addSectionHeader(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .locals 2

    .line 682
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 683
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 684
    const/4 p2, -0x1

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 685
    const/4 p2, 0x2

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v0, p2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 686
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 687
    const/16 p2, 0x8

    invoke-static {p0, p2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    const/4 p2, 0x0

    invoke-virtual {v0, p2, p2, p2, p0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 688
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 689
    return-void
.end method

.method private static addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V
    .locals 2

    .line 702
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 703
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 704
    nop

    .line 705
    invoke-static {p0, p2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    const/4 p2, -0x1

    invoke-direct {v1, p2, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 703
    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 707
    return-void
.end method

.method private static buildFeedDownloaderView(Landroid/app/Activity;Landroid/app/AlertDialog;)Landroid/view/View;
    .locals 16

    .line 96
    move-object/from16 v5, p0

    move-object/from16 v6, p1

    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 97
    const/4 v0, 0x1

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 98
    const v1, -0xf1f1f0

    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 99
    const/16 v1, 0x10

    invoke-static {v5, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v1

    .line 100
    invoke-virtual {v7, v1, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 102
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v5}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 103
    const-string v2, "\ud83d\udce5 Download Users\' BeReals"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    const/4 v8, -0x1

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 105
    const/high16 v2, 0x41a00000    # 20.0f

    const/4 v3, 0x2

    invoke-virtual {v1, v3, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 106
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 107
    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 109
    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, v5}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 110
    const-string v1, "Loading posts from BeReal feed database..."

    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    const v1, -0x555556

    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 112
    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v9, v3, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 113
    const/4 v1, 0x4

    invoke-static {v5, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v1

    const/16 v10, 0xa

    invoke-static {v5, v10}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v11, 0x0

    invoke-virtual {v9, v11, v1, v11, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 114
    invoke-virtual {v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 117
    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, v5}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 118
    const-string v2, "Filter by @username, name, or caption..."

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 119
    const v2, -0x888889

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 120
    invoke-virtual {v1, v8}, Landroid/widget/EditText;->setTextColor(I)V

    .line 121
    const/high16 v2, 0x41500000    # 13.0f

    invoke-virtual {v1, v3, v2}, Landroid/widget/EditText;->setTextSize(IF)V

    .line 122
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 123
    invoke-static {v5, v10}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v2

    .line 124
    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 125
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 126
    const v3, -0xe5e5e2

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 127
    invoke-static {v5, v10}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 128
    invoke-static {v5, v0}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const v12, -0xccccc6

    invoke-virtual {v2, v3, v12}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 129
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 130
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 131
    nop

    .line 132
    const/4 v13, -0x2

    invoke-direct {v2, v8, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 130
    invoke-virtual {v7, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 136
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 137
    invoke-virtual {v2, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 138
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 139
    nop

    .line 140
    nop

    .line 138
    invoke-direct {v3, v8, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 142
    invoke-static {v5, v10}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 143
    invoke-static {v5, v10}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 144
    invoke-virtual {v7, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    const-string v3, "\u21bb Refresh List"

    const v14, -0xd9d9d5

    invoke-static {v5, v3, v14, v8}, Lcom/bereal/dcimsaver/SettingsUi;->createSmallButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v15

    .line 147
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v3, v11, v13, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 148
    const/4 v12, 0x6

    invoke-static {v5, v12}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v12

    iput v12, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 149
    invoke-virtual {v2, v15, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 151
    const-string v3, "\u2b07 Download All Shown"

    const/high16 v12, -0x1000000

    invoke-static {v5, v3, v8, v12}, Lcom/bereal/dcimsaver/SettingsUi;->createSmallButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v12

    .line 152
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const v14, 0x3fa66666    # 1.3f

    invoke-direct {v3, v11, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 153
    invoke-virtual {v2, v12, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 156
    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, v5}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 157
    invoke-virtual {v2, v0}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 158
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 159
    nop

    .line 160
    const/16 v14, 0x172

    invoke-static {v5, v14}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v14

    .line 161
    nop

    .line 158
    invoke-direct {v3, v8, v14, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 163
    invoke-virtual {v7, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 165
    move-object v3, v1

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 166
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 167
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 168
    nop

    .line 169
    invoke-direct {v0, v8, v13}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 167
    invoke-virtual {v2, v1, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 172
    move v0, v4

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 173
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 175
    move v14, v0

    new-instance v0, Lcom/bereal/dcimsaver/SettingsUi$3;

    invoke-direct/range {v0 .. v5}, Lcom/bereal/dcimsaver/SettingsUi$3;-><init>(Landroid/widget/LinearLayout;Ljava/util/List;Landroid/widget/EditText;Ljava/util/List;Landroid/app/Activity;)V

    .line 293
    new-instance v1, Lcom/bereal/dcimsaver/SettingsUi$4;

    invoke-direct {v1, v9, v4, v0}, Lcom/bereal/dcimsaver/SettingsUi$4;-><init>(Landroid/widget/TextView;Ljava/util/List;Ljava/lang/Runnable;)V

    .line 316
    new-instance v4, Lcom/bereal/dcimsaver/SettingsUi$5;

    invoke-direct {v4, v1}, Lcom/bereal/dcimsaver/SettingsUi$5;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v15, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 323
    new-instance v4, Lcom/bereal/dcimsaver/SettingsUi$6;

    invoke-direct {v4, v5, v2}, Lcom/bereal/dcimsaver/SettingsUi$6;-><init>(Landroid/app/Activity;Ljava/util/List;)V

    invoke-virtual {v12, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 330
    new-instance v2, Lcom/bereal/dcimsaver/SettingsUi$7;

    invoke-direct {v2, v0}, Lcom/bereal/dcimsaver/SettingsUi$7;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 342
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 343
    invoke-virtual {v0, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 344
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 345
    nop

    .line 346
    nop

    .line 344
    invoke-direct {v2, v8, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 348
    invoke-static {v5, v10}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 349
    invoke-virtual {v7, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 351
    const-string v2, "\u2699 Mod Settings"

    const v3, -0xd9d9d5

    invoke-static {v5, v2, v3, v8}, Lcom/bereal/dcimsaver/SettingsUi;->createSmallButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v2

    .line 352
    new-instance v3, Lcom/bereal/dcimsaver/SettingsUi$8;

    invoke-direct {v3, v6, v5}, Lcom/bereal/dcimsaver/SettingsUi$8;-><init>(Landroid/app/AlertDialog;Landroid/app/Activity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 361
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v11, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 362
    const/16 v4, 0x8

    invoke-static {v5, v4}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 363
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 365
    const-string v2, "Close"

    const v3, -0xccccc6

    invoke-static {v5, v2, v3, v8}, Lcom/bereal/dcimsaver/SettingsUi;->createSmallButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v2

    .line 366
    new-instance v3, Lcom/bereal/dcimsaver/SettingsUi$9;

    invoke-direct {v3, v6}, Lcom/bereal/dcimsaver/SettingsUi$9;-><init>(Landroid/app/AlertDialog;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 374
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v11, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 375
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 377
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 378
    return-object v7
.end method

.method public static buildSettingsView(Landroid/content/Context;ZLjava/lang/Runnable;)Landroid/view/View;
    .locals 18

    .line 386
    move-object/from16 v9, p0

    move/from16 v10, p1

    move-object/from16 v11, p2

    invoke-static {v9}, Lcom/bereal/dcimsaver/ModConfig;->load(Landroid/content/Context;)Lcom/bereal/dcimsaver/ModConfig;

    move-result-object v1

    .line 388
    new-instance v12, Landroid/widget/ScrollView;

    invoke-direct {v12, v9}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 389
    const/4 v0, 0x1

    invoke-virtual {v12, v0}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 390
    const v2, -0xf1f1f0

    invoke-virtual {v12, v2}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    .line 392
    new-instance v13, Landroid/widget/LinearLayout;

    invoke-direct {v13, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 393
    invoke-virtual {v13, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 394
    const/16 v2, 0x14

    invoke-static {v9, v2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v2

    .line 395
    invoke-virtual {v13, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 396
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    .line 397
    nop

    .line 398
    const/4 v14, -0x1

    const/4 v15, -0x2

    invoke-direct {v2, v14, v15}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 396
    invoke-virtual {v12, v13, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 402
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 403
    const-string v3, "BeReal. Quality & DCIM Mod"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 404
    invoke-virtual {v2, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 405
    const/high16 v3, 0x41b00000    # 22.0f

    const/4 v4, 0x2

    invoke-virtual {v2, v4, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 406
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 407
    invoke-virtual {v13, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 409
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 410
    if-eqz v10, :cond_0

    .line 411
    const-string v3, "Standalone Configuration \u2022 Long-press \'BeReal.\' logo in-app for quick settings"

    goto :goto_0

    .line 412
    :cond_0
    const-string v3, "In-App Settings \u2022 Changes apply immediately to your next capture"

    .line 410
    :goto_0
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 413
    const v3, -0x555556

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 414
    const/high16 v3, 0x41400000    # 12.0f

    invoke-virtual {v2, v4, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 415
    const/4 v5, 0x4

    invoke-static {v9, v5}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v6

    const/16 v7, 0xe

    invoke-static {v9, v7}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v7

    const/4 v8, 0x0

    invoke-virtual {v2, v8, v6, v8, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 416
    invoke-virtual {v13, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 419
    invoke-static {v9}, Lcom/bereal/dcimsaver/SettingsUi;->createCard(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    .line 420
    invoke-static {v9}, Lcom/bereal/dcimsaver/SettingsUi;->createCardParams(Landroid/content/Context;)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    invoke-virtual {v13, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 421
    const-string v6, "Download Other Users\' BeReals"

    invoke-static {v9, v2, v6}, Lcom/bereal/dcimsaver/SettingsUi;->addSectionHeader(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 423
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 424
    const-string v7, "Browse active feed posts & memories by @username and download any user\'s Primary, Secondary, or BTS video directly to DCIM/BeReal."

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 425
    const v7, -0x333334

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 426
    invoke-virtual {v6, v4, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 427
    const/16 v3, 0xa

    invoke-static {v9, v3}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v6, v8, v8, v8, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 428
    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 431
    nop

    .line 432
    if-eqz v10, :cond_1

    .line 433
    const-string v6, "\ud83d\udce5 Open Feed Post Downloader in BeReal"

    goto :goto_1

    .line 434
    :cond_1
    const-string v6, "\ud83d\udce5 Browse & Download Users\' Posts (Primary / Secondary)"

    .line 435
    :goto_1
    nop

    .line 436
    nop

    .line 430
    const/high16 v7, -0x1000000

    invoke-static {v9, v6, v14, v7}, Lcom/bereal/dcimsaver/SettingsUi;->createButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v6

    .line 438
    new-instance v7, Lcom/bereal/dcimsaver/SettingsUi$10;

    invoke-direct {v7, v10, v9, v11, v1}, Lcom/bereal/dcimsaver/SettingsUi$10;-><init>(ZLandroid/content/Context;Ljava/lang/Runnable;Lcom/bereal/dcimsaver/ModConfig;)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 463
    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 466
    invoke-static {v9}, Lcom/bereal/dcimsaver/SettingsUi;->createCard(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    .line 467
    invoke-static {v9}, Lcom/bereal/dcimsaver/SettingsUi;->createCardParams(Landroid/content/Context;)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    invoke-virtual {v13, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 469
    const-string v6, "1. Your Camera Captures (DCIM/BeReal)"

    invoke-static {v9, v2, v6}, Lcom/bereal/dcimsaver/SettingsUi;->addSectionHeader(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 471
    const-string v6, "Photos to Save Locally:"

    invoke-static {v9, v2, v6}, Lcom/bereal/dcimsaver/SettingsUi;->addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 472
    nop

    .line 473
    nop

    .line 474
    nop

    .line 475
    const-string v6, "Both (Full-Res Sensor + Processed .webp)"

    const-string v7, "Processed / Uploaded (.webp) Only"

    const-string v14, "Full-Resolution Raw Sensor Dump Only"

    filled-new-array {v7, v14, v6}, [Ljava/lang/String;

    move-result-object v6

    .line 476
    iget v7, v1, Lcom/bereal/dcimsaver/ModConfig;->saveMode:I

    .line 472
    invoke-static {v9, v6, v7}, Lcom/bereal/dcimsaver/SettingsUi;->createRadioGroup(Landroid/content/Context;[Ljava/lang/String;I)Landroid/widget/RadioGroup;

    move-result-object v6

    .line 477
    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 479
    invoke-static {v9, v2, v3}, Lcom/bereal/dcimsaver/SettingsUi;->addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V

    .line 480
    const-string v7, "Full-Resolution Sensor Dump Format:"

    invoke-static {v9, v2, v7}, Lcom/bereal/dcimsaver/SettingsUi;->addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 481
    nop

    .line 482
    nop

    .line 483
    nop

    .line 484
    const-string v7, "PNG (Uncompressed Lossless)"

    const-string v14, "WebP (100% Quality / Lossless)"

    const-string v15, "JPEG (100% Quality)"

    filled-new-array {v14, v15, v7}, [Ljava/lang/String;

    move-result-object v7

    .line 485
    iget v14, v1, Lcom/bereal/dcimsaver/ModConfig;->fullResFormat:I

    .line 481
    invoke-static {v9, v7, v14}, Lcom/bereal/dcimsaver/SettingsUi;->createRadioGroup(Landroid/content/Context;[Ljava/lang/String;I)Landroid/widget/RadioGroup;

    move-result-object v7

    .line 486
    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 488
    invoke-static {v9, v2, v3}, Lcom/bereal/dcimsaver/SettingsUi;->addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V

    .line 489
    const-string v14, "Extra Media Types:"

    invoke-static {v9, v2, v14}, Lcom/bereal/dcimsaver/SettingsUi;->addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 491
    nop

    .line 492
    nop

    .line 493
    iget-boolean v14, v1, Lcom/bereal/dcimsaver/ModConfig;->saveBtsVideos:Z

    .line 490
    const-string v15, "Save Behind-the-Scenes (BTS) Raw Videos (.mp4)"

    invoke-static {v9, v15, v14}, Lcom/bereal/dcimsaver/SettingsUi;->createCheckBox(Landroid/content/Context;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v14

    .line 495
    invoke-virtual {v2, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 498
    nop

    .line 499
    nop

    .line 500
    iget-boolean v15, v1, Lcom/bereal/dcimsaver/ModConfig;->saveRealMojis:Z

    .line 497
    const-string v8, "Save RealMoji Captures (.webp)"

    invoke-static {v9, v8, v15}, Lcom/bereal/dcimsaver/SettingsUi;->createCheckBox(Landroid/content/Context;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v8

    .line 502
    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 505
    invoke-static {v9}, Lcom/bereal/dcimsaver/SettingsUi;->createCard(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    .line 506
    invoke-static {v9}, Lcom/bereal/dcimsaver/SettingsUi;->createCardParams(Landroid/content/Context;)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v15

    invoke-virtual {v13, v2, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 508
    const-string v15, "2. Uploaded BeReal Post Quality Boost"

    invoke-static {v9, v2, v15}, Lcom/bereal/dcimsaver/SettingsUi;->addSectionHeader(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 511
    new-instance v15, Landroid/widget/LinearLayout;

    invoke-direct {v15, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 512
    invoke-virtual {v15, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 513
    const/16 v5, 0xc

    invoke-static {v9, v5}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v4

    .line 514
    invoke-virtual {v15, v4, v4, v4, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 515
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 516
    const v5, -0xd4e3ec

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 517
    invoke-static {v9, v3}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 518
    invoke-static {v9, v0}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v0

    const/16 v5, -0x6800

    invoke-virtual {v4, v0, v5}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 519
    invoke-virtual {v15, v4}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 521
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 522
    const-string v4, "\u26a0\ufe0f Server-Side 700 KB Upload Limit"

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 523
    const/16 v4, -0x48b3

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 524
    const/high16 v4, 0x41500000    # 13.0f

    const/4 v5, 0x2

    invoke-virtual {v0, v5, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 525
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 526
    invoke-virtual {v15, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 528
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 529
    const-string v4, "BeReal\'s servers strictly reject uploaded .webp files larger than 700 KB. For reliable uploads, keep \'1080 \u00d7 1440\' selected and leave \'Bypass 700 KB Cap\' UNCHECKED so BeReal starts at your chosen WebP quality and automatically steps down if needed to fit under 700 KB. (Your local Full-Res DCIM/BeReal photos are completely unaffected by this limit.)"

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 533
    const/16 v4, -0x1f4e

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 534
    const/high16 v4, 0x41380000    # 11.5f

    const/4 v5, 0x2

    invoke-virtual {v0, v5, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 535
    const/4 v4, 0x4

    invoke-static {v9, v4}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v5

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v5, v4, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 536
    invoke-virtual {v15, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 538
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 539
    nop

    .line 540
    nop

    .line 538
    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v0, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 542
    const/16 v4, 0xc

    invoke-static {v9, v4}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v5

    iput v5, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 543
    invoke-virtual {v2, v15, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 545
    const-string v0, "Target Upload Resolution (3:4 Aspect):"

    invoke-static {v9, v2, v0}, Lcom/bereal/dcimsaver/SettingsUi;->addLabel(Landroid/content/Context;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    .line 546
    nop

    .line 547
    nop

    .line 548
    nop

    .line 549
    nop

    .line 550
    const-string v0, "Full Sensor Resolution (Max 3:4 Crop \u2022 Exceeds 700 KB)"

    const-string v4, "1080 \u00d7 1440 (BeReal Default \u2022 Recommended for <700 KB)"

    const-string v5, "1440 \u00d7 1920 (2K QHD \u2022 May exceed 700 KB)"

    const-string v15, "2160 \u00d7 2880 (4K UHD \u2022 Exceeds 700 KB)"

    filled-new-array {v4, v5, v15, v0}, [Ljava/lang/String;

    move-result-object v0

    .line 551
    iget v4, v1, Lcom/bereal/dcimsaver/ModConfig;->uploadResPreset:I

    .line 546
    invoke-static {v9, v0, v4}, Lcom/bereal/dcimsaver/SettingsUi;->createRadioGroup(Landroid/content/Context;[Ljava/lang/String;I)Landroid/widget/RadioGroup;

    move-result-object v4

    .line 552
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 554
    const/16 v0, 0xc

    invoke-static {v9, v2, v0}, Lcom/bereal/dcimsaver/SettingsUi;->addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V

    .line 555
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 556
    const v5, -0x111112

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 557
    const/high16 v5, 0x41600000    # 14.0f

    const/4 v15, 0x2

    invoke-virtual {v0, v15, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 558
    sget-object v5, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 559
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v15, "Initial Upload WebP Quality: "

    invoke-direct {v5, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v15, v1, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v15, "%"

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 560
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 562
    new-instance v5, Landroid/widget/SeekBar;

    invoke-direct {v5, v9}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 563
    const/16 v15, 0x32

    invoke-virtual {v5, v15}, Landroid/widget/SeekBar;->setMax(I)V

    .line 564
    iget v3, v1, Lcom/bereal/dcimsaver/ModConfig;->uploadWebpQuality:I

    sub-int/2addr v3, v15

    invoke-static {v15, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/4 v15, 0x0

    invoke-static {v15, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 565
    const/4 v3, 0x4

    invoke-static {v9, v3}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v15

    const/16 v10, 0x8

    move-object/from16 v16, v4

    invoke-static {v9, v10}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v4

    move-object/from16 v17, v6

    invoke-static {v9, v3}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v9, v10}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v5, v15, v4, v6, v3}, Landroid/widget/SeekBar;->setPadding(IIII)V

    .line 566
    new-instance v3, Lcom/bereal/dcimsaver/SettingsUi$11;

    invoke-direct {v3, v0}, Lcom/bereal/dcimsaver/SettingsUi$11;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 577
    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 579
    const/4 v0, 0x6

    invoke-static {v9, v2, v0}, Lcom/bereal/dcimsaver/SettingsUi;->addSpacer(Landroid/content/Context;Landroid/widget/LinearLayout;I)V

    .line 581
    nop

    .line 582
    nop

    .line 583
    iget-boolean v0, v1, Lcom/bereal/dcimsaver/ModConfig;->bypassSizeCap:Z

    .line 580
    const-string v3, "Bypass 700 KB Client Size Cap (\u26a0\ufe0f Server rejects >700 KB)"

    invoke-static {v9, v3, v0}, Lcom/bereal/dcimsaver/SettingsUi;->createCheckBox(Landroid/content/Context;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v6

    .line 585
    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 587
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 588
    const-string v3, "\u26a0\ufe0f Warning: Enabling this disables client-side 700 KB auto-reduction, which will cause BeReal\'s server to reject uploads larger than 700 KB."

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 589
    const/16 v3, -0x7580

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 590
    const/high16 v3, 0x41300000    # 11.0f

    const/4 v15, 0x2

    invoke-virtual {v0, v15, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 591
    invoke-static {v9, v10}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {v9, v15}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/4 v15, 0x4

    invoke-static {v9, v15}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v15

    const/4 v10, 0x0

    invoke-virtual {v0, v3, v4, v10, v15}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 592
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 595
    new-instance v0, Lcom/bereal/dcimsaver/SettingsUi$12;

    move-object v3, v7

    move-object v7, v14

    move-object/from16 v4, v16

    move-object/from16 v2, v17

    const/high16 v10, -0x1000000

    const/16 v14, 0xa

    invoke-direct/range {v0 .. v9}, Lcom/bereal/dcimsaver/SettingsUi$12;-><init>(Lcom/bereal/dcimsaver/ModConfig;Landroid/widget/RadioGroup;Landroid/widget/RadioGroup;Landroid/widget/RadioGroup;Landroid/widget/SeekBar;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/content/Context;)V

    .line 610
    const-string v2, "Save Settings"

    const/4 v4, -0x1

    invoke-static {v9, v2, v4, v10}, Lcom/bereal/dcimsaver/SettingsUi;->createButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v2

    .line 611
    new-instance v3, Lcom/bereal/dcimsaver/SettingsUi$13;

    invoke-direct {v3, v0, v9, v11}, Lcom/bereal/dcimsaver/SettingsUi$13;-><init>(Ljava/lang/Runnable;Landroid/content/Context;Ljava/lang/Runnable;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 621
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 622
    nop

    .line 623
    nop

    .line 621
    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 625
    const/16 v5, 0x8

    invoke-static {v9, v5}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v5

    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 626
    invoke-virtual {v13, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 628
    if-eqz p1, :cond_2

    .line 629
    const-string v2, "Save & Open BeReal"

    const v3, -0xd9d9d5

    invoke-static {v9, v2, v3, v4}, Lcom/bereal/dcimsaver/SettingsUi;->createButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v2

    .line 630
    new-instance v3, Lcom/bereal/dcimsaver/SettingsUi$14;

    invoke-direct {v3, v0, v9, v1}, Lcom/bereal/dcimsaver/SettingsUi$14;-><init>(Ljava/lang/Runnable;Landroid/content/Context;Lcom/bereal/dcimsaver/ModConfig;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 648
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 649
    nop

    .line 650
    nop

    .line 648
    const/4 v5, -0x2

    invoke-direct {v0, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 652
    invoke-static {v9, v14}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 653
    invoke-virtual {v13, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 656
    :cond_2
    return-object v12
.end method

.method private static createButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;
    .locals 1

    .line 749
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 750
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 751
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 752
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 753
    const/4 p1, 0x2

    const/high16 p3, 0x41600000    # 14.0f

    invoke-virtual {v0, p1, p3}, Landroid/widget/Button;->setTextSize(IF)V

    .line 754
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 755
    const/16 p1, 0x11

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setGravity(I)V

    .line 756
    const/16 p1, 0xc

    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p3

    .line 757
    invoke-virtual {v0, p3, p3, p3, p3}, Landroid/widget/Button;->setPadding(IIII)V

    .line 758
    new-instance p3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 759
    invoke-virtual {p3, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 760
    invoke-static {p0, p1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {p3, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 761
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 762
    return-object v0
.end method

.method private static createCard(Landroid/content/Context;)Landroid/widget/LinearLayout;
    .locals 5

    .line 660
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 661
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 662
    const/16 v2, 0xe

    invoke-static {p0, v2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v3

    .line 663
    invoke-virtual {v0, v3, v3, v3, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 664
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 665
    const v4, -0xe5e5e2

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 666
    invoke-static {p0, v2}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v3, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 667
    invoke-static {p0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    const v1, -0xd3d3ce

    invoke-virtual {v3, p0, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 668
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 669
    return-object v0
.end method

.method private static createCardParams(Landroid/content/Context;)Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .line 673
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 674
    nop

    .line 675
    nop

    .line 673
    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 677
    const/16 v1, 0x10

    invoke-static {p0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    iput p0, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 678
    return-object v0
.end method

.method private static createCheckBox(Landroid/content/Context;Ljava/lang/String;Z)Landroid/widget/CheckBox;
    .locals 3

    .line 738
    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 739
    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 740
    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 741
    const p1, -0x111112

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 742
    const/4 p1, 0x2

    const/high16 p2, 0x41500000    # 13.0f

    invoke-virtual {v0, p1, p2}, Landroid/widget/CheckBox;->setTextSize(IF)V

    .line 743
    const/4 p1, -0x1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 744
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

    .line 745
    return-object v0
.end method

.method private static createRadioGroup(Landroid/content/Context;[Ljava/lang/String;I)Landroid/widget/RadioGroup;
    .locals 9

    .line 710
    new-instance v0, Landroid/widget/RadioGroup;

    invoke-direct {v0, p0}, Landroid/widget/RadioGroup;-><init>(Landroid/content/Context;)V

    .line 711
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/RadioGroup;->setOrientation(I)V

    .line 712
    const/4 v2, -0x1

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 713
    const/4 v3, 0x0

    :goto_0
    array-length v4, p1

    if-lt v3, v4, :cond_0

    .line 726
    return-object v0

    .line 714
    :cond_0
    new-instance v4, Landroid/widget/RadioButton;

    invoke-direct {v4, p0}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    .line 715
    add-int/lit16 v5, v3, 0x3e8

    invoke-virtual {v4, v5}, Landroid/widget/RadioButton;->setId(I)V

    .line 716
    aget-object v5, p1, v3

    invoke-virtual {v4, v5}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 717
    const v5, -0x111112

    invoke-virtual {v4, v5}, Landroid/widget/RadioButton;->setTextColor(I)V

    .line 718
    const/4 v5, 0x2

    const/high16 v6, 0x41500000    # 13.0f

    invoke-virtual {v4, v5, v6}, Landroid/widget/RadioButton;->setTextSize(IF)V

    .line 719
    invoke-virtual {v4, v2}, Landroid/widget/RadioButton;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    .line 720
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

    .line 721
    invoke-virtual {v0, v4}, Landroid/widget/RadioGroup;->addView(Landroid/view/View;)V

    .line 722
    if-ne v3, p2, :cond_1

    .line 723
    invoke-virtual {v4, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 713
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private static createSmallButton(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;
    .locals 3

    .line 766
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 767
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 768
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 769
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 770
    const/4 p3, 0x2

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, p3, v1}, Landroid/widget/Button;->setTextSize(IF)V

    .line 771
    sget-object p3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    .line 772
    const/16 p3, 0x11

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setGravity(I)V

    .line 773
    const/4 p3, 0x6

    invoke-static {p0, p3}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p3

    .line 774
    const/16 v1, 0x8

    invoke-static {p0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result v2

    .line 775
    invoke-virtual {v0, p3, v2, p3, v2}, Landroid/widget/Button;->setPadding(IIII)V

    .line 776
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 777
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 778
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 779
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 780
    invoke-static {p0, v1}, Lcom/bereal/dcimsaver/SettingsUi;->dp(Landroid/content/Context;I)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 781
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 782
    return-object v0
.end method

.method private static dp(Landroid/content/Context;I)I
    .locals 0

    .line 786
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 787
    int-to-float p1, p1

    mul-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private static getSelectedIndex(Landroid/widget/RadioGroup;I)I
    .locals 1

    .line 730
    invoke-virtual {p0}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result p0

    .line 731
    const/16 v0, 0x3e8

    if-lt p0, v0, :cond_0

    .line 732
    sub-int/2addr p0, v0

    return p0

    .line 734
    :cond_0
    return p1
.end method

.method public static showFeedDownloaderDialog(Landroid/app/Activity;)V
    .locals 1

    .line 69
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 72
    :cond_0
    new-instance v0, Lcom/bereal/dcimsaver/SettingsUi$2;

    invoke-direct {v0, p0}, Lcom/bereal/dcimsaver/SettingsUi$2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 93
    return-void

    .line 70
    :cond_1
    :goto_0
    return-void
.end method

.method public static showInAppDialog(Landroid/app/Activity;)V
    .locals 1

    .line 35
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 38
    :cond_0
    new-instance v0, Lcom/bereal/dcimsaver/SettingsUi$1;

    invoke-direct {v0, p0}, Lcom/bereal/dcimsaver/SettingsUi$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 66
    return-void

    .line 36
    :cond_1
    :goto_0
    return-void
.end method
