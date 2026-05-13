---
type: wrap
date: 2026-05-13
session: onda1-fechamento
agents: [arca, claude-code]
duration_estimate: longa
---

# Wrap — Onda 1 fechamento

## Contexto

Sessão fechando Onda 1 do plan-v1. Cobre D-008 (Onda 0 já fechada antes desta sessão) + D-009 + D-010 + D-011 commitadas, Step 3 parcial (4/6), Step 4a scaffold de `constellation-os`, Step 6 orientado para execução futura.

Nota: Step 7 (cleanup do inventário + bump plan v1.1 → v1.2) foi abortado nesta sessão por divergência estrutural detectada no plan-v1 (usa Ondas, não Steps). Plan-v1 permanece v1.1. Cleanup do inventário fica para sessão futura.

## Decisões commitadas (cronológico)

| Decisão | Commit | O que faz |
|---|---|---|
| D-008 | (commit anterior) | Onda 0 fechada; Constellation = frente metodológica transversal a revisitar quando ≥3 casos |
| D-009 | `0fd217f` | estratégia repos pós-Onda 1 (madura → standalone; embrionária → `ventures/`) |
| D-010 | `667f898` | protocolo criação Projects + `inventory/projects.md` + 3 templates de hub |
| D-011 | (este commit) | migração on-demand de conteúdo legado |

## Extrações Step 3 (4/6)

### Batch A — atom-engine-core (`ebd05b7`)

| Origem (Project Claude) | Destino |
|---|---|
| Atom Drive | `agents/claude-code-setup.md` |
| Atom Engine 4.0 | `identity/historical/atom-engine-4-0-brand-evolution.md` |
| Macro Vision | `inventory/live-deploys.md` |

### Batch B — mindroot-v2 (`2af5bbb4`)

| Origem | Destino |
|---|---|
| MindMate | `docs/history/mindmate-tag-v1-ux.md` |

### Pendentes (2/6) — job-step3-extra on-demand

- **Ramalho OS** → `methodology/working-with-claude.md` (atom-engine-core). Trigger: Rick gerar self-extract.
- **Atom Claude (=MindRoot v1)** → overlap check vs `mindroot-v2/CLAUDE.md`. Trigger: Rick gerar self-extract; análise determina se merge, arquivo separado, ou descarte.

## Step 4 — Cluster Constellation

### 4a (feito, `9bfac63`)

Repo `rsmramalho/constellation-os` PRIVATE criado via `gh repo create`. Estrutura monorepo: `methodology/` + `app/` + `case-studies/atlas-frames/` + `decisions/`. 15 arquivos (READMEs, LICENSE proprietary, CLAUDE.md, .gitignore com exceção `!methodology/build/` per catch do Claude Code, D-001 fundadora, template ADR).

### 4b/4c/4d — on-demand (D-011)

Saem do plan ativo. Triggers:
- 4b methodology → caso #2 aparece
- 4c app → desenvolvimento do app retomado
- 4d case-study Atlas Frames → Phase 3 reaberta (~Abr 2026) ou trabalho operacional pede

## Step 5 — Cluster Atlas Frames empresa

Adiado. Scaffold quando trigger D-009 chegar (trabalho operacional concreto demanda repo standalone).

## Step 6 — Mt Samson split (orientação documentada)

Project Claude "1874 Mount Samson" é híbrido: contém conteúdo família + conteúdo venture (Yugar Commons). Split necessário antes de arquivar. Execução fica para sessão futura.

### Mapeamento de conteúdo

#### Família → Espiral Pessoal (Project Claude a criar)
- Estrutura de propriedade (Rick 29.25%, Fernanda 29.25%, Julia 12.5%, Robson 29%)
- Dinâmica entre co-proprietários
- Casa principal (vida doméstica, manutenção)
- Crianças (Bella, Ben — homeschool futuro)
- Relação Rick/Fernanda (separação, mudança)
- Plano financeiro pessoal (NÃO o financeiro da venture)

#### Venture → `atom-engine-core/ventures/yugar-commons/` (per D-009; embrionária — blocked em Daniel)

> Nota: memória/plan-v1.1 sinalizava "→ KB Espiral Trabalho V4". Após D-009, destino canônico é `ventures/yugar-commons/` (embrionária dentro de atom-engine-core); Espiral Trabalho V4 referencia esse path quando o Project for criado.

- Subdivisão jurídica (Cenário B Freehold + easement, decisões Fev 2026)
- Plano financeiro Yugar Commons (4 slots × $250k, split Airbnb 70/30, ROI projeções)
- Modelo de negócio (Co-op DIY Permacultura, 4 Airbnbs + oficina hub + 1 caridade/ano)
- Manifesto, 6 pilares, conteúdo Yugar Commons
- Mapa de grants (Our Healthy Environments MBRC, QRIDA Rural, etc.)
- Status: blocked em compra Mt Samson (Daniel)

### Execução prevista

Sessão futura quando Rick tiver janela:
1. Criar Project Claude "Espiral Pessoal" usando `templates/projects/template_project_espiral-pessoal.md`
2. Popular Espiral Pessoal com conteúdo família via Cowork (ou manualmente)
3. Criar `atom-engine-core/ventures/yugar-commons/` com conteúdo venture (sub-job pro Claude Code)
4. Marcar Project Claude "1874 Mount Samson" como archived no inventory
5. (Opcional) Drag-and-drop dos arquivos originais para `_archive/projects/1874-mount-samson/` para histórico

## Cleanup (Step 7) — adiado

Não executado nesta sessão. Pendente para sessão futura:
- `inventory/projects.md` — atualizar status: Atom Drive, Atom Engine 4.0, Macro Vision, MindMate → archived; Constellation System → scaffold-done; 1874 Mount Samson → split-pending; Ramalho OS, Atom Claude → dormant (com notas e commit hashes)
- `plan-v1` — decisão pendente sobre bump v1.1 → v1.2 e como integrar nomenclatura "Steps" do job atual com "Ondas" do plan-v1 v1.1 atual (divergência estrutural detectada)
- `decisions/_template.md` — criar template canônico se a convenção for formalizada (atualmente ADRs seguem pattern ad-hoc)

## Estado do sistema pós-sessão

### Commits gerados (cronológico)
- `0fd217f` — D-009
- `667f898` — D-010 + inventory + templates
- `ebd05b7` — Step 3 batch A (3 files atom-engine-core)
- `2af5bbb4` — Step 3 batch B (1 file mindroot-v2)
- `9bfac63` — Step 4a scaffold constellation-os
- (este commit) — D-011 + wrap

### Repos
- `atom-engine-core` (main) — HEAD atualizado com D-011 + wrap
- `mindroot-v2` (master) — HEAD `2af5bbb4`
- `constellation-os` (main) — HEAD `9bfac63` (scaffold)
- `atlas-atom`, `Mistico` — inalterados

### Plan-v1
Permanece v1.1. Onda 1 fechada operacionalmente neste commit (D-011 + wrap) mas sem bump de versão no documento — a reconciliação Steps↔Ondas fica para sessão futura. Steps adiados (4b/4c/4d/5) viraram on-demand triggers via D-011.

## Aprendizados

- **Catch da semântica vs convention** (`.gitignore build/` vs `methodology/build/`): Claude Code identificou conflito antes do commit do 4a. Vale adicionar como nota futura em `constellation-os/CLAUDE.md`.
- **"Estamos overdoing?" é pergunta válida e produtiva.** A franqueza meio-sessão (D-011 nasceu daí) economizou trabalho significativo (4b/4c/4d evitados).
- **Self-extract via prompt no Project Claude** é canal viável para snapshots (instructions+KB+decisions+digests). Para conteúdo integral, alternativas: download manual, Chrome ext Project Downloader.
- **Sub-jobs cirúrgicos com conteúdo inline** funcionam bem como handoff Arca → Claude Code (validado em Step 3 e 4a).
- **Reportar divergência > improvisar edição.** Step 7 abortado em vez de improvisar mapping Steps↔Ondas no plan-v1 — preserva integridade da spec até decisão consciente.

## Próximos triggers naturais

- **MindRoot Espiral 2:** F2 timezone UTC→Brisbane, auth lock spam (useRef guard), 6 UI bugs mobile, F3 15→19, F4 7→9
- **Identidade v1.3 downstream:** ATOM.md, PENTAGON.md, mindroot-v2 (UI/copy/manifest), system prompt Project Atom v2
- **mindroot.com.au repoint:** apontar para Vercel project `mindroot-v2`
- **Cherry-picks de `ui-v2`:** fsm.ts Genesis (`cf4bc37f`), auto-triage (`784ee7f7`), ROADMAP v7 (`33a01fec`)
- **Step 3-extra:** Ramalho OS + Atom Claude v1 (quando self-extracts disponíveis)
- **Step 6 execução:** Mt Samson split (quando Rick tiver janela)
- **Step 7 cleanup:** inventory update + plan-v1 bump (quando reconciliação Steps↔Ondas for decidida)
- **Constellation methodology migration:** quando caso #2 aparecer

## Referências

- plan-v1 v1.1 (sem bump nesta sessão) — `migration/plan-v1.md`
- D-008, D-009, D-010, D-011 — `decisions/`
- Commits acima
- `templates/projects/` (D-010) — 3 templates Marco-0/Espiral-trabalho/Espiral-pessoal
