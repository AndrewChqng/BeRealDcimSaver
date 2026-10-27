#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$SCRIPT_DIR/dist"

echo "[*] Building BeRealDcimSaver Xposed/LSPosed module with apktool..."
apktool b -f "$SCRIPT_DIR" -o "$SCRIPT_DIR/dist/unsigned.apk"

echo "[*] Zipaligning and signing APK..."
zipalign -f -p 4 "$SCRIPT_DIR/dist/unsigned.apk" "$SCRIPT_DIR/dist/aligned.apk"

KEYSTORE="$SCRIPT_DIR/dist/debug.keystore"
if [ ! -f "$KEYSTORE" ]; then
    keytool -genkeypair -v -keystore "$KEYSTORE" -storepass android -alias androiddebugkey \
        -keypass android -keyalg RSA -keysize 2048 -validity 10000 \
        -dname "CN=Android Debug,O=Android,C=US"
fi

apksigner sign --ks "$KEYSTORE" --ks-pass pass:android --key-pass pass:android \
    --out "$SCRIPT_DIR/dist/bereal-dcim-lsposed.apk" "$SCRIPT_DIR/dist/aligned.apk"

rm -f "$SCRIPT_DIR/dist/unsigned.apk" "$SCRIPT_DIR/dist/aligned.apk" "$KEYSTORE"
echo "[+] Done! Output APK:"
echo "    $SCRIPT_DIR/dist/bereal-dcim-lsposed.apk"
