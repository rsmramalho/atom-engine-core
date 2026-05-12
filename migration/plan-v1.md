---
id: migration-plan-v1
title: Plano de migração Project-by-Project pós-D-007
date: 2026-05-12
status: draft
type: spec
module: bridge
stage: 5
references: [D-004, D-005, D-006, D-007, Identidade v1.3, Genesis v5.0.4]
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

## 4 — Matriz Project → destino (16 linhas)

| # | Project (Claude.ai) | Status atual | Destino canônico | Ação | Onda |
|---|---------------------|--------------|-----------------|------|------|
| 1 | Marco 0 (este) | ativo | Marco 0 (intocado) | nada | — |
| 2 | O Espaço Entre / Project E. | ativo | standalone | nada | — |
| 3 | Atom OS / Atom Engine 4.0 | vortex parental | KB histórica · Marco 0 | **arquivar** (renomear `[ARCHIVED]`) | Onda 3 |
| 4 | Atom Drive | superado por D-005 | — | **arquivar** | Onda 3 |
| 5 | Ramalho OS | geração 1 lineage | — | **arquivar** | Onda 3 |
| 6 | MindRoot v1 | superado por mindroot-v2 | — | **arquivar** | Onda 3 |
| 7 | Anthropic | KB duplicada | — | **arquivar** | Onda 3 |
| 8 | Macro Vision | KB duplicada | — | **arquivar** | Onda 3 |
| 9 | Constellation System | ativo/pausado | Espiral do Trabalho · V2 | **consolidar** em V2 | Onda 1 |
| 10 | Constellation OS | ativo/pausado | Espiral do Trabalho · V2 | **consolidar** em V2 | Onda 1 |
| 11 | Atlas Frames Ecossistema | ativo | Espiral do Trabalho · V2 + ⬡ | **consolidar** (cluster Constellation) | Onda 1 |
| 12 | Atlas Atom (sistema construtivo) | ativo | Espiral do Trabalho · V3 Lab | **migrar KB** (R&D Lab → Atlas Frames) | Onda 1 |
| 13 | Mt Samson / Yugar Commons | ativo | **split** | **dividir** (ver §5) | Onda 2 |
| 14 | MUDA | concept | Espiral do Trabalho · V5 | **migrar KB** | Onda 1 |
| 15 | MindRoot Kids | concept | Espiral Pessoal · frente cíclica | **migrar KB** (ciclo: Pessoal → Marco 0 → Pessoal) | Onda 1 |
| 16 | _slot reservado_ | a confirmar | a confirmar | confirmar na Onda 0 | Onda 0 |

**Onda 0 (pré-execução):** Cowork lista os 16 Projects no painel do Rick e confirma o nome do slot #16 (se houver Project não identificado nesta matriz). Sem essa confirmação binária, a migração não começa.

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

### Onda 1 — Criação + migração de novos cluster (8 Projects)

- [ ] **Rick cria 2 Projects Claude.ai:**
  - "Espiral do Trabalho" — cola system prompt
  - "Espiral Pessoal" — cola system prompt
- [ ] **Migrar KB para Espiral do Trabalho:**
  - Constellation System → V2
  - Constellation OS → V2
  - Atlas Frames Ecossistema → V2 + ⬡
  - Atlas Atom → V3 Lab
  - MUDA → V5
- [ ] **Migrar KB para Espiral Pessoal:**
  - MindRoot Kids → frente cíclica
  - Memórias #1 + #5 Atom Drive → frente Arquivo pessoal

### Onda 2 — Splits (1 Project, 2 destinos)

- [ ] **Mt Samson split:**
  - terra + família + hipoteca + Daniel → Espiral Pessoal
  - venture Airbnb + grants + co-op → Espiral do Trabalho V4
- [ ] **Inserir pointers cruzados** nos system prompts dos dois lados

### Onda 3 — Arquivamento (6 Projects)

- [ ] Renomear no painel Claude.ai:
  - `Atom OS` → `[ARCHIVED] Atom Engine 4.0`
  - `Atom Drive` → `[ARCHIVED] Atom Drive`
  - `Ramalho OS` → `[ARCHIVED] Ramalho OS`
  - `MindRoot` (v1) → `[ARCHIVED] MindRoot v1`
  - `Anthropic` → `[ARCHIVED] Anthropic Project`
  - `Macro Vision` → `[ARCHIVED] Macro Vision`
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

## 9 — Pendências abertas (não bloqueadoras)

1. **Slot #16** — confirmar nome na Onda 0 ou aceitar que minei só 15 únicos
2. **Cluster Constellation** — durante Onda 1, definir se Constellation System + Constellation OS + Atlas Frames Ecossistema viram **um corpo único** em V2 ou **3 sub-frentes** dentro de V2
3. **AtlasLab vs Yugar Lab vs V3** — confirmar se os 3 nomes referem-se à mesma frente operacional ou se há sub-divisões (D-007 já consolidou em "V3 Lab", mas KB pode ter sub-rótulos)

Essas pendências não bloqueiam o início da Onda 1. Resolução acontece durante a execução, registrada em mini-wraps.

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 12 Mai 2026 | Documento inaugural. Plano executivo de migração Project-by-Project pós-D-007. Resolve D-007 §5 (memórias Atom Drive). Define 4 ondas, matriz 16 Projects, critério binário, splits explícitos. |

---

*16 Projects → 4 camadas. Pointer over copy. Marco 0 intocado.*
*De dentro pra fora — sempre.*
