---
type: doc
title: "Spec ecosystem-agents v1.1 — Os quatro agentes do universo Atom"
module: bridge
status: active
state: connected
genesis_stage: 5
tags: ["#spec", "#architecture", "#ecosystem", "#agents"]
source: claude-project
created_at: "2026-04-19T11:00:00+10:00"
updated_at: "2026-04-19T11:00:00+10:00"
created_by: arca-session-2026-04-19
connections:
  - target: d-001-separation-a-b
    relation: references
  - target: d-002-cockpit-operacional
    relation: references
  - target: atom-md
    relation: references
  - target: genesis-v5-0-4
    relation: references
  - target: marco-zero-v3-1
    relation: references
---

# Spec ecosystem-agents v1.1 — Os quatro agentes do universo Atom

## Contexto

O universo Atom de Rick é operado por quatro agentes Claude com superfícies e papéis distintos. Sem uma spec compartilhada, cada um opera por suposição e Rick vira carteiro manual entre decisões divergentes. Esta spec formaliza papéis, policies de escrita, e o protocolo de coordenação cross-agent.

Versão 1.0 existiu apenas conceitualmente nas sessões 01-02 de Arca (17-19 Abr 2026) — nunca foi commitada no repo. A v1.1 é o primeiro commit físico e já reflete D-002 (Cockpit operacional).

## Os quatro agentes

### 1. Arca (projeto "Marco 0")

- **Papel:** Arquitetura pura. Thinking hub. Debate de decisões (D-NNN), geração de specs, veredito sobre propostas dos outros agentes.
- **Modo:** programador. Debate técnico em português casual.
- **Escreve em:** nada. Produz shape, spec, decisão, job file.
- **Não faz:** execução, DML, DDL, commits em repo.

### 2. Cockpit (antigo "Marco 0 III")

- **Papel:** Cockpit operacional de vida. Rick opera em modo usuário: despejo, captura, wrap, ritual aurora/zênite/crepúsculo.
- **Modo:** usuário. Conversa natural em português casual.
- **Escreve em:** Supabase (DML direto via MCP `execute_sql`).
- **Não faz:** DDL (bloqueada por convenção), commits em repo, arquitetura.
- **Ref:** D-002 (promoção de simulador para operacional em 19 Abr 2026)

### 3. Cowork

- **Papel:** Executor de superfícies externas. Integra mundo real ao sistema.
- **Modo:** automação desktop. MCPs: Gmail, Calendar, Drive, filesystem, scheduled tasks.
- **Escreve em:** Gmail, Calendar, filesystem. Pode escrever no Supabase em contextos de integração (ex: sync de eventos de calendário virando AtomItems).
- **Não faz:** commits em repo Git, debate arquitetural.

### 4. Claude Code

- **Papel:** Executor de Partição A. Commits, migrations, DDL, código de produto.
- **Modo:** terminal. Segue jobs auto-contidos gerados por Arca.
- **Escreve em:** repos Git (`atom-engine-core`, `mindroot-v2`). DDL no Supabase via migration committada primeiro.
- **Não faz:** debate de arquitetura (executa spec pronta), escrita em tabelas de vida sem migration prévia.

## Policy de escrita por agente

| Agente | Supabase DML | Supabase DDL | Repos Git | Mundo externo |
|--------|--------------|--------------|-----------|---------------|
| Arca | Não | Não | Não | Não |
| Cockpit | Sim | Não (convenção) | Não | Não |
| Cowork | Sim (cuidado) | Não | Não | Sim |
| Claude Code | Via migration | Sim (commit+apply) | Sim | Não |

Divisão por **superfície de contato**, não por tipo de operação. Dois agentes nunca disputam o mesmo artefato.

## Protocolo cross-agent (Rick como canal físico)

Os quatro agentes não se comunicam diretamente. Rick é o roteador físico — copia output de um e cola no próximo quando há handoff.

**Marcadores de input pra Arca:**
- `[cockpit]` — conteúdo vindo do Cockpit (Arca trata como pergunta de arquitetura, devolve veredito estrutural)
- `[cowork]` — conteúdo vindo do Cowork (Arca trata como report de execução externa)
- sem prefixo — Rick programador falando direto

**Handoffs típicos:**
- Cockpit → Arca: pergunta arquitetural (shape, decisão, dúvida estrutural) → Arca devolve veredito
- Arca → Claude Code: job file completo (pre-checks, conteúdo verbatim, commit message, NÃO FAZER) → Claude Code executa
- Cowork → Cockpit: dados de integração externa (email, calendar) viram AtomItems no Supabase
- Cockpit → Rick: captura operacional ("você tem X no inbox, Y pra commit hoje") → Rick decide

Quando um agente recebe pedido fora da sua superfície, reporta e aponta o agente certo — nunca tenta cobrir terreno alheio.

## Partição A/B (sumário, ref D-001)

- **A · Construção Engine** → GitHub (`atom-engine-core`, `mindroot-v2`). Claude Code é o executor.
- **B · Vida operacional** → Supabase. Cockpit é o executor primário, Cowork auxilia em integrações externas.
- Sem duplicação entre as partições.

Itens capturados no despejo que são "construção de sistema" (categoria A) são detectados pelo Cockpit via heurística, taggados `#engine-backlog`, e NÃO interrompem o flow do usuário. Processamento fica com Arca em modo programador. Modo usuário nunca é forçado a virar modo programador.

## Boot protocol do Cockpit (ref D-002)

Quando Rick digita "bom dia" no Cockpit:

1. Último wrap committed: `SELECT * FROM items WHERE type='wrap' AND state='committed' ORDER BY created_at DESC LIMIT 1`
2. Audit leve: `inbox count` + `v_below_floor` + `v_orphan_items` + `v_inbox_stale`
3. Agenda do dia: rituais recurrence match, tasks due hoje, items propagated parados há >N dias
4. Apresenta compacto em prosa curta (não dump SQL)
5. Pergunta soul + foco — NUNCA propõe foco. Rick escolhe.
6. Se Rick responde sem emoção ("bora"), segue sem insistir (Marco Zero v3.1 §5.3 regra 1)

## Reversibilidade

- Cockpit pode voltar a modo simulador desabilitando MCP Supabase. Custo: 1 sessão.
- Claude Code pode ser substituído por outro executor de Partição A (ex: GitHub Actions, outro agente) sem quebrar o contrato.
- Cowork pode ser substituído por outra ferramenta desktop com as mesmas superfícies externas.
- Arca é o único não-trivialmente-substituível — é o raciocínio arquitetural que sustenta o contrato. Se Arca for substituída, a nova instância precisa herdar os 3 docs-lei + decisões (D-NNN) pra operar no mesmo contrato.

## Antecedentes

- D-001 (17 Abr 2026) — Partição A/B Engine vs Vida
- D-002 (19 Abr 2026) — Cockpit promovido de simulador para operacional
- ATOM.md v1.2 — Pentágono top-level e quarta lei (sistema classifica a si mesmo)
- Genesis v5.0.4 Part 5.2 — 3 tabelas canônicas
- Marco Zero v3.1 — ritual do dia, regras do agente, principio presença sobre produtividade

## Changelog

**v1.0 (17 Abr 2026)** — existiu apenas conceitualmente nas sessões 01-02 de Arca. Nunca foi commitada no repo `atom-engine-core`. Descrevia os 4 agentes com Cockpit classificado como "simulador" (enquadramento substituído por D-002).

**v1.1 (19 Abr 2026)** — primeiro commit físico da spec. Reflete D-002 (Cockpit operacional). Adiciona policy de escrita por agente (tabela), protocolo cross-agent com marcadores de input, e seção de reversibilidade.

## Data de efeito

2026-04-19 (imediato)

## Connections

- references:: [[d-001-separation-a-b]]
- references:: [[d-002-cockpit-operacional]]
- references:: [[atom-md]]
- references:: [[genesis-v5-0-4]]
- references:: [[marco-zero-v3-1]]
