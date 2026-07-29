#!/bin/bash
# CoinTap Bot 一键配置
# 用法: bash setup-bot.sh

TOKEN="8960386191:AAGmjPcQxBeT2IZLInSKlEZFPqRUm56MSOY"
URL="https://2dcd1a73-222.1415008606.workers.dev/"

echo "=== CoinTap Bot 配置 ==="

# ① 设置菜单按钮
echo ""
echo "① 设置菜单按钮..."
curl -s -X POST "https://api.telegram.org/bot${TOKEN}/setChatMenuButton" \
  -H "Content-Type: application/json" \
  -d "{\"menu_button\":{\"type\":\"web_app\",\"text\":\"🪙 开始挖币\",\"web_app\":{\"url\":\"${URL}\"}}}"

# ② 设置命令
echo ""
echo ""
echo "② 设置命令列表..."
curl -s -X POST "https://api.telegram.org/bot${TOKEN}/setMyCommands" \
  -H "Content-Type: application/json" \
  -d "{\"commands\":[{\"command\":\"start\",\"description\":\"🪙 开始挖币\"},{\"command\":\"play\",\"description\":\"🎮 打开游戏\"},{\"command\":\"help\",\"description\":\"❓ 帮助\"}]}"

# ③ 设置简介
echo ""
echo ""
echo "③ 设置 Bot 简介..."
curl -s -X POST "https://api.telegram.org/bot${TOKEN}/setMyDescription" \
  -H "Content-Type: application/json" \
  -d "{\"description\":\"🪙 CoinTap - 点击挖币 Telegram 小游戏！疯狂点击金币赚积分，升级加成，完成每日任务赢大奖！\"}"

echo ""
echo ""
echo "✅ 全部完成！"
echo "   游戏直链: https://t.me/Gameapptv_bot/app"
