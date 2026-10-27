package com.bereal.dcimsaver;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

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
        subtitle.setPadding(0, dp(ctx, 4), 0, dp(ctx, 16));
        root.addView(subtitle);

        // Card 1: Local DCIM Export
        LinearLayout dcimCard = createCard(ctx);
        root.addView(dcimCard, createCardParams(ctx));

        addSectionHeader(ctx, dcimCard, "1. Local DCIM Export (DCIM/BeReal)");

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

        addLabel(ctx, uploadCard, "Target Upload Resolution (3:4 Aspect):");
        final RadioGroup rgUploadRes = createRadioGroup(ctx, new String[]{
            "1080 × 1440 (BeReal Default)",
            "1440 × 1920 (2K QHD Boost)",
            "2160 × 2880 (4K UHD Boost)",
            "Full Sensor Resolution (Max 3:4 Crop)"
        }, cfg.uploadResPreset);
        uploadCard.addView(rgUploadRes);

        addSpacer(ctx, uploadCard, 12);
        final TextView tvQualityLabel = new TextView(ctx);
        tvQualityLabel.setTextColor(0xFFEEEEEE);
        tvQualityLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        tvQualityLabel.setTypeface(Typeface.DEFAULT_BOLD);
        tvQualityLabel.setText("Upload WebP Compression Quality: " + cfg.uploadWebpQuality + "%");
        uploadCard.addView(tvQualityLabel);

        final SeekBar sbQuality = new SeekBar(ctx);
        sbQuality.setMax(50); // 50..100
        sbQuality.setProgress(Math.max(0, Math.min(50, cfg.uploadWebpQuality - 50)));
        sbQuality.setPadding(dp(ctx, 4), dp(ctx, 8), dp(ctx, 4), dp(ctx, 8));
        sbQuality.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                int q = 50 + progress;
                tvQualityLabel.setText("Upload WebP Compression Quality: " + q + "%");
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
            "Bypass 700 KB Upload File Size Cap (Unlimited)",
            cfg.bypassSizeCap
        );
        uploadCard.addView(cbBypassCap);

        TextView capHint = new TextView(ctx);
        capHint.setText("Required for 2K/4K/Full-Res uploads so BeReal does not recompress down to 50% quality or fail above 700 KB.");
        capHint.setTextColor(0xFF888888);
        capHint.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        capHint.setPadding(dp(ctx, 8), dp(ctx, 2), 0, dp(ctx, 4));
        uploadCard.addView(capHint);

        // Save Helper
        final Runnable collectAndSave = new Runnable() {
            @Override
            public void run() {
                cfg.saveMode = getSelectedIndex(rgSaveMode, ModConfig.SAVE_MODE_BOTH);
                cfg.fullResFormat = getSelectedIndex(rgFormat, ModConfig.FORMAT_WEBP_100);
                cfg.uploadResPreset = getSelectedIndex(rgUploadRes, ModConfig.UPLOAD_RES_2160);
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
        int pad = dp(ctx, 16);
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
        tv.setPadding(0, 0, 0, dp(ctx, 10));
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
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
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

    private static int dp(Context ctx, int dp) {
        float density = ctx.getResources().getDisplayMetrics().density;
        return Math.round(dp * density);
    }
}
