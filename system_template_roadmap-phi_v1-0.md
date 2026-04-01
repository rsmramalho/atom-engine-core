# Roadmap PHI — Meta-Template v1.0
## O Molde dos Roadmaps

**Versão:** 1.0
**Data:** 02 Abr 2026
**Status:** Definitive
**Referência:** Genesis v5 + Meta-Template v1.1
**Princípio:** Se a geometria deste template estiver perfeita, todo roadmap que nascer dele herda essa geometria.

---

## 1 — O que é isto

Este documento define a ESTRUTURA EXATA que todo roadmap do Pentágono segue. Não é um exemplo — é o contrato. Qualquer agente que receba este template pode gerar ou auditar o roadmap de qualquer projeto automaticamente.

O formato PHI emergiu do MindRoot v2 — inventário + espiral Fibonacci + dependências. A proporção áurea não foi adicionada ao design — emergiu dele. Agora vira padrão.

**Regra:** mexeu num roadmap → cross-check no master (PENTAGON.md).

---

## 2 — Estrutura obrigatória

Todo roadmap PHI contém estas seções, nesta ordem:

```
1. Header
2. Visão geral
3. Posição no Pentágono
4. Infraestrutura — estado atual
5. Inventário (quando aplicável)
6. Fases PHI (espiral Fibonacci)
7. Dependências cruzadas
8. Métricas atuais
9. Regras do roadmap
10. Versionamento
```

Seções vazias são omitidas (ex: projeto novo não tem inventário).

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

Descreve O QUE é o projeto em 2-4 linhas. Inclui:
- O que é
- Repo(s) + deploy URL (se aplicável)
- Infra principal (Supabase ID, serviços)

```markdown
## Visão geral

[Descrição curta do projeto]

Repo: [URL]
Deploy: [URL]
Infra: [detalhes]
```

---

## 5 — Posição no Pentágono

Tabela padrão mostrando onde este projeto se encaixa. V1 é sempre o centro. Highlight na linha do projeto atual.

```markdown
## Pentágono

| Vértice | Projeto | Status | Descrição |
|---------|---------|--------|-----------|
| V1 (centro) | **Atom HS** | active | Hub. Sistema humano pessoal. |
| V2 | Constellation OS | paused | Infraestrutura operacional |
| V3 | Atlas Frames | active | Negócio físico |
| V4 | Muda | concept | Comunidade |
| V5 | Yugar Commons | concept | Mt Samson |
| V6 | Atlas/Yugar Lab | concept | Playground. Experimentação. |

**← Este roadmap cobre V[N].**
```

---

## 6 — Infraestrutura

Estado real do que está deployed/pronto. Sem planos — só fatos.

```markdown
## Infraestrutura — estado atual

### [Sistema] (deployed ✓ | parcial ⚠ | pendente ✗)

- [item]: [status]
- [item]: [status]
```

---

## 7 — Inventário

Só existe quando o projeto tem assets pré-existentes que precisam ser avaliados (rebuild, migração, absorção). Projetos novos do zero omitem esta seção.

Três categorias:

```markdown
## Inventário

### ✅ Levar
| Asset | Linhas | Veredicto |
|-------|--------|-----------|
| [arquivo/recurso] | [N] | [por quê] |

### ⚠️ Avaliar
| Asset | Linhas | Veredicto |
|-------|--------|-----------|
| [arquivo/recurso] | [N] | [condição] |

### ❌ Não levar
| O que | Motivo |
|-------|--------|
| [item] | [por quê] |
```

---

## 8 — Fases PHI (espiral Fibonacci)

A espiral segue a proporção áurea: 1-1-2-3-5-8-13. Cada fase contém todas as anteriores. O esforço não é tempo — é proporção relativa.

### 8.1 Visualização da espiral

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
**Commit:** [hash] (só se done)
**Escopo:** [Uma linha descrevendo o que esta fase entrega]

Entregáveis:
- [item concreto e verificável]
- [item concreto e verificável]

[Notas opcionais: debt, blockers, decisões]
```

### 8.3 Regras das fases

1. **Uma fase por vez.** Não começar a próxima sem terminar a atual.
2. **Cada camada contém todas as anteriores.** O triângulo não existe sem a linha.
3. **Effort é proporção, não dias.** F1(1) vs F7(13) = 13x mais complexo.
4. **7 fases máximo.** Se o projeto precisa de mais, está grande demais — quebrar em sub-projetos.
5. **Nomes são livres** mas devem refletir o que a fase entrega, não um número genérico.
6. **Geometrias são fixas:** · — △ □ ⬠ ⬡ ○ (Genesis v5, 7 estágios).

---

## 9 — Dependências cruzadas

Mapa de dependências com outros projetos do Pentágono.

```markdown
## Dependências

| Este projeto precisa de | Projeto | Status |
|------------------------|---------|--------|
| [o quê] | V[N] [nome] | [ready/blocked/na] |

| Outros projetos dependem de | Para quê |
|-----------------------------|----------|
| V[N] [nome] | [o quê] |
```

Se não há dependências: `Nenhuma dependência cruzada neste momento.`

---

## 10 — Métricas

Estado quantitativo real. Só métricas verificáveis.

```markdown
## Métricas atuais

| Métrica | Valor |
|---------|-------|
| Commits | [N] |
| Files | [N] |
| LOC | [N] |
| [métrica específica do projeto] | [valor] |
```

Métricas variam por projeto. O mínimo é: commits, files, LOC (quando tem código). Projetos conceituais podem ter: docs, decisões, specs.

---

## 11 — Regras

Todo roadmap termina com regras. As 4 primeiras são universais. Pode adicionar regras específicas.

```markdown
## Regras do roadmap

1. **Uma fase por vez.** Não começar a próxima sem terminar a atual.
2. **De dentro pra fora.** Cada camada contém todas as anteriores.
3. **Mexeu aqui → cross-check no master.** PENTAGON.md reflete toda mudança.
4. **Este documento é a referência.** Se não está aqui, não está planejado.
5. [Regra específica do projeto]
```

---

## 12 — Versionamento

```markdown
## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| [N.N] | [data] | [o que mudou] |
```

---

## 13 — Checklist de validação

Antes de commitar qualquer roadmap, cross-check:

### Estrutura
- [ ] Todas as seções obrigatórias presentes na ordem correta?
- [ ] Header completo (versão, data, status, princípio)?
- [ ] Tabela Pentágono com V1 no centro e highlight do projeto atual?
- [ ] Espiral PHI com geometrias corretas (· — △ □ ⬠ ⬡ ○)?
- [ ] Esforço Fibonacci (1-1-2-3-5-8-13)?

### Consistência
- [ ] Status das fases reflete a realidade (não otimismo)?
- [ ] Métricas são verificáveis (não estimativas)?
- [ ] Dependências cruzadas batem com os roadmaps dos outros projetos?
- [ ] Versionamento inclui a mudança atual?

### Cross-check
- [ ] PENTAGON.md atualizado pra refletir esta mudança?
- [ ] Nenhum conflito com roadmaps de outros projetos?
- [ ] Nome do projeto bate com o Pentágono?

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 02 Abr 2026 | Documento inicial. Formato PHI extraído do MindRoot v2 e generalizado. Pentágono com V1 centro + V6 Lab. |

---

*Este é o molde dos roadmaps. Se a geometria aqui estiver perfeita, todo roadmap que nascer herda essa perfeição.*
