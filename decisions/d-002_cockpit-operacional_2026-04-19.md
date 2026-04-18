---
type: doc
title: "Decisão 002 — Cockpit promovido de simulador para operacional"
module: bridge
status: active
state: connected
genesis_stage: 5
tags: ["#decision", "#architecture", "#cockpit", "#supabase-mcp"]
source: claude-project
created_at: "2026-04-19T10:00:00+10:00"
updated_at: "2026-04-19T10:00:00+10:00"
created_by: arca-session-2026-04-19
connections:
  - target: d-001-separation-a-b
    relation: references
  - target: atom-md
    relation: references
  - target: genesis-v5-0-4
    relation: references
  - target: ecosystem-agents-v1-1
    relation: feeds
---

# Decisão 002 — Cockpit operacional

## Contexto
Em 17 Abr 2026 (D-001 e spec ecosystem-agents v1.0), o Cockpit foi classificado como "simulador" — produzia AtomItems em formato Genesis mas sem persistência real. Toda escrita no Supabase dependia de Cowork ou Claude Code, com Rick como carteiro manual de payloads.

Em 19 Abr 2026, o connector Supabase MCP foi ativado no projeto do Cockpit (DB `avvwjkzkzklloyfugzer`). O Cockpit passou a ter acesso direto ao DB via `execute_sql` e `apply_migration`. O enquadramento de "simulador" ficou obsoleto — não faz sentido simular o que pode ser feito de verdade.

Mudança de nome Marco 0 III → Cockpit (feita pelo Rick em 19 Abr) reflete a promoção.

## Decisão
O Cockpit é promovido de simulador para **cockpit operacional com escrita DML direta** no Supabase.

### Policy de escrita

**Cockpit PODE:**
- SELECT em qualquer tabela/view do projeto `avvwjkzkzklloyfugzer`
- INSERT em `items`, `item_connections`, `atom_events`
- UPDATE em `items` (incluindo body JSONB, state, status)
- DELETE em `item_connections` (regrediendo items via FSM automática)
- Usar views (`v_below_floor`, `v_orphan_items`, `v_inbox_stale`, `v_soul_logs`)
- Chamar RPCs (`morph_item`, `decay_item`, `propagate_effect`, `commit_item`)

**Cockpit NÃO PODE:**
- `apply_migration` — DDL bloqueada por convenção. Mudança estrutural só via commit em `atom-engine-core/sql/migrations/` + aplicação supervisionada
- CREATE/DROP/ALTER de qualquer objeto SQL (tabelas, tipos, policies, triggers, functions)
- TRUNCATE
- Operar em tabelas fora do escopo Atom (ex: `atom_items` do Constellation)

A proteção de DDL é comportamental — MCP Supabase expõe `apply_migration` tecnicamente, mas o system prompt do Cockpit bloqueia uso. D-003 candidato (futuro): formalizar que toda DDL, por qualquer agente, requer commit em repo antes de aplicar no DB.

### Divisão de superfície entre agentes

| Agente | Supabase DML | Supabase DDL | Repos Git | Mundo externo |
|--------|--------------|--------------|-----------|---------------|
| Arca | Não | Não | Não | Não |
| Cockpit | Sim | Não | Não | Não |
| Cowork | Sim (cuidado) | Não | Não | Sim |
| Claude Code | Via migration | Sim (commit+apply) | Sim | Não |

A divisão é por **superfície de contato**, não por tipo de operação. Dois agentes nunca disputam o mesmo artefato.

## Consequência
- Rick deixa de ser carteiro manual de payloads entre Cockpit e Cowork
- Cockpit ganha ergonomia real: "bom dia" lê DB ao invés de simular da KB
- `apply_migration` fica bloqueada no Cockpit por convenção — protege camada estrutural
- Spec `ecosystem-agents` atualiza v1.0 → v1.1 refletindo a mudança
- Tag `#engine-backlog` (D-001) continua sendo a regra pra itens categoria A: Cockpit tagga e segue o flow do usuário; processamento fica com Arca em modo programador, nunca com o cockpit
- Jobs de DDL continuam exclusivos de Claude Code — single responsible agent pro contrato estrutural

## Boot protocol "bom dia"
Quando Rick digita "bom dia" no Cockpit:

1. Último wrap committed — `SELECT * FROM items WHERE type='wrap' AND state='committed' ORDER BY created_at DESC LIMIT 1` (pega NEXT + shift emocional anterior)
2. Audit leve:
   - Inbox count: `SELECT count(*) FROM items WHERE state='inbox'`
   - Below floor: `SELECT * FROM v_below_floor`
   - Orphans: `SELECT * FROM v_orphan_items`
   - Stale inbox: `SELECT * FROM v_inbox_stale`
3. Agenda do dia:
   - Rituais com recurrence match hoje
   - Tasks com `body->'operations'->>'due_date' = CURRENT_DATE::text`
   - Items em `state='propagated'` há mais de N dias (progresso parado)
4. Apresenta compacto (prosa curta, não dump SQL)
5. Pergunta soul + foco — NUNCA propõe foco. Rick escolhe.
6. Se Rick responde sem emoção ("bora"), segue sem insistir (Marco Zero v3.1 §5.3 regra 1)

Este protocolo é o coração do ritual aurora. Transforma o Cockpit de "tela em branco" em "parceiro que te conhece".

## Reversibilidade
Se a promoção causar problemas (dados inconsistentes, performance, escopo de auth), revogar é simples: desabilitar MCP Supabase no projeto Cockpit e voltar pra Cowork como executor único. Custo de reversão: 1 sessão. Decisão não é irreversível.

## Antecedentes
- D-001 (17 Abr 2026) — partição A/B estabeleceu as superfícies. Esta decisão detalha a superfície do Cockpit.
- Spec ecosystem-agents v1.0 (17 Abr 2026) — enquadramento "Cockpit = simulador" fica superseded.
- Genesis v5.0.4 Part 5.2 — 3 tabelas canônicas (items, item_connections, atom_events).
- ATOM.md v1.2 — quarta lei (sistema classifica a si mesmo).

## Supersede
Enquadramento da sessão 01 ("Cockpit = simulador") fica substituído por esta decisão. Spec `ecosystem-agents` v1.0 → v1.1 absorve a mudança no próximo commit.

## Data de efeito
2026-04-19 (imediato)

## Connections
- references:: [[d-001-separation-a-b]]
- references:: [[atom-md]]
- references:: [[genesis-v5-0-4]]
- feeds:: [[ecosystem-agents-v1-1]]
