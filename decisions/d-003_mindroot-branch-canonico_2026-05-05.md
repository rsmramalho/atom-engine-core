---
id: d-003
title: MindRoot — branch canônico consolidado em master
date: 2026-05-05
status: accepted
authors: [rick, arca]
related:
  - law/system_spec_genesis_v5-0-4.md
  - mindroot/roadmap.md
supersedes: null
superseded_by: null
---

# d-003 — MindRoot: branch canônico consolidado em `master`

## Contexto

Em sessão de manhã do dia 05 Mai 2026, ao retomar trabalho no Atom após pausa, foi descoberto que o estado dos repos do MindRoot estava em **deriva acumulada** desde início de Abril:

- **2 repos GitHub paralelos** com nomes confusos:
  - `rsmramalho/mindroot` (fossilizado em `784ee7f` de 04 Abr)
  - `rsmramalho/mindroot-v2` (ativo, 3 branches: master, ui-v2, atom-os-dashboard)
- **3 projetos Vercel** com configuração inconsistente:
  - `mindroot` → domain `www.mindroot.com.au` → repo `rsmramalho/mindroot` (deploy fossilizado)
  - `mindroot-v2` → domain `mindroot-v2.vercel.app` → repo `rsmramalho/mindroot-v2`, branch `master` (ativo)
  - `mind-mate-v2` → fora de escopo
- **Branch `ui-v2`** estava sendo tratado como canônico em memória (deste agente e do Cockpit), mas:
  - Nunca recebeu F1 Raiz nem F2 Conectores
  - Linha paralela de refatoração (phases 0-5, fsm.ts Genesis, ROADMAP v7) que parou no meio
  - Tinha 2 reset hard descartando trabalho (`fase 2 raizes` e `all pages from wireframes`)
- **Branch `master`** tem o app real funcional (F1 + F2 + all pages + ops/ layer)
- **Working tree** do clone local `C:\repos\mindroot` (apontando pra ui-v2) tinha:
  - 44 GB / 61.117 arquivos da pasta `_misc/` (Atlas, mockups, downloads pessoais) tracked
  - Arquivos órfãos (`ItemDetail.tsx`, `Library.tsx`) que vinham do master mas estavam untracked no ui-v2
  - Arquivo corrompido por colar comando errado no terminal

## Decisão

1. **Repo canônico:** `rsmramalho/mindroot-v2`
2. **Branch canônico:** `master` (HEAD `7b67e16a` em 05 Mai 2026)
3. **Deploy canônico:** `mindroot-v2.vercel.app` — domínio `mindroot.com.au` será reapontado pra esse projeto em sessão futura
4. **Repo `rsmramalho/mindroot`:** arquivado, read-only, histórico apenas
5. **Branch `ui-v2`:** preservado em `origin/ui-v2`. Não morre — vira fonte de cherry-picks futuros pra portar ao master peças com valor (fsm.ts Genesis-compliant, auto-triage engine, ROADMAP v7 PHI, schema reconciliation migration 007)
6. **Pasta `_misc/`:** removida do tracking, adicionada ao `.gitignore` do master, fisicamente movida pra `~/Downloads/_misc-from-mindroot-2026-05-05/` (intacta)
7. **Stack do master:** `npm` (não pnpm). A migração pnpm que aconteceu no ui-v2 será portada quando outros itens do ui-v2 forem.

## Consequências

### Imediatas
- `mindroot-v2.vercel.app` continua rodando como antes (master ativo, `f03bbcd` → `7b67e16a` após esta sessão)
- F1 + F2 funcionais localmente (build limpo, dev server destravado após remoção do `_misc/`)
- Backend Supabase intacto (tabela `user_connectors` com 1 row, edge functions `connector-auth`/`calendar-sync`/`gmail-sync` deployed)
- Repo enxuto: working tree desce de ~44 GB pra <1 GB

### Pendências geradas (sessões futuras)
- Reapontar domínio `mindroot.com.au` do projeto Vercel `mindroot` (fossilizado) pro projeto `mindroot-v2` (ativo)
- Arquivar repo `rsmramalho/mindroot` no GitHub (settings → archive) — feito em 05 Mai 2026 logo após esse commit
- Cherry-pick seletivo do `ui-v2` pro `master` quando o trabalho técnico for prioridade:
  - `cf4bc37f` — fsm.ts Genesis compliance
  - `784ee7f7` — auto-triage engine with confidence scoring
  - `4e62b08b` — migration 007 schema v2 reconciliation
  - `b8f2f1be` — pnpm migration
  - `33a01fec` — ROADMAP v7 PHI template
- Atualizar memória do Arca pra refletir master canônico (já feito nesta sessão)
- Atualizar Cockpit pra mesma referência

## Causas raiz da deriva (registro pra não repetir)

1. **Dois projetos Vercel apontando pro mesmo repo com production branches diferentes** (`master` e `main`). Configuração que cria fork operacional sem aviso.
2. **Renomeação de repo** (`mindroot` → `mindroot-v2`) sem migração formal: ambos repos coexistiram, um virou cemitério, outro virou ativo, mas nada documentado.
3. **Refatoração ambiciosa do ui-v2** (phases 0-5 reescrevendo o app) sem critério de "quando ele substitui o master". Trabalho paralelo sem ponto de convergência.
4. **Memória do agente cristalizou estado intencionado em vez de estado real:** "ui-v2 é canônico" era a intenção da migração, não o fato. Falha de Arca em validar memória contra realidade quando volta de pausa longa.
5. **Pasta `_misc/` deixada in-tree** no master — quando foi limpa no ui-v2 (commit `e2baa90f`), a fix não foi portada pra master.

## Snapshots de segurança gerados na sessão

Preservados em `C:\repos\` (fora do repo, fora do gitignore):
- `snapshot-status-2026-05-05.txt` (1.270 bytes) — estado git do ui-v2 antes da migração
- `snapshot-diff-2026-05-05.txt` (20.390 bytes) — diff de tudo modificado no ui-v2
- `snapshot-untracked-2026-05-05.txt` (500 bytes) — lista de untracked do ui-v2

Stash preservado: `stash@{0}` no repo (ui-v2 working tree pre-master switch).

## Referências

- Genesis v5.0.4, Parte 8.1 (source of truth) e Parte 12 (fronteira Genesis vs Marco Zero)
- Wrap dessa sessão: `wraps/system_wrap_2026-05-05_mindroot-consolidacao.md`
