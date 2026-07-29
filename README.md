# 🪙 CoinTap - Telegram Tap-to-Earn 迷你游戏

点击金币赚积分，升级加成，完成每日任务！Telegram Mini App 小游戏。

---

## 游戏功能

| 功能 | 说明 |
|------|------|
| 🪙 点击挖币 | 点击中央金币获取积分，带飘字和粒子动画 |
| ⚡ 能量系统 | 能量上限、消耗、自动回复 |
| 🚀 升级商店 | 连击加成、能量上限、回复速度三大升级线 |
| 📋 每日任务 | 点击数、收入、购买升级等任务领奖励 |
| 🎁 每日签到 | 7 天签到奖励递增 |
| 🏆 等级系统 | 累计收入晋升，Lv 标识 |
| 📤 分享成绩 | 一键分享到 Telegram 聊天 |
| 🌓 主题适配 | 自动跟随 Telegram / 系统深色模式 |
| 📳 触感反馈 | Telegram 内点击震动反馈 |

---

## 🚀 上线步骤

### 第 1 步：部署到 HTTPS 服务器

Telegram Mini App 要求 HTTPS。推荐以下免费方案：

#### 方案 A：Cloudflare Pages（推荐，最简单）

1. 把 `tg-tap-game/` 目录推到一个 GitHub 仓库
2. 打开 [Cloudflare Dashboard](https://dash.cloudflare.com/) → Workers & Pages
3. Create → Pages → Connect to Git
4. 选择仓库，构建配置留空（纯静态 HTML）
5. 部署后会得到 `https://你的项目.pages.dev`

#### 方案 B：Vercel

1. `npm i -g vercel`
2. 在 `tg-tap-game/` 目录执行 `vercel`
3. 部署后会得到 `https://你的项目.vercel.app`

#### 方案 C： Railway / Render 等

直接部署 `tg-tap-game/` 目录为静态站点即可。

---

### 第 2 步：创建 Telegram Bot

1. 在 Telegram 搜索 **@BotFather**
2. 发送 `/newbot`，按提示设置 bot 名称和用户名
3. 记录返回的 **Bot Token**（格式：`123456:ABC-DEF1234gh...`）

### 第 3 步：注册 Mini App

1. 在 @BotFather 中发送 `/mybots`
2. 选择刚创建的 Bot → **Bot Settings** → **Menu Button**
3. 选择 **Configure menu button**
4. 填入第 1 步部署好的 **HTTPS URL**
5. 设置按钮文字，例如「🪙 开始挖币」

### 第 4 步：测试

1. 在 Telegram 打开你的 Bot
2. 点击底部菜单按钮进入小游戏
3. 疯狂点击金币！

---

## 💻 本地开发

```bash
# 进入项目目录
cd tg-tap-game

# 启动本地服务器
node server.js

# 浏览器打开 http://localhost:3000 调试 UI
```

> ⚠ 本地开发时 Telegram API 不可用（会降级为纯浏览器模式），功能不受影响。
> 触感反馈、主题色同步、CloudStorage 等功能需在真实 Telegram 内测试。

---

## 📁 文件结构

```
tg-tap-game/
├── index.html      # 游戏主文件（全部逻辑在里面）
├── server.js       # 本地开发服务器
├── package.json    # 项目配置
└── README.md       # 本文件
```

---

## 🛠 定制开发

游戏是单个自包含 HTML 文件，直接改 `index.html` 即可。

- 数值调整 → 搜 `DEFAULT_STATE`、`BOOSTS`、`TASKS`、`DAILY_REWARDS`
- 主题色 → 搜 `--tg-accent` CSS 变量
- 游戏名 / 文案 → 全文搜 `CoinTap`、`金币`
