-- Harbour Walks (fictional): each user's saved trails. Row-level security keeps every row private to its owner.
create table public.saved_trails (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  trail_name text not null,
  saved_at timestamptz not null default now()
);
alter table public.saved_trails enable row level security;
create policy "owners read their saved trails" on public.saved_trails for select using (auth.uid() = user_id);
create policy "owners add their saved trails" on public.saved_trails for insert with check (auth.uid() = user_id);
create policy "owners remove their saved trails" on public.saved_trails for delete using (auth.uid() = user_id);
