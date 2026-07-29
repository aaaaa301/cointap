# CoinTap Bot 一键配置 - PowerShell 版
# 右键 → 使用 PowerShell 运行，或者在终端里粘贴执行

$TOKEN = "8960386191:AAGmjPcQxBeT2IZLInSKlEZFPqRUm56MSOY"
$URL   = "https://2dcd1a73-222.1415008606.workers.dev/"

Write-Host "=== CoinTap Bot 配置 ===" -ForegroundColor Cyan

# ① 菜单按钮
Write-Host ""
Write-Host "① 设置菜单按钮..." -ForegroundColor Yellow
$r1 = Invoke-RestMethod -Uri "https://api.telegram.org/bot$TOKEN/setChatMenuButton" `
  -Method Post -ContentType "application/json" `
  -Body "{`"menu_button`":{`"type`":`"web_app`",`"text`":`"🪙 开始挖币`",`"web_app`":{`"url`":`"$URL`"}}}"
Write-Host "  $($r1.description)"

# ② 命令列表
Write-Host ""
Write-Host "② 设置命令列表..." -ForegroundColor Yellow
$r2 = Invoke-RestMethod -Uri "https://api.telegram.org/bot$TOKEN/setMyCommands" `
  -Method Post -ContentType "application/json" `
  -Body '{`"commands`":[{`"command`":`"start`",`"description`":`"🪙 开始挖币`"},{`"command`":`"play`",`"description`":`"🎮 打开游戏`"},{`"command`":`"help`",`"description`":`"❓ 帮助`"}]}'
Write-Host "  $($r2.description)"

# ③ 简介
Write-Host ""
Write-Host "③ 设置 Bot 简介..." -ForegroundColor Yellow
$r3 = Invoke-RestMethod -Uri "https://api.telegram.org/bot$TOKEN/setMyDescription" `
  -Method Post -ContentType "application/json" `
  -Body '{`"description`":`"🪙 CoinTap - 点击挖币 Telegram 小游戏！疯狂点击金币赚积分，升级加成，完成每日任务赢大奖！`"}'
Write-Host "  $($r3.description)"

Write-Host ""
Write-Host "✅ 全部完成！游戏直链: https://t.me/Gameapptv_bot/app" -ForegroundColor Green
Write-Host ""
Read-Host "按回车退出"
