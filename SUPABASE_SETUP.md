# 贪吃蛇+ 排行榜设置指南

游戏已集成 Supabase 排行榜功能，只需 3 步即可启用：

## 第1步：创建 Supabase 项目

1. 打开 [supabase.com](https://supabase.com) 并注册/登录
2. 点击 **New project**
3. 填写项目名称（如 `snake-game`）
4. 设置数据库密码（记住它）
5. 选择离你最近的区域（如 Singapore）
6. 点击 **Create new project**（等待 1-2 分钟）

## 第2步：运行建表脚本

1. 项目创建完成后，进入 **SQL Editor**
2. 打开 `supabase-setup.sql` 文件，把全部内容复制进去
3. 点击 **Run** 执行

## 第3步：复制密钥到代码

1. 在 Supabase 项目仪表盘，进入 **Settings → API**
2. 找到 **Project URL**（类似 `https://xxxxx.supabase.co`）
3. 找到 **anon public key**（以 `eyJ...` 开头）
4. 打开 `index.html`，找到这两行：

```javascript
const SUPABASE_URL = 'YOUR_SUPABASE_URL';
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
```

5. 替换成你的值，例如：

```javascript
const SUPABASE_URL = 'https://abcdefg.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
```

## 第4步（可选）：部署更新

将修改后的 `index.html` 和 `snake.html` 提交推送到 GitHub Pages：

```bash
git add index.html snake.html
git commit -m "feat: add Supabase leaderboard"
git push
```

## 说明

- 使用 Supabase **anon key** + **RLS 策略** 实现安全的公开读写
- 客户端做了 15 秒冷却限制，防止刷分
- 玩家名字存于浏览器 localStorage，下次自动填入
- 排行榜显示前 50 名，你自己的成绩高亮显示并标注排名
- 免费套餐包含 500MB 数据库，足够数万人使用