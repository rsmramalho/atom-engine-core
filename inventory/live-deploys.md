# Live Deploys — Inventário

**Versão:** 1.0
**Data:** 2026-05-13
**Status:** Active (atualizar a cada deploy novo ou mudança de estado)
**Origem:** consolidação do Project "Macro Vision" no Claude.ai

> Inventário canônico de todos os deploys vivos do ecossistema. Quando um deploy mudar de status (novo / pausado / morto), atualizar aqui em primeiro lugar.

---

## Domínios canônicos

Cinco domínios confirmados, todos vivos:

| Domínio | Propósito | Status |
|---|---|---|
| `ramalho.au` | Pessoal — propósito ainda não definido | parked |
| `yugar.com` | Yugar Commons (futuro) | parked |
| `atlasframes.com.au` | Atlas Frames (empresa) | active |
| `muda.com.au` | Muda (caridade futura) | parked |
| `constellationos.com.au` | Constellation OS (landing) | active |

E adicionais identificados:

| Domínio | Propósito | Status |
|---|---|---|
| `mindroot.com.au` | App Atom (codename MindRoot) | active (pendente repoint pós-mindroot-v2) |
| `atlasframes.com.au/expo` | Landing expo Atlas Frames | active |

---

## Deploys ativos

### App Atom (codename MindRoot)

| Campo | Valor |
|---|---|
| URL pública | `mindroot.com.au` |
| URL deploy | `mindroot-v2.vercel.app` |
| Repo | `github.com/rsmramalho/mindroot-v2` |
| Branch canônica | `master` (D-003) |
| Plataforma | Vercel |
| Backend | Supabase project `avvwjkzkzklloyfugzer` |
| Status | LIVE — Espiral 2 em andamento |
| Pendente | repoint do domínio `mindroot.com.au` para Vercel project `mindroot-v2` |

### Atlas Frames — Expo Landing Page

| Campo | Valor |
|---|---|
| URL pública | `atlasframes.com.au/expo` |
| Plataforma | WP Engine (install `atlasframes2`) |
| Stack | WordPress + Elementor (Canvas template) |
| Post ID | 1218 |
| Repo (legado) | `github.com/rsmramalho/atlas-frames-expo` |
| Form handler | Formspree endpoint `mojkaopg` → `expo@atlasframes.com.au` |
| Status | LIVE — Phase 1 fully deployed (Mar 2026) |

### Constellation OS — Landing institucional

| Campo | Valor |
|---|---|
| URL pública | `constellationos.com.au` |
| Plataforma | Netlify |
| Netlify project | `lovely-pika-afd166` |
| Deploy method | **manual only** — drag-and-drop pasta na zona de deploy (`app.netlify.com/projects/lovely-pika-afd166/deploys`). Upload automatizado bloqueado; API sem token acessível |
| DNS | nameservers no GoDaddy apontando `dns1.p01.nsone.net`–`dns4.p01.nsone.net` (Netlify) |
| Headline travada | *"Claude as the infrastructure. Not the feature."* |
| Email de contato | `rr@atlasframes.com.au` |
| Status | LIVE (v2) |

---

## Cuidados operacionais por plataforma

### Vercel (mindroot-v2)

- Stack React 19 + TypeScript + Vite + Tailwind + Supabase + TanStack Query + Zustand
- 6 edge functions deployed (`--no-verify-jwt`) via `deploy.sh`
- OAuth Google unificado (login = connect, Google Cloud project `mindroot-492323`)
- Migrations Supabase aplicadas manualmente no Dashboard

### WP Engine (atlasframes2)

- **Nunca** navegar direto pra `wp-admin` — WPS Hide Login ativo. Entrar via `my.wpengine.com/installs/atlasframes2` → "WP Admin"
- phpMyAdmin: `atlasframes2.phpmyadmin.wpengine.net` — queries com nome de DB completo (`UPDATE wp_atlasframes2.wp_posts ...`)
- HTML grande (>50KB) não entra via textarea — usar REST API com chunks de 150KB
- CodeMirror no Customizer: acessar via DOM (`document.querySelectorAll('.CodeMirror')` + `.getValue()/.setValue()`)

### Netlify (constellationos)

- Sem automação de deploy. Sempre drag-and-drop pasta.
- Renomear arquivo HTML pra `index.html` antes de arrastar.
- Orbit animation original do `constellation-os-v2.html` é **intocável** — múltiplas tentativas de redesign falharam ao serializar. Reverter pro original sempre.
- Diagnóstico de fade-up animation invisível: IntersectionObserver não disparou — adicionar fallback `.visible` em 1s.
- Cloudflare email obfuscation quebra `mailto:` — remover script de decode, usar email limpo.

---

## Domínios parked (sem deploy)

- `ramalho.au` — propósito pessoal não definido
- `yugar.com` — Yugar Commons (concept, blocked em compra Mt Samson)
- `muda.com.au` — Muda (caridade futura, conceito)

Quando um desses for ativado, criar entrada em "Deploys ativos" e mover daqui.

---

## Decisões canônicas de deploy

1. **constellationos.com.au tagline é travada:** *"Claude as the infrastructure. Not the feature."* Rick rejeitou explicitamente alternativa SaaS genérica.
2. **Revenue da Atlas Frames é dado sensível** — não publicar em deploys públicos. Métricas finais do case study: *Est. 2019 · 8 Dimensions · QLD* (sem dado financeiro).
3. **Atlas Frames como case study fundador** ("Live in Production") em constellationos.com.au — single empresa, não confundir com "4 entities" do ecossistema.
4. **MindRoot como produto:** nunca descrever como "lançado e validado" em comunicação pública — tem status de release mas não foi lançado publicamente.

---

*Atualizar a cada mudança. Deploys mortos vão para `inventory/dead-deploys.md` (quando existir).*
