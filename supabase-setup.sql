-- Run this in: Supabase Dashboard → SQL Editor → New query

-- 1. Create the table
CREATE TABLE public.user_data (
  id          uuid        DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id     uuid        REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  key         text        NOT NULL,
  value       jsonb       NOT NULL,
  updated_at  timestamptz DEFAULT now(),
  UNIQUE (user_id, key)
);

-- 2. Enable Row Level Security (users can only see their own rows)
ALTER TABLE public.user_data ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users manage own data"
  ON public.user_data
  FOR ALL
  USING  (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Done. Now go to Settings → API to copy your URL and anon key into index.html
