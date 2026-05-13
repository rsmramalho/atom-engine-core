---
id: d-009
title: Estratégia de repos pós-Onda 1 e protocolo de extração Onda 3
type: decision
status: accepted
date: 2026-05-13
refines: [d-007, d-008]
connections:
  - relation: references
    target: plan-v1
  - relation: references
    target: Identidade v1.3
  - relation: references
    target: D-004
tags: [#system, #migration, #topology, #repos, #onda-1]
---

# D-009 — Estratégia de repos pós-Onda 1 e protocolo de extração Onda 3

## Contexto

D-008 (13 Mai 2026) fechou a Onda 0 com 4 decisões estruturais e destrancou a Onda 1. A sessão Marco 0 imediatamente seguinte processou 14 self-extracts de Projects Claude.ai (15 esperados; 2 sensíveis ficam manuais; Anthropic absorvido como KB-twin da Macro Vision; Rob super absorvido como sub-frente da Atlas Frames). Cruzou o inventário com `gh repo list rsmramalho` (44 repos, 9 ativos não-archived).

O cruzamento revelou três gaps estruturais:

1. Cluster **Constellation** (System + OS) **não tem repo GitHub** — código atual vive local em `C:\Users\rsmra\Downloads\Apps\constellation-os-package\constellation-os`.
2. Cluster **Atlas Frames empresa** tem apenas `atlas-frames-expo` (archived, dev early). O resto do conteúdo (CLAUDE.md, brand tokens, diagnóstico Constellation cross-ref) não tem destino formal.
3. **Onda 3** (6 Projects a arquivar) carrega conteúdo metodológico vivo que precisa ser preservado antes do arquivamento, não duplicado nem perdido.

Esta decisão fecha esses gaps e define a sequência de execução da Onda 1.

---

## Decisão

### 1. Cluster Constellation — repo novo monorepo

Criar `rsmramalho/constellation-os` como monorepo:

```
constellation-os/
├── methodology/        # ex-Project "Constellation System" (#4)
│                       # templates V1-V8 BUILD + SYS, achados M1-M50
├── app/                # ex-Project "Constellation OS" (#8)
│                       # React+TypeScript+Vite+Tailwind+Zustand+Supabase
├── case-studies/
│   └── atlas-frames/   # extraído do Project "Atlas Frames Ecossistema" (#3)
│                       # diagnóstico 43/100, V1-V8 builds reais
└── decisions/          # ADRs internos do produto Constellation
```

**Regra de split:** monorepo agora; split em `constellation-system` + `constellation-os` só quando houver ≥3 estrelas externas (consistente com D-008 "Constellation = frente transversal, revisita quando ≥3 casos").

### 2. Cluster Atlas Atom — sem mudança estrutural

Repo `rsmramalho/atlas-atom` (PRIVATE) já existe e está canônico. Workshop Shed Container (#15) já está absorvido. Skill `atlas-atom-3d` já vive lá. Ação manual única remanescente: remover a duplicata da skill do Project Atlas Frames Expo no painel claude.ai (não é Claude Code).

**Pendência interna do cluster (não bloqueia D-009):** reconciliar ADR-020 vs ADR-026 vs ADR-028 (3 propostas paralelas de connector system). Fica como sessão própria do Project Atlas Atom.

### 3. Cluster Atlas Frames empresa — `atom-engine-core/ventures/atlas-frames/`

Não criar repo dedicado. Atlas Frames empresa não tem perfil de venture digital open-source (diferente de Atlas Atom). O conteúdo vivo cabe em `atom-engine-core/ventures/atlas-frames/`:

```
atom-engine-core/ventures/atlas-frames/
├── README.md           # síntese: empresa, stack, Phase 1 done, Phase 2/3 dormentes
├── brand-tokens.md     # navy #0d1f3c · gold #f0b429 · red #c0392b · Barlow
├── operations/
│   ├── wp-engine.md    # acesso my.wpengine.com/installs/atlasframes2 → WP Admin
│   ├── phpmyadmin.md   # convenções de SQL com schema fully-qualified
│   └── chunked-html.md # pipeline de HTML injection 150KB chunks via REST API
└── deploys/
    └── expo.md         # atlasframes.com.au/expo (post ID 1218) + Formspree mojkaopg
```

Repo `atlas-frames-expo` archived permanece como histórico — não unarchive, não rename.

### 4. Mt Samson (Onda 2) — split de KB, sem repo

Project "1874 Mount Samson" (#9) divide em duas direções:

- **Família, terra, Fase 2 subdivisão (Rick/Fernanda/Julia)** → KB **Espiral Pessoal** (`law/espiral-pessoal_v1-0.md` já existe; conteúdo vai pra `kb/`)
- **Yugar Commons venture, slot model $1M, ROI 11.7-22.5%, Atlas contribui $70k/ano** → KB **Espiral do Trabalho V4** (`law/espiral-do-trabalho_v1-0.md` já existe; conteúdo vai pra `kb/`)

Sem repo GitHub. Conteúdo é operacional, não código.

### 5. Onda 3 — extração antes de arquivar

6 Projects vão dormir, mas o conteúdo metodológico vivo sai antes para `atom-engine-core/`:

| Project (Onda 3) | Conteúdo a extrair | Destino |
|------------------|---------------------|---------|
| #14 Atom Drive | CLAUDE.md (WSL2 + MCP google-docs + Obsidian pattern) | `agents/claude-code-setup.md` |
| #14 Atom Drive | 6 modules schema (mod-body/mind/family/work/purpose/bridge) | conferir overlap com Atom Engine — já vive lá; só anotar fonte histórica |
| #12 Ramalho OS | Manual de Conduta v0.1 (working patterns Rick × Claude) | `methodology/working-with-claude.md` |
| #11 Atom Engine 4.0 | brand-manual-interactive.html, triangle-satellite.html, mindroot logos | `identity/historical/` |
| #11 Atom Engine 4.0 | spec abas A.1-A.13 e B.1-B.13 do Google Doc original | só registrar pointer em `inventory/historical-docs.md` |
| #6 Atom Claude (= MindRoot v1) | 10 regras técnicas (named exports, AtomItem fields, etc) | conferir overlap com `mindroot-v2/CLAUDE.md`; descartar duplicatas |
| #10 MindMate (= MindMate Tag V1) | Universal Cards UX pattern + Soul Layer triad | `mindroot-v2/docs/history/mindmate-ux-concept.md` |
| #2 Macro Vision | landing pages live (constellation-os.html Netlify, etc) | só registrar URLs em `inventory/live-deploys.md` |

Após extração: Projects ficam dormentes no painel claude.ai (não deletar). D-007 §arquivados atualiza com referência cruzada aos destinos finais.

### 6. PHI-TIME — universal, mora no Atom Engine

PHI-TIME-SPEC-v1.md (vive em #3 Atlas Frames Ecossistema) é módulo universal extraível (`@rsm/phi-time`). Destino: `atom-engine-core/specs/cosmic/phi-time-v2.md` (a versão v2 do Constellation OS #8 é mais recente — usar essa).

Não vai pro `constellation-os` (cluster) porque é universal, não específico do Constellation. Constellation OS consome via dependência futura.

### 7. Gaps registrados (sem ação imediata)

- **Mistico** (repo `rsmramalho/Mistico`, PUBLIC, 06/04/2026) — app Caligrafia da Alma, pessoal por natureza. Dev arquitetural em Marco 0; uso pessoal em Espiral Pessoal. Não migra — não é Project Claude. Análogo a MindRoot mas pessoal-only.
- **E** (repo `rsmramalho/E`, PUBLIC, 04/04/2026) — provavelmente Project E. PUBLIC fere o princípio "O Espaço Entre standalone sem touchpoint" (D-007). Anotado, sem ação automática.
- **atom-agent** (repo `rsmramalho/atom-agent`, PUBLIC, 05/04/2026) — *"Physical arm of Atom — scanner/classifier"*. Provavelmente implementação da boca Agent/Filesystem (4 bocas universais do Engine OS). Standalone, sem Project Claude associado. Fica como está.
- **memory-extraction** (repo `rsmramalho/memory-extraction`, PUBLIC, 03/04/2026) — util de algoritmo Fibonacci. Standalone, sem Project Claude.
- **Reconciliação ADR-020/026/028 do Atlas Atom** — pendência interna do cluster, sessão própria.

---

## Consequências

### Destranca

- Ordem de execução Onda 1 fica clara: Step 2 (este commit) → Step 3 (Onda 3 extração) → Step 4 (cria constellation-os, importa #4 e #8) → Step 5 (ventures/atlas-frames/) → Step 6 (Mt Samson split via Cowork) → Step 7 (Projects Onda 3 marcados dormentes manualmente).
- D-007 §arquivados ganha referência cruzada aos destinos pós-extração (job próprio depois).
- plan-v1 v1.1 → v1.2 com seção §10 "Repos standalone do ecossistema" (atom-engine-core, mindroot-v2, atlas-atom, constellation-os novo, Mistico, atom-agent, memory-extraction, E, lovable-archive, rsmramalho profile) — job próprio depois.

### Trade-offs aceitos

- Monorepo `constellation-os` cria acoplamento entre metodologia e código que terá que ser desfeito quando der split. Aceito porque ≥3 estrelas externas ainda é cenário futuro, e overhead de 2 repos coordenados agora é maior que o overhead do split depois.
- `ventures/atlas-frames/` mistura conteúdo de venture com infraestrutura do Atom Engine no mesmo repo. Aceito porque (a) Atlas Frames empresa não tem perfil open-source pra justificar repo próprio, (b) consistente com padrão "venture embrionária → atom-engine-core/ventures/".

### Aberturas remanescentes

- Critério de criação de Project Claude.ai novo (vs AtomItem dentro de Espiral existente) — pode virar D-010 separado, ou fica como rule prática na memória.
- Reconciliação connector system Atlas Atom — sessão própria do cluster.

---

## Referências

- D-004 (atom-engine-core, commit `100fa4d`) — Atom como produto único + Marketplace
- D-007 — Source of truth = 3 lugares
- D-008 (atom-engine-core, branch principal, 13 Mai 2026) — Onda 0 fechada
- plan-v1 v1.1 — migration/plan-v1.md
- Identidade v1.3 — law/system_spec_atom-identidade_v1-3.md
- ecosystem-agents v1.2 (commit `c14a5bd`)
- Sessão Marco 0 de processamento dos 14 self-extracts (chat Claude.ai 13 Mai 2026)

---

*"De dentro pra fora — sempre."*
