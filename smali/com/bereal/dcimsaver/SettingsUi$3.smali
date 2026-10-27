.class Lcom/bereal/dcimsaver/SettingsUi$3;
.super Ljava/lang/Object;
.source "SettingsUi.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bereal/dcimsaver/SettingsUi;->buildFeedDownloaderView(Landroid/app/Activity;Landroid/app/AlertDialog;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$activity:Landroid/app/Activity;

.field private final synthetic val$allPosts:Ljava/util/List;

.field private final synthetic val$filteredPosts:Ljava/util/List;

.field private final synthetic val$listContainer:Landroid/widget/LinearLayout;

.field private final synthetic val$searchBox:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Landroid/widget/LinearLayout;Ljava/util/List;Landroid/widget/EditText;Ljava/util/List;Landroid/app/Activity;)V
    .locals 0

    .line 175
    iput-object p1, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$listContainer:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$filteredPosts:Ljava/util/List;

    iput-object p3, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$searchBox:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$allPosts:Ljava/util/List;

    iput-object p5, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .line 178
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$listContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 179
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$filteredPosts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 180
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$searchBox:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    const-string v1, ""

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$searchBox:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 182
    :cond_0
    move-object v0, v1

    .line 180
    :goto_0
    nop

    .line 184
    iget-object v2, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$allPosts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_7

    .line 196
    iget-object v2, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$filteredPosts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    const/16 v3, 0x8

    const/4 v4, 0x2

    if-eqz v2, :cond_2

    .line 197
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 198
    iget-object v2, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$allPosts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 199
    const-string v0, "No posts found in database yet. Scroll your BeReal feed and tap Refresh."

    goto :goto_2

    .line 200
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v5, "No posts match filter \'"

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\'."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 198
    :goto_2
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    const v0, -0x777778

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 202
    const/high16 v0, 0x41500000    # 13.0f

    invoke-virtual {v1, v4, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 203
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-static {v0, v3}, Lcom/bereal/dcimsaver/SettingsUi;->access$0(Landroid/content/Context;I)I

    move-result v0

    iget-object v2, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    const/16 v4, 0x14

    invoke-static {v2, v4}, Lcom/bereal/dcimsaver/SettingsUi;->access$0(Landroid/content/Context;I)I

    move-result v2

    iget-object v5, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-static {v5, v3}, Lcom/bereal/dcimsaver/SettingsUi;->access$0(Landroid/content/Context;I)I

    move-result v3

    iget-object v5, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-static {v5, v4}, Lcom/bereal/dcimsaver/SettingsUi;->access$0(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 204
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$listContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 205
    return-void

    .line 208
    :cond_2
    iget-object v0, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$filteredPosts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_3
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_4

    .line 290
    return-void

    .line 208
    :cond_4
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;

    .line 209
    iget-object v2, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-static {v2}, Lcom/bereal/dcimsaver/SettingsUi;->access$2(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    .line 210
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    .line 211
    nop

    .line 212
    nop

    .line 210
    const/4 v7, -0x1

    const/4 v8, -0x2

    invoke-direct {v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 214
    iget-object v9, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    const/16 v10, 0xa

    invoke-static {v9, v10}, Lcom/bereal/dcimsaver/SettingsUi;->access$0(Landroid/content/Context;I)I

    move-result v9

    iput v9, v6, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 215
    iget-object v9, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$listContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 218
    new-instance v6, Landroid/widget/TextView;

    iget-object v9, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-direct {v6, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 219
    invoke-virtual {v0}, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->getFormattedTime()Ljava/lang/String;

    move-result-object v9

    .line 220
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->getDisplayUser()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_5

    move-object v9, v1

    goto :goto_4

    :cond_5
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "  \u2022  "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    :goto_4
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 221
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 222
    const/high16 v9, 0x41600000    # 14.0f

    invoke-virtual {v6, v4, v9}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 223
    sget-object v9, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 224
    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 226
    iget-object v6, v0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->caption:Ljava/lang/String;

    invoke-static {v6}, Lcom/bereal/dcimsaver/FeedDownloader;->isNonEmpty(Ljava/lang/String;)Z

    move-result v6

    const/4 v9, 0x0

    if-eqz v6, :cond_6

    .line 227
    new-instance v6, Landroid/widget/TextView;

    iget-object v10, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-direct {v6, v10}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 228
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "\""

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v12, v0, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->caption:Ljava/lang/String;

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 229
    const v10, -0x333334

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 230
    const/high16 v10, 0x41400000    # 12.0f

    invoke-virtual {v6, v4, v10}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 231
    iget-object v10, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-static {v10, v4}, Lcom/bereal/dcimsaver/SettingsUi;->access$0(Landroid/content/Context;I)I

    move-result v10

    iget-object v11, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    const/4 v12, 0x4

    invoke-static {v11, v12}, Lcom/bereal/dcimsaver/SettingsUi;->access$0(Landroid/content/Context;I)I

    move-result v11

    invoke-virtual {v6, v9, v10, v9, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 232
    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 236
    :cond_6
    new-instance v6, Landroid/widget/LinearLayout;

    iget-object v10, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-direct {v6, v10}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 237
    invoke-virtual {v6, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 238
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    .line 239
    nop

    .line 240
    nop

    .line 238
    invoke-direct {v10, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 242
    iget-object v11, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-static {v11, v3}, Lcom/bereal/dcimsaver/SettingsUi;->access$0(Landroid/content/Context;I)I

    move-result v11

    iput v11, v10, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 243
    invoke-virtual {v2, v6, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 245
    iget-object v2, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    const-string v10, "\u2b07 Both"

    const/high16 v11, -0x1000000

    invoke-static {v2, v10, v7, v11}, Lcom/bereal/dcimsaver/SettingsUi;->access$3(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v2

    .line 246
    new-instance v10, Lcom/bereal/dcimsaver/SettingsUi$3$1;

    iget-object v11, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-direct {v10, p0, v11, v0}, Lcom/bereal/dcimsaver/SettingsUi$3$1;-><init>(Lcom/bereal/dcimsaver/SettingsUi$3;Landroid/app/Activity;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;)V

    invoke-virtual {v2, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 252
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-direct {v10, v9, v8, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 253
    iget-object v12, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    const/4 v13, 0x5

    invoke-static {v12, v13}, Lcom/bereal/dcimsaver/SettingsUi;->access$0(Landroid/content/Context;I)I

    move-result v12

    iput v12, v10, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 254
    invoke-virtual {v6, v2, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 256
    iget-object v2, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    const-string v10, "\u2b07 Primary"

    const v12, -0xd7d7d2

    invoke-static {v2, v10, v12, v7}, Lcom/bereal/dcimsaver/SettingsUi;->access$3(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v2

    .line 257
    new-instance v10, Lcom/bereal/dcimsaver/SettingsUi$3$2;

    iget-object v14, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-direct {v10, p0, v14, v0}, Lcom/bereal/dcimsaver/SettingsUi$3$2;-><init>(Lcom/bereal/dcimsaver/SettingsUi$3;Landroid/app/Activity;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;)V

    invoke-virtual {v2, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 263
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v10, v9, v8, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 264
    iget-object v11, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-static {v11, v13}, Lcom/bereal/dcimsaver/SettingsUi;->access$0(Landroid/content/Context;I)I

    move-result v11

    iput v11, v10, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 265
    invoke-virtual {v6, v2, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 267
    iget-object v2, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    const-string v10, "\u2b07 Secondary"

    invoke-static {v2, v10, v12, v7}, Lcom/bereal/dcimsaver/SettingsUi;->access$3(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v2

    .line 268
    new-instance v7, Lcom/bereal/dcimsaver/SettingsUi$3$3;

    iget-object v10, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-direct {v7, p0, v10, v0}, Lcom/bereal/dcimsaver/SettingsUi$3$3;-><init>(Lcom/bereal/dcimsaver/SettingsUi$3;Landroid/app/Activity;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;)V

    invoke-virtual {v2, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 274
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const v10, 0x3f8ccccd    # 1.1f

    invoke-direct {v7, v9, v8, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 275
    invoke-virtual {v6, v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 277
    invoke-virtual {v0}, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->hasVideoOrBts()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 278
    iget-object v2, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-static {v2, v13}, Lcom/bereal/dcimsaver/SettingsUi;->access$0(Landroid/content/Context;I)I

    move-result v2

    iput v2, v7, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 279
    iget-object v2, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    const v7, -0xccd7c0

    const v10, -0x1e4119

    const-string v11, "\u2b07 BTS"

    invoke-static {v2, v11, v7, v10}, Lcom/bereal/dcimsaver/SettingsUi;->access$3(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v2

    .line 280
    new-instance v7, Lcom/bereal/dcimsaver/SettingsUi$3$4;

    iget-object v10, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$activity:Landroid/app/Activity;

    invoke-direct {v7, p0, v10, v0}, Lcom/bereal/dcimsaver/SettingsUi$3$4;-><init>(Lcom/bereal/dcimsaver/SettingsUi$3;Landroid/app/Activity;Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;)V

    invoke-virtual {v2, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 286
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const v7, 0x3f59999a    # 0.85f

    invoke-direct {v0, v9, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 287
    invoke-virtual {v6, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_3

    .line 184
    :cond_7
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;

    .line 185
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_b

    .line 186
    iget-object v4, v3, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    if-eqz v4, :cond_8

    iget-object v4, v3, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->userName:Ljava/lang/String;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    goto :goto_5

    :cond_8
    move-object v4, v1

    .line 187
    :goto_5
    iget-object v5, v3, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->fullName:Ljava/lang/String;

    if-eqz v5, :cond_9

    iget-object v5, v3, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->fullName:Ljava/lang/String;

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    goto :goto_6

    :cond_9
    move-object v5, v1

    .line 188
    :goto_6
    iget-object v6, v3, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->caption:Ljava/lang/String;

    if-eqz v6, :cond_a

    iget-object v6, v3, Lcom/bereal/dcimsaver/FeedDownloader$FeedPost;->caption:Ljava/lang/String;

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    goto :goto_7

    :cond_a
    move-object v6, v1

    .line 189
    :goto_7
    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_b

    invoke-virtual {v5, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_b

    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_b

    .line 190
    goto/16 :goto_1

    .line 193
    :cond_b
    iget-object v4, p0, Lcom/bereal/dcimsaver/SettingsUi$3;->val$filteredPosts:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1
.end method
