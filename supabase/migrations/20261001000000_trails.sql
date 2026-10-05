-- Harbour Walks 1.1: trails and saved favourites (fictional demo app).
create table public.trails (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  km numeric not null,
  grade text not null
);
alter table public.trails enable row level security;
create policy trails_read on public.trails for select using (true);

create table public.favourites (
  user_id uuid not null references auth.users (id) on delete cascade,
  trail_id uuid not null references public.trails (id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (user_id, trail_id)
);
