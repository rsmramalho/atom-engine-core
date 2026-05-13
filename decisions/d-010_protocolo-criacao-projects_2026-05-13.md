---
id: d-010
title: Protocolo de criação de Projects Claude.ai e templates por hub
type: decision
status: accepted
date: 2026-05-13
refines: [d-009]
references: [d-007, d-008]
connections:
  - relation: references
    target: Genesis v5.0.4
  - relation: references
    target: Marco Zero v3.1
  - relation: references
    target: Meta-Template v1.2
  - relation: references
    target: Identidade v1.3
  - relation: feeds
    target: inventory/projects.md
  - relation: feeds
    target: templates/projects/
tags: [#system, #projects, #protocol, #templates, #governance]
---

# D-010 — Protocolo de criação de Projects Claude.ai e templates por hub

## Contexto

Após D-008 fechar a Onda 0 e D-009 a estratégia de repos pós-Onda 1, restava ambiguidade operacional: quando criar Project Claude.ai novo, como criar de forma consistente, como manter os 3 agentes (Arca em Marco 0, Claude Code em terminal, Cowork em browser) cientes do que existe, e como encerrar sem perder conteúdo.

Tentativas anteriores propuseram critérios mecânicos (volume de KB, cadência de sessões) que se mostraram pouco úteis — volume é consequência, não causa de criação. A reformulação adotada parte de três premissas:

1. **Decisão qualitativa, não mecânica.** Project Claude.ai novo é justificado quando o escopo tem voice, regras ou autonomia operacional incompatíveis com a Espiral mãe.
2. **Quando cria, segue template do hub.** Cada hub (Marco 0, Espiral Trabalho, Espiral Pessoal) tem template próprio que herda Genesis Atom como base universal e adiciona voice/regras específicas.
3. **Conteúdo nunca se perde.** Doc-mãe do Project vive em `ventures/[slug]/INDEX.md`. Wraps alimentam a memória do hub declarado. Inventário central registra criação e encerramento.

---

## Decisão

### §1 Quando criar Project Claude.ai novo

Decisão qualitativa. Cria-se Project Claude.ai novo quando **pelo menos um** dos seguintes for verdadeiro:

- **Voice/regras incompatíveis** com a Espiral mãe (ex: cliente externo com NDA, venture open source com licença própria, contexto pessoal sensível)
- **Autonomia operacional** justifica skills, MCPs ou KB próprios que poluiriam o hub
- **Duração esperada** ≥3 meses como frente ativa
- **Output destinado a público externo** (ex: produto comercial, repo público, documentação aberta)

Se nenhum se aplica → vive como AtomItem dentro da Espiral correspondente com tag de vértice/venture.

**Default em caso de dúvida: não cria.** Quando precisar mesmo, será óbvio.

### §2 Como criar (protocolo de 4 passos)

Quando a decisão §1 for sim:

1. **Escolhe template do hub** correspondente em `atom-engine-core/templates/projects/`:
   - `template_project_marco-0.md` — para Projects ligados ao hub Marco 0 (dev/arquitetura)
   - `template_project_espiral-trabalho.md` — para Projects ligados ao hub Espiral Trabalho (operacional pro)
   - `template_project_espiral-pessoal.md` — para Projects ligados ao hub Espiral Pessoal (vida)

2. **Cria pasta** `atom-engine-core/ventures/[slug]/` com `INDEX.md` inicial (segue Meta-Template v1.2). O INDEX.md é o doc-mãe do Project — atualizado via commits significativos.

3. **Atualiza** `atom-engine-core/inventory/projects.md` com nova entrada (commit).

4. **Cria Project Claude.ai** no painel: cola o template preenchido como instructions, anexa KB seed obrigatória (Genesis v5.0.4 + docs específicos do hub + spec do venture).

### §3 Base universal — Genesis Atom

Todo Project segue Genesis Atom v5.0.4 sem exceção:

- AtomItem schema (id, type, module, state, status, stage, tags, connections)
- State machine 7 estágios (· — △ □ ⬠ ⬡ ○)
- Meta-Template v1.2 como formato dos templates internos
- Naming canônico D-004 (Atom = produto, MindRoot = codename, Genesis = lei sem prefixo, etc.)

Templates do hub adicionam voice e regras específicas **acima** da base Genesis, nunca substituem.

### §4 Voice e regras específicas — vêm do template do hub

Templates vivem em `templates/projects/` e definem:

- **Voice** (tom, linguagem, formalidade)
- **Hub destino dos wraps** (Marco 0 / Espiral Trabalho / Espiral Pessoal)
- **KB seed obrigatória** (docs-lei + docs do hub mãe + spec do venture)
- **Skills/MCPs default** do contexto
- **Boundary do hub** (o que NÃO toca; redireciona pra hub correspondente)

Atualizar template = commit no atom-engine-core. Rebase de Projects existentes é opcional, não obrigatório.

### §5 Wraps alimentam o hub

Cada sessão fecha com wrap (ritual Crepúsculo do Marco Zero v3.1 §5):

- Wrap é AtomItem `type: wrap`, `genesis_stage: 7 ○`
- Body JSONB segue Meta-Template v1.2
- **Destino:** wrap vai pra memória do hub declarado no system prompt do template
- Wrap também referencia o `INDEX.md` do Project se houve update significativo

O hub vira ponto único de consulta para os 3 agentes saberem o que aconteceu em qualquer Project ligado a ele.

### §6 Encerramento

Quando uma venture/frente conclui ou hiberna:

1. Sessão final gera wrap de fechamento (`genesis_stage: 7 ○`, status `done` ou `paused`)
2. `ventures/[slug]/INDEX.md` ganha status `archived` no envelope ATOM com data de encerramento
3. `inventory/projects.md` atualiza coluna `encerrado` com YYYY-MM-DD
4. Project Claude.ai arquiva no painel (botão de archive, manual)
5. Conteúdo permanece referenciável via atom-engine-core indefinidamente

### §7 Convenção de nome de chat

Padrão para títulos de chat dentro de qualquer Project:

```
[SLUG] YYYY-MM-DD · Tema curto
```

Exemplos:
- `[MARCO-0] 2026-05-13 · D-009 + 14 self-extracts processados`
- `[ATLAS-ATOM] 2026-05-18 · Reconciliação connector ADR-020/026/028`
- `[ESPIRAL-TRABALHO/V2] 2026-05-20 · Cliente Foo Co — discovery call`
- `[ESPIRAL-PESSOAL] 2026-05-22 · Yugar Commons grants MBRC`

Implementação: Claude sugere o título no fim do primeiro turno significativo (não no boot — espera tema firmar). Usuário aceita, edita ou recusa.

---

## Consequências

### Destranca

- Topologia de criação de Projects fica explícita — zero ambiguidade
- 3 agentes (Arca/Code/Cowork) leem o mesmo `inventory/projects.md` no boot e sabem o que existe
- Migração de contexto entre Projects é zero — cada Project já nasce no lugar certo
- Encerramento é ritual claro (não decisão difícil)

### Trade-offs aceitos

- Disciplina obrigatória de atualizar `INDEX.md` + `inventory/projects.md` a cada criação/encerramento
- Templates podem divergir entre si com o tempo — re-base manual quando necessário
- Critério §1 é qualitativo, requer julgamento (mas mecânico era pior)

### Aberturas remanescentes

- Template específico para Project standalone (sem hub explícito, ex: Project E.) não está incluído neste job — fica como pendência se aparecer caso novo
- Automação do registro em `inventory/projects.md` via hook git é possível mas não obrigatória nesta versão

---

## Referências

- D-007 (source of truth = 3 lugares)
- D-008 (Onda 0 fechada)
- D-009 (estratégia de repos pós-Onda 1)
- Genesis v5.0.4 — law/system_spec_genesis_v5-0-4.md
- Marco Zero v3.1 — law/system_spec_marco-zero_v3-1.md
- Meta-Template v1.2 — law/system_template_meta-template_v1-2.md
- Identidade v1.3 — law/system_spec_atom-identidade_v1-3.md
- ecosystem-agents v1.2 (commit `c14a5bd`)
- Sessão Marco 0 de 2026-05-13 (chat Claude.ai)

---

*"De dentro pra fora — sempre."*
