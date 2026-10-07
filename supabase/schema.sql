-- Today Tasks — jalankan sekali di Supabase: SQL Editor → New query → Run

create table if not exists public.categories (
  id         uuid primary key default gen_random_uuid(),
  user_id    uuid not null default auth.uid() references auth.users (id) on delete cascade,
  name       text not null check (char_length(name) between 1 and 24),
  color      text not null default '#E0683A',
  created_at timestamptz not null default now()
);

create table if not exists public.tasks (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null default auth.uid() references auth.users (id) on delete cascade,
  category_id uuid not null references public.categories (id) on delete cascade,
  text        text not null check (char_length(text) between 1 and 200),
  date        date not null default current_date,
  done        boolean not null default false,
  created_at  timestamptz not null default now()
);

create index if not exists tasks_user_date_idx on public.tasks (user_id, date);
create index if not exists categories_user_idx on public.categories (user_id);

-- Row Level Security: tiap user hanya bisa melihat & mengubah datanya sendiri
alter table public.categories enable row level security;
alter table public.tasks      enable row level security;

drop policy if exists "own categories" on public.categories;
create policy "own categories" on public.categories
  for all to authenticated
  using (user_id = (select auth.uid()))
  with check (user_id = (select auth.uid()));

drop policy if exists "own tasks" on public.tasks;
create policy "own tasks" on public.tasks
  for all to authenticated
  using (user_id = (select auth.uid()))
  with check (user_id = (select auth.uid()));
