# Today Tasks

To-do list statis (HTML + CSS + JS, tanpa build step).

## Deploy ke Vercel

**Opsi 1 — Vercel CLI**
```bash
npm i -g vercel
cd today-tasks
vercel          # preview
vercel --prod   # production
```

**Opsi 2 — via GitHub**
1. Push folder ini ke repo GitHub baru.
2. Buka vercel.com/new → Import repo.
3. Framework Preset: **Other**, Build Command & Output Directory dikosongkan → Deploy.

Data disimpan di localStorage browser masing-masing.
