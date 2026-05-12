---
id: migration-plan-v1
title: Plano de migração Project-by-Project pós-D-007
date: 2026-05-12
updated: 2026-05-13
status: draft
type: spec
module: bridge
stage: 5
references: [D-004, D-005, D-006, D-007, Identidade v1.3, Genesis v5.0.4]
refined_by: D-008
feeds:
  - law/system_spec_espiral-do-trabalho_v1-0.md
  - law/system_spec_espiral-pessoal_v1-0.md
supersedes: []
author: arca
---

# Plano de migração Project-by-Project — v1

**Data:** 12 Mai 2026
**Status:** draft (pronto para execução após criação dos 2 Projects Claude.ai)
**Princípio:** pointer over copy. KB canônica vive em um lugar só.

---

## 1 — Contexto

Em 12 Mai 2026, três operações em sequência:

1. **Wrap audit-e-topologia** — auditoria do Marco 0 e desenho da topologia em 4 camadas.
2. **Wrap mineracao-topologia** — 16 Projects do Claude.ai minerados via prompt de extração padronizado.
3. **Wrap espirais-docs-lei** — docs-lei das duas Espirais novas (Trabalho v1.0, Pessoal v1.0) + D-007 commitados em `origin/main`.

Este plano executa o passo seguinte: **migrar a KB e memórias dos 16 Projects minerados para os destinos canônicos definidos em D-007**, criando os 2 Projects novos (Espiral do Trabalho, Espiral Pessoal) e arquivando os 6 Projects superados.

---

## 2 — Princípios de migração

### 2.1 Pointer over copy

KB duplicada vira dívida (D-007 §4.6, lição Anthropic + Macro Vision). Sempre que possível, destino canônico contém o conteúdo. Outros Projects referenciam por **pointer**:

> Memória ou seção: "Rick bio canônica vive em Espiral Pessoal · frente Arquivo pessoal."

### 2.2 Marco 0 fica intacto

Marco 0 já é canônico para dev Atom puro. Esta migração **não toca** memória nem KB do Marco 0, exceto: (a) wraps e ADRs novos desta operação, (b) atualização do PENTAGON.md downstream (próxima rodada).

### 2.3 O Espaço Entre não migra

Project E. é standalone (D-007). Nenhuma operação aqui o referencia, modifica ou consulta.

### 2.4 Arquivados não migram conteúdo — só pointer histórico

Os 6 Projects arquivados ficam com KB intocada no painel, **renomeados com prefixo `[ARCHIVED]`**. Conteúdo essencial já distribuiu pelos vértices durante a mineração. Ficam acessíveis caso precise consulta histórica; serão deletados em rodada futura se nunca consultados.

### 2.5 Decisão binária por Project

Cada Project tem **um único destino canônico**. Sem "vive em dois lugares". Quando há cruzamento (V1, V4, MindRoot Kids), o destino canônico é definido pela natureza primária do conteúdo, e o outro destino recebe pointer.

---

## 3 — D-007 §5 — Resolução de memórias Atom Drive

A pendência aberta em D-007 §5 (memórias Atom Drive #1/#4/#5) está resolvida aqui:

| Memória | Destino canônico | Espelho via pointer |
|---------|-----------------|---------------------|
| **#1 Rick bio básica** | Espiral Pessoal · Arquivo pessoal | Espiral do Trabalho recebe pointer no system prompt |
| **#4 Foco março 2026** | **Arquivar.** Datado, superado por D-007. | — |
| **#5 Como trabalhar com Rick** | Espiral Pessoal · Arquivo pessoal (sub: "como opero") | Espiral do Trabalho referencia no protocolo |

**Marco 0 não recebe nenhuma.** São sobre Rick-pessoa, não sobre dev do produto.

Esta resolução é refletida no ADR D-007 (edit in-place, §5 trocada de "Pendência aberta" → "Resolução").

---

## 4 — Matriz Project → destino (21 linhas — pós D-008)

| # | Project no painel | Destino canônico | Onda |
|---|-------------------|------------------|------|
| 1 | Espiral Pessoal | Pessoal (canônico, vivo) | 1 ✓ |
| 2 | Espiral do Trabalho | Trabalho (canônico, vivo) | 1 ✓ |
| 3 | Marco 0 | Marco 0 (intocado) | — |
| 4 | Atlas Atom | Trabalho · V4 Yugar (cluster Atlas) | 1 |
| 5 | Atlas Lab - Workshop Shed Container | Trabalho · V4 Yugar (cluster Atlas) | 1 |
| 6 | Cockpit - Atom Sim | arquivar (resíduo D-005) | 3 |
| 7 | Project E. | Pessoal · projeto pessoal | 1 |
| 8 | Rubens | Pessoal · frente arquivo pessoal | 1 |
| 9 | Atom Entre | standalone (= O Espaço Entre) | — |
| 10 | Atom Drive | arquivar | 3 |
| 11 | Anthropic | arquivar | 3 |
| 12 | Macro Vision | arquivar | 3 |
| 13 | CONSTELLATION SYSTEM v1 (documento) | Trabalho · Frente Constellation | 1 |
| 14 | CONSTELLATION SYSTEM OS | Trabalho · Frente Constellation | 1 |
| 15 | Rob super Landing page | Trabalho · V4 Yugar (cluster Atlas) | 1 |
| 16 | Atom Claude | arquivar (= primeira versão MindRoot) | 3 |
| 17 | Atom Engine 4.0 | arquivar (= Atom OS predecessor) | 3 |
| 18 | Ramalho Os | arquivar | 3 |
| 19 | 1874 Mount Samson (Sub Division) | split — terra+família → Pessoal, venture → Trabalho V4 | 2 |
| 20 | MindMate Tag V1 | arquivar (sistema tagging abandonado) | 3 |
| 21 | How to use Claude | ignorar (example Anthropic) | — |

**Onda 0 (fechada em D-008, 13 Mai 2026):** snapshot do painel via Cowork confirmou 21 entradas. 6 Projects não mapeados pelo plan-v1 v1.0 foram classificados, 3 "fantasmas" reclassificados (ver §9). Constellation = frente transversal (não V2). V3 Lab nomeado Yugar Lab. Cluster Atlas mora em V4 Yugar.

---

## 5 — Splits explícitos

### 5.1 Mt Samson (Project #13)

Conforme D-007 §4.4:

| Conteúdo | Destino canônico |
|----------|-----------------|
| 1874 Mount Samson Rd: terra, subdivisão legal, hipoteca, Daniel/purchase pendente | Espiral Pessoal · frente Mt Samson/família |
| Família: Fernanda, Bella, Ben, rotina, homeschool | Espiral Pessoal · frente Mt Samson/família |
| Venture Yugar Commons: Airbnb, grants, co-op model | Espiral do Trabalho · V4 |

**Pointer entre as duas:** Espiral do Trabalho V4 referencia "propriedade física vive em Pessoal" no system prompt. Pessoal referencia "venture comercial Mt Samson vive em Trabalho V4" no system prompt.

### 5.2 V1 MindRoot — atravessa 3 camadas

V1 não é Project Claude.ai a migrar — é vértice do Pentágono que aparece em todas as 3 camadas operacionais, conforme Identidade v1.3 §2.6 e doc-lei da Trabalho §5:

| Camada | O que V1 é nela |
|--------|-----------------|
| Marco 0 | dev do app mindroot-v2 (canônico) |
| Espiral do Trabalho | gestão do produto Atom (roadmap, brand, releases, marketing) |
| Espiral Pessoal | uso pessoal do app pelo Rick (ferramenta de presença, não obrigação) |

Nenhuma migração de KB aqui. Os 3 system prompts referenciam V1 cada um em sua função, com pointer cruzado quando relevante.

### 5.3 MindRoot Kids — ciclo Pessoal → Marco 0 → Pessoal

Conforme doc-lei Pessoal §5: nasce na Pessoal (intuição familiar), eventualmente entra no Marco 0 (dev), volta pra Pessoal (uso). Por ora canônico em Pessoal · frente cíclica.

---

## 6 — Ordem de execução

### Onda 0 — Pré-flight (Cowork)

- [ ] Cowork lista os Projects no painel do Claude.ai (snapshot) e confirma slot #16
- [ ] Outputs os 2 system prompts em arquivo local pra Rick colar
- [ ] Arca atualiza esta tabela com nome confirmado de #16 antes da execução

### Onda 1 — Criação + migração de KB (9 Projects)

- [x] **Rick criou 2 Projects Claude.ai (Onda 0):**
  - "Espiral do Trabalho" — system prompt colado
  - "Espiral Pessoal" — system prompt colado
- [ ] **Migrar KB para Espiral do Trabalho (5 Projects):**
  - CONSTELLATION SYSTEM v1 (documento) → Frente Constellation
  - CONSTELLATION SYSTEM OS → Frente Constellation
  - Atlas Atom → V4 Yugar (cluster Atlas)
  - Atlas Lab - Workshop Shed Container → V4 Yugar (cluster Atlas)
  - Rob super Landing page → V4 Yugar (cluster Atlas)
- [ ] **Migrar KB para Espiral Pessoal (2 Projects + memórias):**
  - Project E. → projeto pessoal
  - Rubens → frente arquivo pessoal
  - Memórias #1 + #5 Atom Drive → frente Arquivo pessoal

### Onda 2 — Splits (1 Project, 2 destinos)

- [ ] **Mt Samson split (1874 Mount Samson Sub Division):**
  - terra + família + hipoteca + Daniel → Espiral Pessoal
  - venture Airbnb + grants + co-op → Espiral do Trabalho V4
- [ ] **Inserir pointers cruzados** nos system prompts dos dois lados

### Onda 3 — Arquivamento (8 Projects)

- [ ] Renomear no painel Claude.ai com prefixo `[ARCHIVED]`:
  - `Atom Engine 4.0` (= Atom OS predecessor)
  - `Cockpit - Atom Sim` (resíduo D-005)
  - `Atom Drive`
  - `Ramalho Os`
  - `Anthropic`
  - `Macro Vision`
  - `Atom Claude` (= primeira versão MindRoot)
  - `MindMate Tag V1` (sistema tagging abandonado)
- [ ] **Não deletar** nesta rodada — preserva histórico até validação da nova topologia
- [ ] Memória #4 Atom Drive: deletar (datada, superada por D-007)

### Onda 4 — Pós-migração

- [ ] Wrap consolidado em Marco 0 (`system_wrap_2026-05-XX_migration-v1-executada.md`)
- [ ] Atualizar memória do Marco 0 substituindo entrada de D-007 §5 "pendência aberta" por "resolvida"
- [ ] PENTAGON.md (atom-engine-core) atualizado downstream — próxima rodada, não esta

---

## 7 — Critério binário de "migrado"

Para cada Project da matriz, "migrado" significa **todas** as condições satisfeitas:

1. ✅ KB destino contém o conteúdo (ou pointer canônico quando aplica)
2. ✅ Memórias relevantes adicionadas no Project destino
3. ✅ Project origem renomeado pra `[ARCHIVED] Nome` no painel Claude.ai
4. ✅ Pointer cruzado inserido (quando há split ou cruzamento)
5. ✅ Wrap de migração registra o Project como executado

Se qualquer item falha: o Project fica como `migrating` e bloqueia a Onda seguinte.

---

## 8 — O que esta migração NÃO faz

| Não-escopo | Onde acontece |
|-----------|---------------|
| Atualizar PENTAGON.md | Próxima rodada Marco 0 |
| Atualizar ATOM.md | Próxima rodada Marco 0 |
| Atualizar README do mindroot-v2 | Próxima rodada Marco 0 |
| Tocar UI/copy do app | Próxima rodada Marco 0 (job pro Claude Code) |
| Criar D-008 ou ADRs novos | Só se algo emergir na execução |
| Modificar Marco 0 KB | Não — Marco 0 já é canônico |
| Modificar O Espaço Entre | Não — standalone |

---

## 9 — Fantasmas reclassificados

Em D-008 (13 Mai 2026), 3 entradas do plan-v1 v1.0 foram reclassificadas como **conceitos**, não Projects a migrar:

- **MUDA** — vértice V5 do Pentágono. Vive como sub-frente da Espiral do Trabalho via system prompt. Sem KB própria por enquanto.
- **MindRoot Kids** — frente cíclica conceitual da Espiral Pessoal. Vive no system prompt da Pessoal. Sem KB própria.
- **MindRoot v1** — predecessor histórico do app, deletado ou consolidado em Atom Claude (que vai pra arquivar na Onda 3). Sem ação adicional.

Esses 3 saem da lista de Projects a migrar. Cruzamento empírico com o painel via snapshot Cowork confirmou ausência.

### Pendências resolvidas em D-008

As 3 pendências da v1.0 foram fechadas pelo snapshot empírico:

- ~~Slot #16~~ → topologia ampliada pra 21 entradas (não há slot vazio)
- ~~Cluster Constellation~~ → resolvido: Frente Constellation transversal (D-008 §2)
- ~~AtlasLab vs Yugar Lab vs V3~~ → resolvido: V3 = Yugar Lab oficial, Atlas Lab = white label (D-008 §3)

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 12 Mai 2026 | Documento inaugural. Plano executivo de migração Project-by-Project pós-D-007. Resolve D-007 §5 (memórias Atom Drive). Define 4 ondas, matriz 16 Projects, critério binário, splits explícitos. |
| 1.1 | 2026-05-13 | Refinado por D-008. Tabela §4 ampliada (15→21 linhas). Contagens Onda 1 (7→9) e Onda 3 (6→8) atualizadas. Nova §9 sobre fantasmas reclassificados (MUDA, MindRoot Kids, MindRoot v1). |

---

*16 Projects → 4 camadas. Pointer over copy. Marco 0 intocado.*
*De dentro pra fora — sempre.*
