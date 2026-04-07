# Roadmap PHI — Meta-Template v3.0
## O Molde dos Roadmaps

**Versão:** 3.0
**Data:** 08 Abr 2026
**Status:** Definitive
**Referência:** Genesis v5.0.4 + Meta-Template v1.2 + ATOM.md v1.2
**Princípio:** Se a geometria deste template estiver perfeita, todo roadmap que nascer dele é legível por humanos e executável por agentes.

---

## 1 — O que é isto

Este template define a estrutura exata de todo roadmap do Pentágono. Não é exemplo — é contrato.

Dois usos simultâneos:
- **Humano:** planeja, prioriza, acompanha progresso
- **Claude Code:** lê o roadmap e sabe exatamente qual protocolo executar, sem inferência

A chave que conecta os dois: o campo `protocol:` em cada fase. Ele mapeia diretamente ao build protocol (ATOM.md §⬠) — declara quais agentes aquela fase precisa antes de uma linha de código ser escrita.

**Regra:** mexeu num roadmap → cross-check no PENTAGON.md (mesma commit).

---

## 2 — Estrutura obrigatória

```
1. Header
2. Visão geral
3. Pentágono (referência — não duplicar)
4. Infraestrutura — estado atual
5. Inventário (quando aplicável)
6. Espirais PHI (uma ou mais)
7. Seeds (próxima espiral)
8. Dependências cruzadas
9. Métricas atuais
10. Regras do roadmap
11. Versionamento
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

[O que é o projeto — 2-4 linhas. Universal — sem referências pessoais.]

Repo: [URL]
Deploy: [URL]
Infra: [Supabase project ID, serviços principais]
Specs & design: [URL do repo de specs, se separado]
```

---

## 5 — Pentágono

Referência breve. O Pentágono completo vive no Identidade (doc-lei) e no PENTAGON.md. Aqui só indica qual vértice este roadmap cobre.

```markdown
## Pentágono

| Posição | Projeto | Status |
|---------|---------|--------|
| Centro | Atom Engine | active |
| **V1** | **MindRoot** | **active** |
| V2 | Constellation | paused |
| V3 | Lab | concept |
| V4 | Yugar Commons | concept |
| V5 | Muda | concept |
| ⬡ | Atlas Frames | active |

**← Este roadmap cobre V[N].**

Referência completa: Identidade v1.2 + PENTAGON.md
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

## 8 — Espirais PHI

Um projeto pode ter múltiplas espirais. Cada espiral é um ciclo completo de 7 fases Fibonacci (1-1-2-3-5-8-13). A segunda espiral nasce da completude da primeira — entropia vira seed.

### 8.1 Regra das 7 fases

Toda espiral tem **exatamente 7 fases**. Se o escopo não preenche 7, agrupar fases menores. Se precisa de mais que 7, quebrar em sub-espirais ou mover pra próxima espiral. A geometria não se negocia.

### 8.2 Espiral visual

```
         ·  (1)  [Fase 1 — Nome]
        —   (1)  [Fase 2 — Nome]
       △    (2)  [Fase 3 — Nome]
      □     (3)  [Fase 4 — Nome]
     ⬠      (5)  [Fase 5 — Nome]
    ⬡       (8)  [Fase 6 — Nome]
   ○        (13) [Fase 7 — Nome]
```

### 8.3 Formato de cada fase

```markdown
### [✅|◐|⚪] Fase N [geometria] Nome (effort: [fibonacci])
**Status:** done | em progresso (X/Y) | futuro
**Protocol:** [ver tabela abaixo]
**Commit:** [hash] (só se done)
**Escopo:** [Uma linha — o que esta fase entrega]

[Parágrafo de contexto — por que esta fase existe, o que ela desbloqueia. 2-3 linhas.]

Entregáveis:
- [x] [item concreto e verificável]
- [ ] [item concreto e verificável]

Notas: [debt, blockers, decisões relevantes — opcional]
```

### 8.4 Campo `protocol:`

Conecta o roadmap ao build protocol (ATOM.md §⬠). Declara quais agentes a fase precisa.

| Valor | Agentes | Quando usar |
|-------|---------|-------------|
| `inner` | GUARDIÃO | Decisão arquitetural, spec, validação de schema |
| `foundation` | GUARDIÃO → ROOT | Nova tabela, schema, tipos — sem UI ainda |
| `logic` | GUARDIÃO → ROOT → ESTRUTURA | Backend completo, sem interface |
| `full` | GUARDIÃO → ROOT → ESTRUTURA → INTERFACE → TEIA | Feature completa |
| `surface` | INTERFACE | Visual, layout, animação — sem tocar dados |

**Regra:** se a fase tem entregáveis de camadas diferentes, declara o mais alto necessário.

### 8.5 Múltiplas espirais

```markdown
## Espiral 1 — [Nome] ([tema])

**Status:** completa ○ | em andamento | planejada
**Princípio:** [Uma frase — o que esta espiral entrega]

[espiral visual + 7 fases]

---

## Espiral 2 — [Nome] ([tema])

**Status:** [...]
**Princípio:** [...]

[espiral visual + 7 fases]
```

Cada espiral é auto-contida. A seed da próxima nasce da completude da anterior.

### 8.6 Regras das fases

1. **Cada camada contém todas as anteriores.** O triângulo não existe sem a linha.
2. **Effort é proporção, não dias.** F1(1) vs F7(13) = 13x mais complexo.
3. **7 fases por espiral.** Geometria completa ou não é espiral.
4. **Nomes refletem o que a fase entrega**, não um número genérico.
5. **Geometrias são fixas:** · — △ □ ⬠ ⬡ ○
6. **Status indicators:** ✅ done, ◐ em progresso, ⚪ futuro

---

## 9 — Seeds

Seeds são as sementes da próxima espiral. Nascem da completude da espiral atual. Listadas como ideias — sem geometria, sem effort, sem protocol. Ganham forma quando a espiral atual fecha.

```markdown
## Seeds — Espiral [N+1]

Nascem da completude da Espiral [N]. Não detalhadas até lá.

- **[Nome]:** [Uma frase — o que é]
- **[Nome]:** [Uma frase — o que é]
```

---

## 10 — Como Claude Code usa este roadmap

```
1. Ler CLAUDE.md (build protocol) — entender os agentes
2. Ler o roadmap — identificar fase atual (status: em progresso)
3. Ler o campo protocol: da fase → saber qual sequência de agentes invocar
4. Ler os entregáveis — saber o que produzir
5. Executar na ordem: dentro pra fora
```

**Nenhuma inferência necessária.** O roadmap declara. O build protocol executa.

---

## 11 — Dependências cruzadas

```markdown
## Dependências

| Este projeto precisa de | Projeto | Status |
|------------------------|---------|--------|
| [o quê] | V[N] [nome] | ready | blocked | na |

| Outros projetos dependem deste | Para quê |
|-------------------------------|----------|
| V[N] [nome] | [o quê] |
```

Se não há: `Atom não depende de ninguém. Todos dependem dele.`

---

## 12 — Métricas

Só métricas verificáveis. Atualizadas a cada fase fechada.

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

## 13 — Versionamento

Versão incrementa por mudança significativa, não por micro-patch. Evitar inflação (v6.0→v6.9 em 3 dias = problema).

```markdown
## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| N.N | YYYY-MM-DD | [O que mudou — uma linha] |
```

**Regra de versão:** incremento minor (.1) por fase fechada ou decisão estrutural. Incremento major (N.) quando espiral fecha ou roadmap é reestruturado.

---

## 14 — Checklist de validação

### Estrutura
- [ ] Seções obrigatórias presentes na ordem correta?
- [ ] Header completo?
- [ ] Pentágono referencia Identidade (não duplica)?
- [ ] Espiral PHI com geometrias corretas (· — △ □ ⬠ ⬡ ○)?
- [ ] Fibonacci (1-1-2-3-5-8-13)?
- [ ] Exatamente 7 fases por espiral?

### Executabilidade
- [ ] Toda fase tem campo `protocol:` preenchido?
- [ ] Valor de `protocol:` é um dos 5 valores válidos?
- [ ] Entregáveis são concretos o suficiente para Claude Code executar sem inferência?

### Consistência
- [ ] Status das fases reflete a realidade?
- [ ] Métricas são verificáveis?
- [ ] Versionamento sem inflação?
- [ ] Referências a docs-lei usam versão atual?

### Cross-check
- [ ] PENTAGON.md atualizado na mesma commit?
- [ ] Nenhum conflito com outros roadmaps?

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 02 Abr 2026 | Documento inicial |
| 2.0 | 03 Abr 2026 | Campo `protocol:` conecta roadmap ao build protocol. Seção Claude Code. |
| 3.0 | 08 Abr 2026 | Múltiplas espirais (§8.5). 7 fases obrigatórias por espiral (§8.1). Seeds como seção separada (§9). Pentágono referencia Identidade em vez de duplicar (§5). Regra anti-inflação de versão (§13). Referências atualizadas: Genesis v5.0.4, Meta-Template v1.2, ATOM.md v1.2. |

---

*O roadmap PHI não é só plano — é instrução. Legível por humanos. Executável por agentes.*
*A geometria é perfeita quando nasce de dentro pra fora e não precisa ser explicada.*
