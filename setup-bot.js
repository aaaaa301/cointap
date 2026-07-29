const https = require('https');

// ========== 填你的 Bot Token ==========
// 从 @BotFather 获取，格式：123456:ABC-DEF...
const BOT_TOKEN = process.env.BOT_TOKEN;

const GAME_URL = 'https://2dcd1a73-222.1415008606.workers.dev/';

if (!BOT_TOKEN) {
  console.log('❌ 请先设置 BOT_TOKEN 环境变量');
  console.log('   BOT_TOKEN=你的token node setup-bot.js');
  process.exit(1);
}

function api(method, body) {
  return new Promise((resolve, reject) => {
    const data = JSON.stringify(body);
    const req = https.request({
      hostname: 'api.telegram.org',
      path: `/bot${BOT_TOKEN}/${method}`,
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(data),
      },
    }, (res) => {
      let out = '';
      res.on('data', c => out += c);
      res.on('end', () => resolve(JSON.parse(out)));
    });
    req.on('error', reject);
    req.write(data);
    req.end();
  });
}

(async () => {
  // ① 设置底部菜单按钮（= @BotFather Menu Button）
  const r1 = await api('setChatMenuButton', {
    menu_button: {
      type: 'web_app',
      text: '🪙 开始挖币',
      web_app: { url: GAME_URL },
    },
  });
  console.log('① 菜单按钮:', r1.ok ? '✅' : '❌', r1.description || '');

  // ② 设置命令列表（显示在输入框 / 菜单里）
  const r2 = await api('setMyCommands', {
    commands: [
      { command: 'start', description: '🪙 开始挖币' },
      { command: 'play',  description: '🎮 打开游戏' },
      { command: 'help',  description: '❓ 帮助' },
    ],
  });
  console.log('② 命令列表:', r2.ok ? '✅' : '❌', r2.description || '');

  // ③ 设置 Bot 简介
  const r3 = await api('setMyDescription', {
    description: '🪙 CoinTap - 点击挖币 Telegram 小游戏！疯狂点击金币赚积分，升级加成，完成每日任务赢大奖！',
  });
  console.log('③ Bot简介:', r3.ok ? '✅' : '❌', r3.description || '');

  // ④ 设置 Bot 短简介
  const r4 = await api('setMyShortDescription', {
    short_description: '🪙 点击挖币！升级、任务、签到，越点越富有！',
  });
  console.log('④ 短简介:', r4.ok ? '✅' : '❌', r4.description || '');

  console.log('\n🎉 配置完成！');
  console.log('   直接链接: https://t.me/Gameapptv_bot/app');
  console.log('   用户打开 Bot 就能看到菜单按钮和 /start /play 命令');
})();
