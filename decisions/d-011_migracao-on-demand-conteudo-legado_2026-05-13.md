---
id: d-011
title: "Migração on-demand de conteúdo legado para repos novos"
status: accepted
date: 2026-05-13
decisor: Rick
supersedes: []
superseded_by: []
tags: [migration, on-demand, lean, repos-dormentes, scaffold]
---

# D-011 — Migração on-demand de conteúdo legado

## Contexto

D-008 (Onda 0) classificou Constellation como frente metodológica transversal a revisitar quando ≥3 casos validarem a methodology. Atlas Frames é caso #1. D-009 definiu estratégia de repos pós-Onda 1: "venture madura → repo próprio; embrionária → `atom-engine-core/ventures/`". D-010 criou protocolo de criação de Projects + inventory + 3 templates.

Faltava regra explícita sobre **quando** e **como** migrar conteúdo legado (KB files de Projects Claude, código em pastas locais, snapshots de Drive) para esses repos novos.

Durante a Onda 1 (Step 4a — scaffold de `constellation-os`, commit `9bfac63`), surgiu a tentação de migrar em bloco os 27 KB files de methodology + 9 do case study Atlas Frames + código embrionário do app. Avaliação franca em sessão revelou que isso seria "preservação prematura" — trabalho grande sem retorno imediato, congelando conteúdo num lugar diferente sem destravar nenhuma operação nova.

## Opções consideradas

### Opção A — Migração proativa em bloco
Ao criar um repo de frente em dormência, migrar todo conteúdo legado de uma vez (Projects Claude → repo).
- Prós:
  - Tudo num só lugar imediatamente
  - Não precisa decidir "o que migrar agora" no momento de cada toque
- Contras:
  - Trabalho grande sem retorno imediato (frente dormente = pouco uso ativo)
  - Conteúdo congela em formato pre-migração; iteração futura pode requerer re-trabalho
  - Custo de manutenção (mais arquivos em mais repos)

### Opção B — Scaffold + migração on-demand
Repo recebe scaffold inicial (READMEs + estrutura de pastas + ADR fundadora) quando criado. Conteúdo migra **cirurgicamente**, on-demand, conforme cada peça é tocada em trabalho substantivo.
- Prós:
  - Lean — só migra o que tem demanda concreta
  - Preserva opcionalidade (Project Claude original continua acessível como fonte)
  - Custo de migração se distribui no tempo, junto com o trabalho que justifica
  - Scaffold já registra a arquitetura, mesmo dormente
- Contras:
  - Conteúdo permanece disperso até trigger explícito
  - Cada migração cirúrgica adiciona seu próprio overhead de sub-job

### Opção C — Não scaffolded também
Não criar repo até trabalho substantivo. Scaffold quando primeiro toque chegar.
- Prós:
  - Zero infra antes de necessidade
- Contras:
  - Perde-se o valor de registrar arquitetura cedo (decisão de monorepo vs N repos, license, structure)
  - Quando trigger chegar, sessão precisa fazer scaffold + migração ao mesmo tempo (escopo misturado)
- **Rejeitada** porque scaffold é cheap e registra arquitetura útil.

## Decisão

**Opção B — scaffold + migração on-demand.**

### Regra operacional

Quando um repo for criado para uma frente em dormência (via D-009):
1. **Scaffold inicial** = READMEs + estrutura de pastas + .gitignore + LICENSE + CLAUDE.md + ADR fundadora. Pronto, repo "registrado".
2. **Conteúdo legado migra apenas quando tocado em trabalho substantivo.** Self-extract do Project Claude continua canal de origem.
3. **Sub-jobs cirúrgicos** (estilo Step 3 da Onda 1): 1-3 arquivos por turno, conteúdo inline no job, Claude Code executa.
4. **Sem "migration sprint" em bloco.** Se uma sessão produzir vontade de migrar tudo, parar e validar contra esta D-011.

### Triggers explícitos por frente dormente

| Frente | Trigger de reabertura |
|---|---|
| `constellation-os` methodology | caso #2 aparece (case study novo) |
| `constellation-os` app | desenvolvimento do app retomado |
| `constellation-os` case-studies/atlas-frames | Atlas Phase 3 reaberta (~Abr 2026) ou trabalho operacional pede |
| Futuro `atlas-frames` standalone | trabalho operacional Atlas demanda repo dedicado |
| Outros repos futuros | trabalho substantivo na frente correspondente |

## Consequências

### Positivas
- **Lean operations.** Cada esforço de migração se justifica por trabalho concreto.
- **Opcionalidade preservada.** Project Claude original permanece como fonte; migração não destrói nada.
- **Scaffold como artefato suficiente** para frentes dormentes — registra intenção arquitetural sem custo de migração.
- **Padrão replicável** para qualquer repo futuro de frente em dormência.

### Trade-offs
- **Conteúdo fica disperso** entre Projects Claude e repos até trigger. Mitigação: inventário em `atom-engine-core/inventory/projects.md` mapeia origem de cada frente.
- **Cada toque substantivo paga overhead pequeno de migração cirúrgica** (sub-job). Aceitável dado que substitui o overhead grande de migração proativa.

### Impacto em outras partes do sistema
- `inventory/projects.md` — Projects classificados como "split-pending" ou "scaffold-done, content-on-demand" recebem nota referenciando D-011.
- Plan-v1 — §X "Repos standalone" da Onda 1 simplificado: Steps de migração em bloco saem; Steps de scaffold permanecem.
- D-008/009/010 — não conflitam; D-011 é corolário que completa a regra de governança.
- `constellation-os` (commit `9bfac63`) — caso piloto da Opção B. Steps 4b/4c/4d (migração methodology/app/case-study) saem do plan-v1 ativo e viram triggers on-demand.

## Referências

- D-008 — Onda 0 fechada; Constellation como frente transversal
- D-009 — estratégia repos pós-Onda 1
- D-010 — protocolo Projects + inventory + templates
- `constellation-os/decisions/d-001` — estrutura inicial do repo Constellation (consumida por esta regra)
- `wraps/system_wrap_2026-05-13_onda1-fechamento.md` — sessão que produziu esta decisão
