# Today Tasks

To-do list responsive dengan kategori, date strip mingguan, dan sinkronisasi antar perangkat lewat Supabase.
Statis (HTML + CSS + JS), tanpa build step — cocok untuk Vercel.

## Setup Supabase (sekali saja)

1. Buat project di https://supabase.com (free tier cukup).
2. **SQL Editor → New query**, tempel isi `supabase/schema.sql`, klik **Run**.
3. **Project Settings → API**: salin *Project URL* dan *anon/publishable key* ke `config.js`.
4. **Authentication → URL Configuration**:
   - Site URL: `https://<nama-app>.vercel.app`
   - Redirect URLs: tambahkan `https://<nama-app>.vercel.app/**`

## Deploy ke Vercel

Import repo ini di https://vercel.com/new → Framework Preset **Other** → Deploy.
Setiap push ke `main` akan deploy otomatis.

## Catatan

- Login pakai magic link email (tanpa password).
- Anon key aman di frontend; data tiap user dilindungi Row Level Security.
- Tugas yang dulu tersimpan di localStorage browser akan dipindahkan otomatis ke akun saat login pertama.
- Email bawaan Supabase dibatasi beberapa email per jam. Untuk pemakaian pribadi ini cukup.
