---
type: doc
title: "Decisão 001 — Separação A/B: Engine construction vs Vida operacional"
module: bridge
status: active
state: connected
genesis_stage: 5
tags: ["#decision", "#architecture", "#domain:projects"]
source: claude-project
created_at: "2026-04-17T10:00:00+10:00"
updated_at: "2026-04-17T10:00:00+10:00"
created_by: cockpit-session-2026-04-17
connections:
  - target: atom-md
    relation: references
  - target: pentagon-md
    relation: references
  - target: genesis-v5-0-4
    relation: references
---

# Decisão 001 — Separação A/B

## Contexto
Pergunta original: "como controlaremos projetos internos do Atom Engine?"

Risco identificado: duplicar fonte de verdade entre GitHub (construção do sistema) e Supabase (operação da vida) → entropia garantida por sincronização manual de dois grafos divergentes.

## Decisão
Partição A/B oficializada:

- **A · Construção Engine** (specs, roadmaps, features do sistema)
  - Source of truth: GitHub (`atom-engine-core`, `mindroot-v2`)
  - NÃO vira AtomItem no Supabase
  - Pentágono (ATOM.md) já define top-level structure

- **B · Vida operacional** (projetos do Rick vivendo)
  - Source of truth: Supabase como `type: project`
  - Genesis pipeline aplica normalmente
  - Módulo natural da vida (family, finance, work, body…)

## Consequência
- Zero duplicação de dados
- Engine construction flui por commits, wraps, specs no repo
- Cockpit (Supabase) é só operação de vida
- Se um dia precisar de dashboard unificado: meta-item com `module: bridge` + `#engine` como PONTEIRO pro GitHub (não cópia). Futuro, não agora.

## Exceção registrada
Itens capturados no despejo que são "construção de sistema" (ex: "ativar INSERT Supabase") NÃO entram como AtomItem persistente. Cockpit (Marco 0 III) detecta via heurística, tagga `#engine-backlog`, e segue o flow do usuário sem interromper. Processamento da fila é responsabilidade do projeto Arca (modo programador), nunca do cockpit.

Princípio subjacente: modo usuário nunca é forçado a virar modo programador. A troca de modo é sempre iniciativa do Rick, nunca do sistema.

## Meta-decisão subordinada (naming das decisions)
Decisions adotam convenção ADR padrão do mundo dev:
- Path: `atom-engine-core/decisions/d-NNN_kebab-title_YYYY-MM-DD.md`
- Folder `decisions/` sinaliza escopo próprio
- Exceção consciente à naming convention universal do Meta-Template (Part 8)
- Registrado aqui porque D-001 é a primeira — a pasta nasce com essa convenção

## Nota sobre frontmatter em categoria A
Docs categoria A (GitHub) usam YAML frontmatter no padrão Meta-Template v1.2 por interoperabilidade e parseabilidade. Porém:

- Stage e state no frontmatter são CLASSIFICAÇÃO ESTRUTURAL, não estado dinâmico num pipeline
- Não existe row correspondente no Supabase `items`
- Git commit fecha o ciclo do doc — não o wrap
- Se um dia se quiser importar decisions como AtomItems (ex: pra dashboard unificado), o frontmatter já tem formato compatível. Futuro, não agora.

Wraps mencionam decisions categoria A no campo DECIDED (referência), nunca UPDATE de stage.

## Antecedentes
- ATOM.md v1.2 — Pentágono top-level e quarta lei (sistema classifica a si mesmo)
- system_spec_genesis_v5-0-4.md Part 4.2 — módulos são dimensões universais, não containers
- system_spec_genesis_v5-0-4.md Part 12 — fronteira Genesis vs Marco Zero

## Data de efeito
2026-04-17 (imediato)

## Connections
- references:: [[atom-md]]
- references:: [[pentagon-md]]
- references:: [[genesis-v5-0-4]]
