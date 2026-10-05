-- Fix found by ShipSure: favourites held each person's saved trails with no Row Level Security.
alter table public.favourites enable row level security;
create policy favourites_own on public.favourites for all to authenticated
  using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
