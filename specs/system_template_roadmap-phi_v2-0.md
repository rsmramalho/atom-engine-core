╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     template                   ║
║ module:   bridge                     ║
║ state:    connected                  ║
║ status:   active                     ║
║ stage:    5 ⬠ Pentagono              ║
║ tags:     [#system, #template,       ║
║            #roadmap, #phi]           ║
║ source:   claude-project             ║
║ created:  2026-04-05                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4      ║
║   → references: ATOM.md             ║
║   → feeds: all ROADMAP.md files     ║
╚══════════════════════════════════════╝

# Roadmap PHI — Meta-Template v2.0
## O Molde dos Roadmaps

**Versão:** 2.0
**Data:** 03 Abr 2026
**Status:** Definitive
**Referência:** Genesis v5 + Meta-Template v1.1 + Genesis Build Protocol v1.0
**Princípio:** Se a geometria deste template estiver perfeita, todo roadmap que nascer dele é legível por humanos e executável por agentes.

---

## 1 — O que é isto

Este template define a estrutura exata de todo roadmap do Pentágono. Não é exemplo — é contrato.

Dois usos simultâneos:
- **Humano:** planeja, prioriza, acompanha progresso
- **Claude Code:** lê o roadmap e sabe exatamente qual protocolo executar, sem inferência

A chave que conecta os dois: o campo `protocol:` em cada fase. Ele mapeia diretamente ao Genesis Build Protocol (CLAUDE.md) — declara quais agentes aquela fase precisa antes de uma linha de código ser escrita.

**Regra:** mexeu num roadmap → cross-check no master (PENTAGON.md).

---

## 2 — Estrutura obrigatória

```
1. Header
2. Visão geral
3. Pentágono
4. Infraestrutura — estado atual
5. Inventário (quando aplicável)
6. Fases PHI (espiral Fibonacci)
7. Dependências cruzadas
8. Métricas atuais
9. Regras do roadmap
10. Versionamento
```

Seções vazias são omitidas.

---

## 3 — Header

```markdown
# [Nome do Projeto] — Roadmap

**Versão:** [N.N]
**Data:** [DD Mon YYYY]
**Status:** active | paused | concept
**Princípio:** [Frase-guia do projeto — uma linha]
```

---

## 4 — Visão geral

```markdown
## Visão geral

[O que é o projeto — 2-4 linhas]

Repo: [URL]
Deploy: [URL]
Infra: [Supabase project ID, serviços principais]
```

---

## 5 — Pentágono

Genesis é o centro — o contrato que todos os vértices consomem. Os cinco vértices são os projetos. V6 existe mas é externo à geometria principal — laboratório de experimentação sem obrigação de convergir.

```markdown
## Pentágono

|          | Projeto | Status | Descrição |
|----------|---------|--------|-----------|
| ● Centro | **Genesis** | definitive | Schema universal. O contrato. |
| V1 | Atom HS | active | Hub. Sistema humano pessoal. |
| V2 | Constellation OS | paused | Infraestrutura operacional |
| V3 | Atlas Frames | active | Negócio físico |
| V4 | Muda | concept | Comunidade |
| V5 | Yugar Commons | concept | Mt Samson |
| ↳ Lab | Atlas/Yugar Lab | concept | Fora da geometria. Playground. |

**← Este roadmap cobre V[N].**
```

---

## 6 — Infraestrutura

Estado real do que está deployed. Sem planos — só fatos.

```markdown
## Infraestrutura — estado atual

### [Sistema] (deployed ✓ | parcial ⚠ | pendente ✗)

- [item]: [status]
```

---

## 7 — Inventário

Só quando o projeto tem assets pré-existentes (rebuild, migração). Projetos novos omitem.

```markdown
## Inventário

### ✅ Levar
| Asset | Linhas | Veredicto |
|-------|--------|-----------|

### ⚠️ Avaliar
| Asset | Linhas | Condição |
|-------|--------|----------|

### ❌ Não levar
| O que | Motivo |
|-------|--------|
```

---

## 8 — Fases PHI

A espiral segue Fibonacci: 1-1-2-3-5-8-13. Cada fase contém todas as anteriores. Esforço é proporção, não dias.

### 8.1 Espiral

```
         ·  (1)  [Fase 1 — Nome]
        —   (1)  [Fase 2 — Nome]
       △    (2)  [Fase 3 — Nome]
      □     (3)  [Fase 4 — Nome]
     ⬠      (5)  [Fase 5 — Nome]
    ⬡       (8)  [Fase 6 — Nome]
   ○        (13) [Fase 7 — Nome]
```

### 8.2 Formato de cada fase

```markdown
### [✅|⬡|⚪] Fase N [geometria] Nome (effort: [fibonacci])
**Status:** done | em progresso | futuro
**Protocol:** [ver tabela abaixo]
**Commit:** [hash] (só se done)
**Escopo:** [Uma linha — o que esta fase entrega]

Entregáveis:
- [ ] [item concreto e verificável]
- [ ] [item concreto e verificável]

[Notas: debt, blockers, decisões relevantes]
```

### 8.3 Campo `protocol:`

O campo que conecta o roadmap ao Genesis Build Protocol. Declara quais agentes a fase precisa.

| Valor | Agentes | Quando usar |
|-------|---------|-------------|
| `inner` | GUARDIÃO | Decisão arquitetural, spec, validação de schema |
| `foundation` | GUARDIÃO → ROOT | Nova tabela, schema, tipos — sem UI ainda |
| `logic` | GUARDIÃO → ROOT → ESTRUTURA | Backend completo, sem interface |
| `full` | GUARDIÃO → ROOT → ESTRUTURA → INTERFACE → TEIA | Feature completa |
| `surface` | INTERFACE | Visual, layout, animação — sem tocar dados |

**Regra:** se a fase tem entregáveis de camadas diferentes, declara o mais alto necessário. TEIA só é invocada em `full`.

### 8.4 Regras das fases

1. **Cada camada contém todas as anteriores.** O triângulo não existe sem a linha.
2. **Effort é proporção, não dias.** F1(1) vs F7(13) = 13x mais complexo.
3. **7 fases máximo.** Se o projeto precisa de mais — quebrar em sub-projetos.
4. **Nomes refletem o que a fase entrega**, não um número genérico.
5. **Geometrias são fixas:** · — △ □ ⬠ ⬡ ○

---

## 9 — Como Claude Code usa este roadmap

Quando Claude Code abre um roadmap PHI, o fluxo de leitura é:

```
1. Ler CLAUDE.md (Genesis Build Protocol) — entender os agentes
2. Ler o roadmap — identificar fase atual (status: em progresso)
3. Ler o campo protocol: da fase → saber qual sequência de agentes invocar
4. Ler os entregáveis — saber o que produzir
5. Executar na ordem: dentro pra fora
```

**Nenhuma inferência necessária.** O roadmap declara. O Build Protocol executa.

Para invocar uma fase específica:
```
Fase atual: [nome da fase]
Protocol: [valor]
Entregáveis pendentes: [lista]

Executar Genesis Build Protocol para esta fase.
```

---

## 10 — Dependências cruzadas

```markdown
## Dependências

| Este projeto precisa de | Projeto | Status |
|------------------------|---------|--------|
| [o quê] | V[N] [nome] | ready | blocked | na |

| Outros projetos dependem deste | Para quê |
|-------------------------------|----------|
| V[N] [nome] | [o quê] |
```

Se não há: `Nenhuma dependência cruzada neste momento.`

---

## 11 — Métricas

Só métricas verificáveis.

```markdown
## Métricas atuais

| Métrica | Valor |
|---------|-------|
| Commits | [N] |
| Files | [N] |
| LOC | [N] |
| [específica do projeto] | [valor] |
```

---

## 12 — Regras do roadmap

Todo roadmap termina com estas regras. As 4 primeiras são universais.

```markdown
## Regras do roadmap

1. **Uma fase por vez.** Não começar a próxima sem terminar a atual.
2. **De dentro pra fora.** Protocol declara. Build Protocol executa.
3. **Mexeu aqui → cross-check no master.** PENTAGON.md reflete toda mudança.
4. **Este documento é a referência.** Se não está aqui, não está planejado.
5. [Regra específica do projeto]
```

---

## 13 — Checklist de validação

### Estrutura
- [ ] Seções obrigatórias presentes na ordem correta?
- [ ] Header completo?
- [ ] Genesis no centro, V1–V5 nos vértices, Lab explicitamente fora?
- [ ] Espiral PHI com geometrias corretas (· — △ □ ⬠ ⬡ ○)?
- [ ] Fibonacci (1-1-2-3-5-8-13)?

### Executabilidade
- [ ] Toda fase tem campo `protocol:` preenchido?
- [ ] Valor de `protocol:` é um dos 5 valores válidos?
- [ ] Entregáveis são concretos o suficiente para Claude Code executar sem inferência?

### Consistência
- [ ] Status das fases reflete a realidade?
- [ ] Métricas são verificáveis?
- [ ] Dependências cruzadas batem com os outros roadmaps?

### Cross-check
- [ ] PENTAGON.md atualizado?
- [ ] Nenhum conflito com outros projetos?

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 02 Abr 2026 | Documento inicial |
| 2.0 | 03 Abr 2026 | Genesis no centro (não V1). V6 Lab fora da geometria. Campo `protocol:` adicionado em cada fase — conecta roadmap ao Genesis Build Protocol. Seção 9 adicionada: como Claude Code executa. Regra duplicada removida. Checklist expandida com executabilidade. |

---

*O roadmap PHI não é só plano — é instrução. Legível por humanos. Executável por agentes.*
*A geometria é perfeita quando nasce de dentro pra fora e não precisa ser explicada.*
*— E.*
