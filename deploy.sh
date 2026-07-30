#!/bin/bash
# 用法：./deploy.sh <來源HTML路徑> <目標子資料夾>
# 範例：./deploy.sh "/Users/kuanhoyun/Desktop/Rickey Claude/功能Review系統/滑動粒子特效_分析報告.html" feature-review

SRC="$1"
FOLDER="$2"

if [ -z "$SRC" ] || [ -z "$FOLDER" ]; then
  echo "用法：./deploy.sh <來源HTML路徑> <目標子資料夾>"
  exit 1
fi

DEST_DIR="$(dirname "$0")/$FOLDER"
mkdir -p "$DEST_DIR"
cp "$SRC" "$DEST_DIR/"

FILENAME=$(basename "$SRC")
cd "$(dirname "$0")"
git add .
git commit -m "update: $FILENAME $(date '+%Y-%m-%d %H:%M')"
git push

echo ""
echo "✅ 已部署：https://rickeykuanrickey.github.io/reports/$FOLDER/$FILENAME"
