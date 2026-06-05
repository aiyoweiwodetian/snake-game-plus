-- Supabase SQL 建表脚本 - 贪吃蛇排行榜
-- 在 Supabase SQL Editor 中运行此脚本

-- 创建成绩表
CREATE TABLE IF NOT EXISTS snake_scores (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  player_name TEXT NOT NULL,
  score INTEGER NOT NULL,
  combo INTEGER DEFAULT 0,
  lvl INTEGER DEFAULT 1,
  snake_length INTEGER DEFAULT 3,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 创建索引（按分数降序，同分按时间升序）
CREATE INDEX IF NOT EXISTS idx_snake_scores_score
  ON snake_scores (score DESC, created_at ASC);

-- 启用行级安全（RLS）
ALTER TABLE snake_scores ENABLE ROW LEVEL SECURITY;

-- 允许所有人读取（用于排行榜）
CREATE POLICY "允许公开读取"
  ON snake_scores FOR SELECT
  USING (true);

-- 允许所有人插入（前端使用 anon key 提交）
CREATE POLICY "允许公开插入"
  ON snake_scores FOR INSERT
  WITH CHECK (true);

-- （可选）限制每 IP 每分钟最多插入 10 条
-- 此策略需要在 Supabase 中启用 pg_net 扩展，或者使用应用层限制
-- 我们已在客户端做了 15 秒冷却限制