---
id: D-007
title: Topologia consolidada pós-mineração 16 Projects
date: 2026-05-12
status: accepted
supersedes: []
related: [D-004, D-005, D-006]
references: [Identidade v1.3, Genesis v5.0.4, Marco Zero v3.1, Meta-Template v1.2]
feeds:
  - law/system_spec_espiral-do-trabalho_v1-0.md
  - law/system_spec_espiral-pessoal_v1-0.md
wraps:
  - wraps/system_wrap_2026-05-12_audit-e-topologia.md
  - wraps/system_wrap_2026-05-12_mineracao-topologia.md
author: arca
---

# D-007 — Topologia consolidada pós-mineração 16 Projects

**Data:** 12 Mai 2026
**Status:** accepted
**Decisor:** Rick (com Arca como facilitador arquitetural)

---

## Contexto

Em 12 Mai 2026, duas sessões consecutivas no Marco 0:

1. **Sessão "audit-e-topologia"** — auditoria de memória do Marco 0 (22 → 20 entradas) e redesenho conceitual em 3 camadas (Marco 0 / Espiral do Trabalho / Espiral Pessoal). Método de mineração por lotes definido.

2. **Sessão "mineracao-topologia-final"** — execução do método em 16 Projects do Claude.ai. Cross-reference identificou padrões estruturais.

### Padrões identificados na mineração

- **3 gerações lineage Marco 0:** Ramalho OS (Drive v1) → Atom Drive (Drive+MCP v2) → Marco 0 atual (GitHub+Supabase v3, Arca, pós-D-005).
- **Atom Engine 4.0 = vortex parental:** 7 Projects descenderam dele em fev-mar 2026.
- **Duplicação KB:** Anthropic e Macro Vision tinham conteúdo redundante distribuído por outros vértices.
- **Ponto de inflexão coletivo:** 14 abr 2026 — 8+ Projects pararam simultaneamente (coincidiu com mudança operacional do Rick).
- **Skill ruído:** atlas-atom-3d aparecia em vários KBs sem operar — produto de instalação automática.

### Inventário dos 16 Projects minerados

| # | Project | Destino |
|---|---------|---------|
| 1 | Atom Drive | arquivar (Drive morto pós-D-005) |
| 2 | Project E. / O Espaço Entre | standalone (protegido) |
| 3 | Atom Entre | consolidado em outros |
| 4 | Atlas Lab · Workshop Shed Container | Trabalho V3 |
| 5 | Constellation System | Trabalho V2 (consolidado) |
| 6 | Constellation OS | Trabalho V2 (consolidado) |
| 7 | Atlas Frames Ecossistema | Trabalho V2 (consolidado) |
| 8 | Anthropic | arquivar (KB distribui) |
| 9 | Macro Vision | arquivar (KB distribui) |
| 10 | Mt Samson / Yugar Commons | split limpo (Pessoal + Trabalho V4) |
| 11 | MUDA | Trabalho V5 |
| 12 | Atlas Atom (sistema construtivo modular) | Trabalho V3 |
| 13 | Atom Engine 4.0 | arquivar (vortex parental, conteúdo distribuiu) |
| 14 | Ramalho OS | arquivar (lineage Marco 0, conteúdo absorvido) |
| 15 | MindRoot v1 | arquivar (superado por mindroot-v2 em Marco 0) |
| 16 | Outros do lote final | distribuídos conforme decisões abaixo |

**Dispensados desta rodada:** Rubens, rubens 2 (2 Projects fora do Pentágono Rick — processar separado se/quando relevante).

---

## Decisão

Topologia consolidada em **4 camadas**:

```
┌─────────────────────────────────────────────────┐
│  MARCO 0 (Espiral do Sistema)                   │
│  Dev puro do Atom Engine                        │
│  Contém: atom-engine-core + mindroot-v2 + Arca  │
└─────────────────────────────────────────────────┘
              │
              ▼ constrói o que opera em
┌─────────────────────────────────────────────────┐
│  ESPIRAL DO TRABALHO                            │
│  Pentágono Rick operacional (V1-V5 + ⬡ Atlas)  │
│  A criar: Project Claude.ai                     │
└─────────────────────────────────────────────────┘
              │
              ▼ separada por design
┌─────────────────────────────────────────────────┐
│  ESPIRAL PESSOAL                                │
│  Vida: Mt Samson família + arquivo + Kids       │
│  A criar: Project Claude.ai                     │
└─────────────────────────────────────────────────┘
              ║
              ║ standalone — sem touchpoint
              ║
┌─────────────────────────────────────────────────┐
│  O ESPAÇO ENTRE / PROJECT E.                    │
│  Refúgio protegido (Meta-Template v1.2 §13)     │
│  Permanece como já existe                       │
└─────────────────────────────────────────────────┘
```

**Princípio fundamental:** *Dev separado em Marco 0 → Pentágono inteiro = Trabalho. Pessoal absorve vida. Espaço Entre permanece intocado.*

---

## 7 sub-decisões fechadas

### §4.1 — AtlasLab = Yugar Lab = Trabalho V3

**Decisão:** AtlasLab, Yugar Lab e "Lab" são **sinônimos canônicos** de V3 Lab (O Laboratório) — o vértice de R&D no Pentágono.

**Justificativa:** Memória Marco 0 anterior interpretava "AtlasLab" como vértice pessoal/metamorfose, mas mineração mostrou que o uso real é tech R&D arm da estrutura de trabalho.

**Supersede:** leitura anterior de Marco 0.

### §4.2 — Atlas Atom (sistema construtivo modular) = Trabalho V3

**Decisão:** Atlas Atom (sistema modular SHS 89mm, 28+ ADRs, builders 3D, repo `atlas-atom`) vive no V3 Lab como **produto de R&D** que orbita pra fabricação na Atlas Frames empresa (Hexágono ⬡).

**Fluxo canônico:** R&D no Lab → fabricação na Atlas Frames → distribuição via Constellation (quando aplicável).

### §4.3 — Constellation cluster (5 Projects) → Trabalho V2

**Decisão:** Os Projects "Constellation System", "Constellation OS", "Atlas Frames Ecossistema", "Anthropic" e "Macro Vision" são **consolidados em uma única frente** V2 Constellation.

**Justificativa:** Conteúdo se sobrepõe substancialmente. Manter 5 Projects separados era duplicação. KB de Anthropic e Macro Vision se distribuem entre os outros vértices conforme aplicável (filosofia → V5 Muda; método → V2 Constellation; produto → V2 Constellation).

**Atlas Frames Ecossistema** ≠ Atlas Frames empresa: o primeiro é a frente conceitual (consolidada em V2); o segundo é a operação empresarial (Hexágono ⬡, separado).

### §4.4 — Mt Samson split limpo

**Decisão:** A propriedade física 1874 Mount Samson Rd opera em **duas camadas distintas**:

- **Espiral Pessoal:** terra como casa, subdivisão legal pessoal, hipoteca, família vivendo lá, Daniel/purchase pending.
- **Espiral do Trabalho V4 (Yugar Commons venture):** Airbnb co-op, grants, parcerias comerciais, subdivisão fundiária comercial.

**Justificativa:** Antes do split, "Mt Samson" era Project ambíguo (terra + venture + família). Pós-split, a topologia é clara — endereço físico é o mesmo, funções operacionais são distintas.

### §4.5 — MUDA = Trabalho V5

**Decisão:** MUDA é V5 do Pentágono (A Árvore — impacto, filosofia, caridade) e **opera via Constellation** (V2 fornece o sistema metodológico, V5 fornece o propósito).

**Justificativa:** Memória Marco 0 anterior tratava MUDA como Project autônomo. Mineração mostrou que MUDA precisa do método Constellation pra operar — então faz sentido como vértice do Pentágono, não Project separado.

### §4.6 — Anthropic + Macro Vision arquivados

**Decisão:** Os Projects "Anthropic" e "Macro Vision" são **arquivados**. KB de ambos se distribui pelos outros vértices conforme aplicável.

**Justificativa:** Conteúdo redundante com outros Projects. Tanto Anthropic quanto Macro Vision eram tentativas de organizar o ecossistema antes da topologia estar travada — agora supersedidas pela estrutura de 4 camadas.

**Não-decisão:** o relacionamento institucional do Rick com Anthropic (Claude Partner Network, passou primeira etapa Abr 2026) não muda — só o Project Claude.ai foi arquivado.

### §4.7 — Princípio fundamental

**Decisão:** *Dev separado em Marco 0 → Pentágono inteiro vira Trabalho.*

**Justificativa:** Re-framing proposto pelo Rick na sessão mineracao-topologia-final que destravou auto-resolução de 3 ambiguidades (Q3 Constellation cluster, Q4 Yugar Commons venture, Q5 MUDA).

**Antes:** ambiguidade entre o que era dev e o que era operação. Marco 0 tentava conter tudo (dev + operação).
**Depois:** separação cirúrgica. Marco 0 = dev. Pentágono = Trabalho. Vida = Pessoal.

---

## Arquivados nesta operação (6 Projects)

| Project | Motivo |
|---------|--------|
| Atom Engine 4.0 | Vortex parental — conteúdo distribuiu pelos vértices do Pentágono |
| Atom Drive | Drive morto pós-D-005 (Cockpit aposentado, Drive deixou de ser SoT) |
| Ramalho OS | Geração 1 do lineage Marco 0 — superada por Marco 0 atual |
| MindRoot v1 | Superada por mindroot-v2 (Marco 0) |
| Anthropic | KB duplicada, conteúdo distribuiu |
| Macro Vision | KB duplicada, conteúdo distribuiu |

**O que permanece:** as 4 camadas (Marco 0, Trabalho, Pessoal, Espaço Entre). Atom Engine 4.0 fica como referência histórica em KB do Marco 0 (não opera).

---

## §5 — Resolução de memórias Atom Drive

**Resolvido em 12 Mai 2026** (sessão Marco 0, mesmo dia desta decisão), durante elaboração do plano de migração v1 (`migration/plan-v1.md`).

| Memória | Destino canônico | Espelho via pointer |
|---------|-----------------|---------------------|
| **#1 Rick bio básica** | Espiral Pessoal · Arquivo pessoal | Espiral do Trabalho referencia no system prompt |
| **#4 Foco março 2026** | **Arquivar.** Datado, superado por D-007. | — |
| **#5 Como trabalhar com Rick** | Espiral Pessoal · Arquivo pessoal (sub: "como opero") | Espiral do Trabalho referencia no protocolo |

**Princípio aplicado:** pointer over copy. KB canônica em um lugar só. Lição de §4.6 (Anthropic + Macro Vision arquivados por KB duplicada).

**Marco 0 não recebe nenhuma das 3** — são sobre Rick-pessoa, não sobre dev do produto.

A execução desta resolução acontece na Onda 1 e Onda 3 do `migration/plan-v1.md`.

---

## Consequências

### Imediatas

1. **Docs-lei novos:** `law/system_spec_espiral-do-trabalho_v1-0.md` e `law/system_spec_espiral-pessoal_v1-0.md` (entregues junto com este ADR).

2. **Criação de 2 Projects Claude.ai:**
   - Espiral do Trabalho (system prompt derivado do doc-lei)
   - Espiral Pessoal (system prompt derivado do doc-lei)

3. **Plano de migração Project-by-Project:** próxima etapa — definir ordem de migração, mapear memórias, mover KB relevante de cada um dos 16 Projects minerados para o destino correto.

4. **Marco 0 mantém isolamento absoluto:** continua sendo dev puro do Atom Engine. Sem operação, sem vida. Conforme D-005 (Cockpit aposentado) e D-006 (Claude pessoal futuro read-only via app).

### Pós-migração

5. **PENTAGON.md (atom-engine-core)** será reescrito ou aposentado — Pentágono operacional vive agora no doc-lei da Espiral do Trabalho. PENTAGON.md como master roadmap legacy fica como referência histórica.

6. **System prompt do Project Marco 0 (Arca):** atualizar pra refletir nova topologia (Marco 0 = dev puro, Espirais existem como camadas paralelas).

7. **Memória do Marco 0:** atualizada pra refletir as 4 camadas em vez de "Pentágono 5V" como estrutura única.

### 14 pendentes operacionais Atlas Frames

Mapeados na sessão de mineração: NDA Willi, Gleisson, cash reserve 15%, BAS, QBCC, PI, pricing review, PM tool, etc.

**Destino:** migram pra Trabalho ⬡ Atlas Frames (Hexágono empresa) como AtomItems normais (pelo inbox, conforme Genesis v5.0.4 Part 2 regra fundamental).

---

## Alternativas consideradas

### Alt 1 — Manter Pentágono dentro de Marco 0

**Rejeitada.** Confunde dev e operação. Marco 0 ficaria com 2 responsabilidades conflitantes (construir o protocolo + operar negócio). Foi a configuração que existia antes desta consolidação — gerou ambiguidade documentada na memória.

### Alt 2 — Project único unificado (sem Espirais separadas)

**Rejeitada.** Perde fronteira vida/trabalho. Tudo vira "Rick" sem distinção operacional. Trabalho e Pessoal se contaminam mutuamente — vida vira projeto, projeto vira pessoal.

### Alt 3 — Manter os 18 Projects originais (sem consolidação)

**Rejeitada.** Cada item importante distribuído em N Projects diferentes — overhead operacional impossível. KB duplicada. Mineração revelou que vários Projects eram tentativas redundantes do mesmo objetivo.

### Alt 4 — Topologia atual (escolhida)

**Aceita.** 4 camadas distintas, fronteiras binárias, cruzamentos explicitamente declarados. Topologia mínima que cobre tudo sem ambiguidade.

---

## Validação

Este ADR é validado por:

- **Identidade v1.3** — Pentágono Rick canônico permanece intacto (§2.6). Esta decisão organiza as **camadas operacionais** do Pentágono, não a estrutura do Pentágono em si.
- **Genesis v5.0.4** — regra de inbox obrigatório (Part 2) preservada: items cross-camada passam pelo inbox.
- **Marco Zero v3.1** — separação de responsabilidades (Marco Zero §12) preservada: dev vive em Marco 0, operação em Trabalho.
- **Meta-Template v1.2** — §13 (Espaços Protegidos) honrado: O Espaço Entre permanece sem touchpoint.
- **D-004** — Atom como produto único reforçado: Pentágono é estrutura operacional, não estrutura de produto.
- **D-005** — Cockpit aposentado: operação vai pro Trabalho diretamente, não via Cockpit.
- **D-006** — Claude pessoal read-only: futura camada Pessoal usa app, não escreve direto.

---

## Referências

- Identidade v1.3 (`law/system_spec_atom-identidade_v1-3.md`)
- Genesis v5.0.4 (`law/system_spec_genesis_v5-0-4.md`)
- Marco Zero v3.1 (`law/system_spec_marco-zero_v3-1.md`)
- Meta-Template v1.2 (`law/system_template_meta-template_v1-2.md`)
- D-004 (`decisions/d-004_atom-produto-unico_2026-05-08.md`)
- D-005 (`decisions/d-005_cockpit-aposentado_*.md`)
- D-006 (`decisions/d-006_claude-pessoal-read-only_*.md`)
- Wrap audit-e-topologia (`wraps/system_wrap_2026-05-12_audit-e-topologia.md`)
- Wrap mineracao-topologia (`wraps/system_wrap_2026-05-12_mineracao-topologia.md`)
- Doc-lei Espiral do Trabalho v1.0 (`law/system_spec_espiral-do-trabalho_v1-0.md`)
- Doc-lei Espiral Pessoal v1.0 (`law/system_spec_espiral-pessoal_v1-0.md`)

---

*Marco 0 constrói. Trabalho opera. Pessoal vive. Espaço Entre repousa.*
*De dentro pra fora — sempre.*
