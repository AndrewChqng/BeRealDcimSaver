package com.bereal.dcimsaver;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public final class SettingsUi {

    public static void showInAppDialog(final Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                try {
                    AlertDialog.Builder builder = new AlertDialog.Builder(
                        activity, android.R.style.Theme_DeviceDefault_Dialog_Alert
                    );
                    final AlertDialog dialog = builder.create();
                    View content = buildSettingsView(activity, false, new Runnable() {
                        @Override
                        public void run() {
                            if (dialog.isShowing()) {
                                dialog.dismiss();
                            }
                        }
                    });
                    dialog.setView(content);
                    dialog.show();
                    if (dialog.getWindow() != null) {
                        GradientDrawable bg = new GradientDrawable();
                        bg.setColor(0xFF121214);
                        bg.setCornerRadius(dp(activity, 16));
                        dialog.getWindow().setBackgroundDrawable(bg);
                    }
                } catch (Throwable ignored) {
                }
            }
        });
    }

    public static void showFeedDownloaderDialog(final Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                try {
                    AlertDialog.Builder builder = new AlertDialog.Builder(
                        activity, android.R.style.Theme_DeviceDefault_Dialog_Alert
                    );
                    final AlertDialog dialog = builder.create();
                    View content = buildFeedDownloaderView(activity, dialog);
                    dialog.setView(content);
                    dialog.show();
                    if (dialog.getWindow() != null) {
                        GradientDrawable bg = new GradientDrawable();
                        bg.setColor(0xFF121214);
                        bg.setCornerRadius(dp(activity, 16));
                        dialog.getWindow().setBackgroundDrawable(bg);
                    }
                } catch (Throwable ignored) {
                }
            }
        });
    }

    private static View buildFeedDownloaderView(final Activity activity, final AlertDialog dialog) {
        LinearLayout outer = new LinearLayout(activity);
        outer.setOrientation(LinearLayout.VERTICAL);
        outer.setBackgroundColor(0xFF0E0E10);
        int pad = dp(activity, 16);
        outer.setPadding(pad, pad, pad, pad);

        TextView title = new TextView(activity);
        title.setText("📥 Download Users' BeReals");
        title.setTextColor(Color.WHITE);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        outer.addView(title);

        final TextView statusTv = new TextView(activity);
        statusTv.setText("Loading posts from BeReal feed database...");
        statusTv.setTextColor(0xFFAAAAAA);
        statusTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        statusTv.setPadding(0, dp(activity, 4), 0, dp(activity, 10));
        outer.addView(statusTv);

        // Search filter input
        final EditText searchBox = new EditText(activity);
        searchBox.setHint("Filter by @username, name, or caption...");
        searchBox.setHintTextColor(0xFF777777);
        searchBox.setTextColor(Color.WHITE);
        searchBox.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        searchBox.setSingleLine(true);
        int sPad = dp(activity, 10);
        searchBox.setPadding(sPad, sPad, sPad, sPad);
        GradientDrawable searchBg = new GradientDrawable();
        searchBg.setColor(0xFF1A1A1E);
        searchBg.setCornerRadius(dp(activity, 10));
        searchBg.setStroke(dp(activity, 1), 0xFF33333A);
        searchBox.setBackground(searchBg);
        outer.addView(searchBox, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        // Top Action Row: Refresh + Download All
        LinearLayout topActions = new LinearLayout(activity);
        topActions.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams topActionsLp = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        );
        topActionsLp.topMargin = dp(activity, 10);
        topActionsLp.bottomMargin = dp(activity, 10);
        outer.addView(topActions, topActionsLp);

        Button btnRefresh = createSmallButton(activity, "↻ Refresh List", 0xFF26262B, 0xFFFFFFFF);
        LinearLayout.LayoutParams refLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        refLp.rightMargin = dp(activity, 6);
        topActions.addView(btnRefresh, refLp);

        Button btnDownloadAll = createSmallButton(activity, "⬇ Download All Shown", 0xFFFFFFFF, 0xFF000000);
        LinearLayout.LayoutParams dlAllLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.3f);
        topActions.addView(btnDownloadAll, dlAllLp);

        // Scrollable post list container
        ScrollView listScroll = new ScrollView(activity);
        listScroll.setFillViewport(true);
        LinearLayout.LayoutParams scrollLp = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            dp(activity, 370),
            1f
        );
        outer.addView(listScroll, scrollLp);

        final LinearLayout listContainer = new LinearLayout(activity);
        listContainer.setOrientation(LinearLayout.VERTICAL);
        listScroll.addView(listContainer, new ViewGroup.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        final List<FeedDownloader.FeedPost> allPosts = new ArrayList<FeedDownloader.FeedPost>();
        final List<FeedDownloader.FeedPost> filteredPosts = new ArrayList<FeedDownloader.FeedPost>();

        final Runnable renderList = new Runnable() {
            @Override
            public void run() {
                listContainer.removeAllViews();
                filteredPosts.clear();
                String q = searchBox.getText() != null
                    ? searchBox.getText().toString().trim().toLowerCase(Locale.US)
                    : "";

                for (FeedDownloader.FeedPost p : allPosts) {
                    if (!q.isEmpty()) {
                        String u = p.userName != null ? p.userName.toLowerCase(Locale.US) : "";
                        String f = p.fullName != null ? p.fullName.toLowerCase(Locale.US) : "";
                        String c = p.caption != null ? p.caption.toLowerCase(Locale.US) : "";
                        if (!u.contains(q) && !f.contains(q) && !c.contains(q)) {
                            continue;
                        }
                    }
                    filteredPosts.add(p);
                }

                if (filteredPosts.isEmpty()) {
                    TextView emptyTv = new TextView(activity);
                    emptyTv.setText(allPosts.isEmpty()
                        ? "No posts found in database yet. Scroll your BeReal feed and tap Refresh."
                        : "No posts match filter '" + q + "'.");
                    emptyTv.setTextColor(0xFF888888);
                    emptyTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                    emptyTv.setPadding(dp(activity, 8), dp(activity, 20), dp(activity, 8), dp(activity, 20));
                    listContainer.addView(emptyTv);
                    return;
                }

                for (final FeedDownloader.FeedPost post : filteredPosts) {
                    LinearLayout itemCard = createCard(activity);
                    LinearLayout.LayoutParams itemLp = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT
                    );
                    itemLp.bottomMargin = dp(activity, 10);
                    listContainer.addView(itemCard, itemLp);

                    // User + Timestamp header
                    TextView userTv = new TextView(activity);
                    String timeStr = post.getFormattedTime();
                    userTv.setText(post.getDisplayUser() + (timeStr.isEmpty() ? "" : "  •  " + timeStr));
                    userTv.setTextColor(Color.WHITE);
                    userTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                    userTv.setTypeface(Typeface.DEFAULT_BOLD);
                    itemCard.addView(userTv);

                    if (FeedDownloader.isNonEmpty(post.caption)) {
                        TextView capTv = new TextView(activity);
                        capTv.setText("\"" + post.caption + "\"");
                        capTv.setTextColor(0xFFCCCCCC);
                        capTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
                        capTv.setPadding(0, dp(activity, 2), 0, dp(activity, 4));
                        itemCard.addView(capTv);
                    }

                    // Download buttons row
                    LinearLayout btnRow = new LinearLayout(activity);
                    btnRow.setOrientation(LinearLayout.HORIZONTAL);
                    LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT
                    );
                    rowLp.topMargin = dp(activity, 8);
                    itemCard.addView(btnRow, rowLp);

                    Button bBoth = createSmallButton(activity, "⬇ Both", 0xFFFFFFFF, 0xFF000000);
                    bBoth.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            FeedDownloader.downloadPostMedia(activity, post, true, true, false);
                        }
                    });
                    LinearLayout.LayoutParams lp1 = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
                    lp1.rightMargin = dp(activity, 5);
                    btnRow.addView(bBoth, lp1);

                    Button bPri = createSmallButton(activity, "⬇ Primary", 0xFF28282E, 0xFFFFFFFF);
                    bPri.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            FeedDownloader.downloadPostMedia(activity, post, true, false, false);
                        }
                    });
                    LinearLayout.LayoutParams lp2 = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
                    lp2.rightMargin = dp(activity, 5);
                    btnRow.addView(bPri, lp2);

                    Button bSec = createSmallButton(activity, "⬇ Secondary", 0xFF28282E, 0xFFFFFFFF);
                    bSec.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            FeedDownloader.downloadPostMedia(activity, post, false, true, false);
                        }
                    });
                    LinearLayout.LayoutParams lp3 = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.1f);
                    btnRow.addView(bSec, lp3);

                    if (post.hasVideoOrBts()) {
                        lp3.rightMargin = dp(activity, 5);
                        Button bBts = createSmallButton(activity, "⬇ BTS", 0xFF332840, 0xFFE1BEE7);
                        bBts.setOnClickListener(new View.OnClickListener() {
                            @Override
                            public void onClick(View v) {
                                FeedDownloader.downloadPostMedia(activity, post, false, false, true);
                            }
                        });
                        LinearLayout.LayoutParams lp4 = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 0.85f);
                        btnRow.addView(bBts, lp4);
                    }
                }
            }
        };

        final Runnable triggerLoad = new Runnable() {
            @Override
            public void run() {
                statusTv.setText("Querying BeReal feed database...");
                FeedDownloader.loadFeedPostsAsync(new FeedDownloader.PostsCallback() {
                    @Override
                    public void onPostsLoaded(List<FeedDownloader.FeedPost> posts, String error) {
                        allPosts.clear();
                        if (posts != null) {
                            allPosts.addAll(posts);
                        }
                        if (error != null) {
                            statusTv.setText(error);
                        } else {
                            statusTv.setText("Loaded " + allPosts.size()
                                + " posts • Saved to DCIM/BeReal/BeReal_<username>_<time>_*.webp");
                        }
                        renderList.run();
                    }
                });
            }
        };

        btnRefresh.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                triggerLoad.run();
            }
        });

        btnDownloadAll.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                FeedDownloader.downloadAllPosts(activity, new ArrayList<FeedDownloader.FeedPost>(filteredPosts));
            }
        });

        searchBox.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                renderList.run();
            }
            @Override
            public void afterTextChanged(Editable s) {}
        });

        // Bottom Navigation Row
        LinearLayout bottomRow = new LinearLayout(activity);
        bottomRow.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams botLp = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        );
        botLp.topMargin = dp(activity, 10);
        outer.addView(bottomRow, botLp);

        Button btnBackSettings = createSmallButton(activity, "⚙ Mod Settings", 0xFF26262B, 0xFFFFFFFF);
        btnBackSettings.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (dialog != null && dialog.isShowing()) {
                    dialog.dismiss();
                }
                showInAppDialog(activity);
            }
        });
        LinearLayout.LayoutParams backLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        backLp.rightMargin = dp(activity, 8);
        bottomRow.addView(btnBackSettings, backLp);

        Button btnClose = createSmallButton(activity, "Close", 0xFF33333A, 0xFFFFFFFF);
        btnClose.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (dialog != null && dialog.isShowing()) {
                    dialog.dismiss();
                }
            }
        });
        LinearLayout.LayoutParams closeLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        bottomRow.addView(btnClose, closeLp);

        triggerLoad.run();
        return outer;
    }

    public static View buildSettingsView(
        final Context ctx,
        final boolean isStandaloneApp,
        final Runnable onCloseCallback
    ) {
        final ModConfig cfg = ModConfig.load(ctx);

        ScrollView scroll = new ScrollView(ctx);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(0xFF0E0E10);

        LinearLayout root = new LinearLayout(ctx);
        root.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(ctx, 20);
        root.setPadding(pad, pad, pad, pad);
        scroll.addView(root, new ViewGroup.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        // Title Header
        TextView title = new TextView(ctx);
        title.setText("BeReal. Quality & DCIM Mod");
        title.setTextColor(Color.WHITE);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        root.addView(title);

        TextView subtitle = new TextView(ctx);
        subtitle.setText(isStandaloneApp
            ? "Standalone Configuration • Long-press 'BeReal.' logo in-app for quick settings"
            : "In-App Settings • Changes apply immediately to your next capture");
        subtitle.setTextColor(0xFFAAAAAA);
        subtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        subtitle.setPadding(0, dp(ctx, 4), 0, dp(ctx, 14));
        root.addView(subtitle);

        // Quick Action Card: Download Other Users' Primary / Secondary Posts
        LinearLayout dlCard = createCard(ctx);
        root.addView(dlCard, createCardParams(ctx));
        addSectionHeader(ctx, dlCard, "Download Other Users' BeReals");

        TextView dlDesc = new TextView(ctx);
        dlDesc.setText("Browse active feed posts & memories by @username and download any user's Primary, Secondary, or BTS video directly to DCIM/BeReal.");
        dlDesc.setTextColor(0xFFCCCCCC);
        dlDesc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        dlDesc.setPadding(0, 0, 0, dp(ctx, 10));
        dlCard.addView(dlDesc);

        Button btnOpenDownloader = createButton(
            ctx,
            isStandaloneApp
                ? "📥 Open Feed Post Downloader in BeReal"
                : "📥 Browse & Download Users' Posts (Primary / Secondary)",
            0xFFFFFFFF,
            0xFF000000
        );
        btnOpenDownloader.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!isStandaloneApp && ctx instanceof Activity) {
                    if (onCloseCallback != null) {
                        onCloseCallback.run();
                    }
                    showFeedDownloaderDialog((Activity) ctx);
                } else {
                    try {
                        Intent launch = ctx.getPackageManager().getLaunchIntentForPackage("com.bereal.ft");
                        if (launch != null) {
                            cfg.writeToIntent(launch);
                            launch.putExtra(ModConfig.EXTRA_OPEN_DOWNLOADER, true);
                            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                            ctx.startActivity(launch);
                        } else {
                            Toast.makeText(ctx, "BeReal (com.bereal.ft) is not installed", Toast.LENGTH_SHORT).show();
                        }
                    } catch (Throwable t) {
                        Toast.makeText(ctx, "Could not launch BeReal: " + t.getMessage(), Toast.LENGTH_SHORT).show();
                    }
                }
            }
        });
        dlCard.addView(btnOpenDownloader);

        // Card 1: Local DCIM Export
        LinearLayout dcimCard = createCard(ctx);
        root.addView(dcimCard, createCardParams(ctx));

        addSectionHeader(ctx, dcimCard, "1. Your Camera Captures (DCIM/BeReal)");

        addLabel(ctx, dcimCard, "Photos to Save Locally:");
        final RadioGroup rgSaveMode = createRadioGroup(ctx, new String[]{
            "Processed / Uploaded (.webp) Only",
            "Full-Resolution Raw Sensor Dump Only",
            "Both (Full-Res Sensor + Processed .webp)"
        }, cfg.saveMode);
        dcimCard.addView(rgSaveMode);

        addSpacer(ctx, dcimCard, 10);
        addLabel(ctx, dcimCard, "Full-Resolution Sensor Dump Format:");
        final RadioGroup rgFormat = createRadioGroup(ctx, new String[]{
            "WebP (100% Quality / Lossless)",
            "JPEG (100% Quality)",
            "PNG (Uncompressed Lossless)"
        }, cfg.fullResFormat);
        dcimCard.addView(rgFormat);

        addSpacer(ctx, dcimCard, 10);
        addLabel(ctx, dcimCard, "Extra Media Types:");
        final CheckBox cbBts = createCheckBox(
            ctx,
            "Save Behind-the-Scenes (BTS) Raw Videos (.mp4)",
            cfg.saveBtsVideos
        );
        dcimCard.addView(cbBts);

        final CheckBox cbRealMojis = createCheckBox(
            ctx,
            "Save RealMoji Captures (.webp)",
            cfg.saveRealMojis
        );
        dcimCard.addView(cbRealMojis);

        // Card 2: Uploaded Post Quality
        LinearLayout uploadCard = createCard(ctx);
        root.addView(uploadCard, createCardParams(ctx));

        addSectionHeader(ctx, uploadCard, "2. Uploaded BeReal Post Quality Boost");

        // Prominent Server-Side 700 KB Restriction Warning Banner
        LinearLayout warningBanner = new LinearLayout(ctx);
        warningBanner.setOrientation(LinearLayout.VERTICAL);
        int wPad = dp(ctx, 12);
        warningBanner.setPadding(wPad, wPad, wPad, wPad);
        GradientDrawable warnBg = new GradientDrawable();
        warnBg.setColor(0xFF2B1C14);
        warnBg.setCornerRadius(dp(ctx, 10));
        warnBg.setStroke(dp(ctx, 1), 0xFFFF9800);
        warningBanner.setBackground(warnBg);

        TextView warnTitle = new TextView(ctx);
        warnTitle.setText("⚠️ Server-Side 700 KB Upload Limit");
        warnTitle.setTextColor(0xFFFFB74D);
        warnTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        warnTitle.setTypeface(Typeface.DEFAULT_BOLD);
        warningBanner.addView(warnTitle);

        TextView warnBody = new TextView(ctx);
        warnBody.setText("BeReal's servers strictly reject uploaded .webp files larger than 700 KB. "
            + "For reliable uploads, keep '1080 × 1440' selected and leave 'Bypass 700 KB Cap' UNCHECKED "
            + "so BeReal starts at your chosen WebP quality and automatically steps down if needed to fit under 700 KB. "
            + "(Your local Full-Res DCIM/BeReal photos are completely unaffected by this limit.)");
        warnBody.setTextColor(0xFFFFE0B2);
        warnBody.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
        warnBody.setPadding(0, dp(ctx, 4), 0, 0);
        warningBanner.addView(warnBody);

        LinearLayout.LayoutParams warnParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        );
        warnParams.bottomMargin = dp(ctx, 12);
        uploadCard.addView(warningBanner, warnParams);

        addLabel(ctx, uploadCard, "Target Upload Resolution (3:4 Aspect):");
        final RadioGroup rgUploadRes = createRadioGroup(ctx, new String[]{
            "1080 × 1440 (BeReal Default • Recommended for <700 KB)",
            "1440 × 1920 (2K QHD • May exceed 700 KB)",
            "2160 × 2880 (4K UHD • Exceeds 700 KB)",
            "Full Sensor Resolution (Max 3:4 Crop • Exceeds 700 KB)"
        }, cfg.uploadResPreset);
        uploadCard.addView(rgUploadRes);

        addSpacer(ctx, uploadCard, 12);
        final TextView tvQualityLabel = new TextView(ctx);
        tvQualityLabel.setTextColor(0xFFEEEEEE);
        tvQualityLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        tvQualityLabel.setTypeface(Typeface.DEFAULT_BOLD);
        tvQualityLabel.setText("Initial Upload WebP Quality: " + cfg.uploadWebpQuality + "%");
        uploadCard.addView(tvQualityLabel);

        final SeekBar sbQuality = new SeekBar(ctx);
        sbQuality.setMax(50); // 50..100
        sbQuality.setProgress(Math.max(0, Math.min(50, cfg.uploadWebpQuality - 50)));
        sbQuality.setPadding(dp(ctx, 4), dp(ctx, 8), dp(ctx, 4), dp(ctx, 8));
        sbQuality.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                int q = 50 + progress;
                tvQualityLabel.setText("Initial Upload WebP Quality: " + q + "%");
            }
            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {}
            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {}
        });
        uploadCard.addView(sbQuality);

        addSpacer(ctx, uploadCard, 6);
        final CheckBox cbBypassCap = createCheckBox(
            ctx,
            "Bypass 700 KB Client Size Cap (⚠️ Server rejects >700 KB)",
            cfg.bypassSizeCap
        );
        uploadCard.addView(cbBypassCap);

        TextView capHint = new TextView(ctx);
        capHint.setText("⚠️ Warning: Enabling this disables client-side 700 KB auto-reduction, which will cause BeReal's server to reject uploads larger than 700 KB.");
        capHint.setTextColor(0xFFFF8A80);
        capHint.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        capHint.setPadding(dp(ctx, 8), dp(ctx, 2), 0, dp(ctx, 4));
        uploadCard.addView(capHint);

        // Save Helper
        final Runnable collectAndSave = new Runnable() {
            @Override
            public void run() {
                cfg.saveMode = getSelectedIndex(rgSaveMode, ModConfig.SAVE_MODE_BOTH);
                cfg.fullResFormat = getSelectedIndex(rgFormat, ModConfig.FORMAT_WEBP_100);
                cfg.uploadResPreset = getSelectedIndex(rgUploadRes, ModConfig.UPLOAD_RES_1080);
                cfg.uploadWebpQuality = 50 + sbQuality.getProgress();
                cfg.bypassSizeCap = cbBypassCap.isChecked();
                cfg.saveBtsVideos = cbBts.isChecked();
                cfg.saveRealMojis = cbRealMojis.isChecked();
                cfg.saveAndBroadcast(ctx);
            }
        };

        // Buttons Row
        Button btnSave = createButton(ctx, "Save Settings", 0xFFFFFFFF, 0xFF000000);
        btnSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                collectAndSave.run();
                Toast.makeText(ctx, "BeReal Mod settings saved!", Toast.LENGTH_SHORT).show();
                if (onCloseCallback != null) {
                    onCloseCallback.run();
                }
            }
        });
        LinearLayout.LayoutParams btnParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        );
        btnParams.topMargin = dp(ctx, 8);
        root.addView(btnSave, btnParams);

        if (isStandaloneApp) {
            Button btnOpenBeReal = createButton(ctx, "Save & Open BeReal", 0xFF26262B, 0xFFFFFFFF);
            btnOpenBeReal.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    collectAndSave.run();
                    try {
                        Intent launch = ctx.getPackageManager().getLaunchIntentForPackage("com.bereal.ft");
                        if (launch != null) {
                            cfg.writeToIntent(launch);
                            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                            ctx.startActivity(launch);
                        } else {
                            Toast.makeText(ctx, "BeReal (com.bereal.ft) is not installed", Toast.LENGTH_SHORT).show();
                        }
                    } catch (Throwable t) {
                        Toast.makeText(ctx, "Could not launch BeReal: " + t.getMessage(), Toast.LENGTH_SHORT).show();
                    }
                }
            });
            LinearLayout.LayoutParams openParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
            );
            openParams.topMargin = dp(ctx, 10);
            root.addView(btnOpenBeReal, openParams);
        }

        return scroll;
    }

    private static LinearLayout createCard(Context ctx) {
        LinearLayout card = new LinearLayout(ctx);
        card.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(ctx, 14);
        card.setPadding(pad, pad, pad, pad);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(0xFF1A1A1E);
        bg.setCornerRadius(dp(ctx, 14));
        bg.setStroke(dp(ctx, 1), 0xFF2C2C32);
        card.setBackground(bg);
        return card;
    }

    private static LinearLayout.LayoutParams createCardParams(Context ctx) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        );
        lp.bottomMargin = dp(ctx, 16);
        return lp;
    }

    private static void addSectionHeader(Context ctx, LinearLayout parent, String text) {
        TextView tv = new TextView(ctx);
        tv.setText(text);
        tv.setTextColor(0xFFFFFFFF);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tv.setTypeface(Typeface.DEFAULT_BOLD);
        tv.setPadding(0, 0, 0, dp(ctx, 8));
        parent.addView(tv);
    }

    private static void addLabel(Context ctx, LinearLayout parent, String text) {
        TextView tv = new TextView(ctx);
        tv.setText(text);
        tv.setTextColor(0xFFCCCCCC);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        tv.setTypeface(Typeface.DEFAULT_BOLD);
        tv.setPadding(0, dp(ctx, 2), 0, dp(ctx, 4));
        parent.addView(tv);
    }

    private static void addSpacer(Context ctx, LinearLayout parent, int dpHeight) {
        View v = new View(ctx);
        parent.addView(v, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            dp(ctx, dpHeight)
        ));
    }

    private static RadioGroup createRadioGroup(Context ctx, String[] options, int selectedIdx) {
        RadioGroup rg = new RadioGroup(ctx);
        rg.setOrientation(RadioGroup.VERTICAL);
        ColorStateList tint = ColorStateList.valueOf(0xFFFFFFFF);
        for (int i = 0; i < options.length; i++) {
            RadioButton rb = new RadioButton(ctx);
            rb.setId(1000 + i);
            rb.setText(options[i]);
            rb.setTextColor(0xFFEEEEEE);
            rb.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            rb.setButtonTintList(tint);
            rb.setPadding(dp(ctx, 6), dp(ctx, 6), dp(ctx, 6), dp(ctx, 6));
            rg.addView(rb);
            if (i == selectedIdx) {
                rb.setChecked(true);
            }
        }
        return rg;
    }

    private static int getSelectedIndex(RadioGroup rg, int fallback) {
        int id = rg.getCheckedRadioButtonId();
        if (id >= 1000) {
            return id - 1000;
        }
        return fallback;
    }

    private static CheckBox createCheckBox(Context ctx, String text, boolean checked) {
        CheckBox cb = new CheckBox(ctx);
        cb.setText(text);
        cb.setChecked(checked);
        cb.setTextColor(0xFFEEEEEE);
        cb.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        cb.setButtonTintList(ColorStateList.valueOf(0xFFFFFFFF));
        cb.setPadding(dp(ctx, 6), dp(ctx, 6), dp(ctx, 6), dp(ctx, 6));
        return cb;
    }

    private static Button createButton(Context ctx, String text, int bgColor, int textColor) {
        Button btn = new Button(ctx);
        btn.setText(text);
        btn.setAllCaps(false);
        btn.setTextColor(textColor);
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        btn.setTypeface(Typeface.DEFAULT_BOLD);
        btn.setGravity(Gravity.CENTER);
        int vPad = dp(ctx, 12);
        btn.setPadding(vPad, vPad, vPad, vPad);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(bgColor);
        bg.setCornerRadius(dp(ctx, 12));
        btn.setBackground(bg);
        return btn;
    }

    private static Button createSmallButton(Context ctx, String text, int bgColor, int textColor) {
        Button btn = new Button(ctx);
        btn.setText(text);
        btn.setAllCaps(false);
        btn.setTextColor(textColor);
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        btn.setTypeface(Typeface.DEFAULT_BOLD);
        btn.setGravity(Gravity.CENTER);
        int hPad = dp(ctx, 6);
        int vPad = dp(ctx, 8);
        btn.setPadding(hPad, vPad, hPad, vPad);
        btn.setMinimumHeight(0);
        btn.setMinHeight(0);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(bgColor);
        bg.setCornerRadius(dp(ctx, 8));
        btn.setBackground(bg);
        return btn;
    }

    private static int dp(Context ctx, int dp) {
        float density = ctx.getResources().getDisplayMetrics().density;
        return Math.round(dp * density);
    }
}
