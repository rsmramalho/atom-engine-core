╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   work                       ║
║ state:    connected                  ║
║ status:   active                     ║
║ stage:    5 ⬠ Pentagono              ║
║ tags:     [#feature, #galho,         ║
║            #pilar-action, #grafo]    ║
║ source:   claude-project             ║
║ created:  2026-04-05                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4 §5   ║
║   → derives: feature_library        ║
╚══════════════════════════════════════╝

# Feature: Graph

**Versão:** 1.0
**Data:** 05 Abr 2026
**Status:** live

---

## 1. Identidade

Raio-x — a geometria real de tudo que entrou no sistema.

---

## 2. Propósito

O Graph é o estágio 5 (⬠ Pentágono) tornado visível. Cada item é um nó. Cada conexão é uma aresta. Módulos são cores. Relations são labels. O Graph mostra o que nenhuma lista mostra: como as coisas se conectam. "Esse ramen se conecta com o meal plan, que se conecta com saúde, que se conecta com o domínio body do Raiz."

---

## 3. Não é

- **Não é Obsidian Graph View.** Obsidian é export sob demanda. Este é o graph nativo do MindRoot, com dados do Supabase.
- **Não é diagrama estático.** É force layout interativo — nós se atraem e repelem.
- **Não é ferramenta de análise.** É visualização. Análise é Analytics.

---

## 4. Estado atual

- Page `/graph` com D3 force layout
- Nós coloridos por module (8 cores)
- Edges rotuladas por relation (8 AtomRelations)
- Filtro por module
- Interativo: drag, zoom, tap pra ver item

### Gap

- Filtro por domain Raiz (só tem module)

### Arquivos

```
src/pages/Graph.tsx
src/hooks/useConnections.ts
```

---

## 5. Visão

- Filtro por domain Raiz (#domain:*)
- Cluster automático por projeto (items do mesmo project_id agrupam)
- Timeline: slider temporal mostrando como o grafo cresceu
- Graph como onboarding visual: "olha o que você já construiu"
- Mini-graph no domain detail (Raiz): subgrafo do domínio

---

## 6. Conexões

| Com | Relação | Detalhe |
|-----|---------|---------|
| Library | references | Tap num nó abre ItemDetail (mesmo da Library) |
| Raiz | feeds | Raiz domain detail pode mostrar mini-graph |
| Pipeline | references | Graph mostra items no estágio 5+ (connected) |
| Analytics | feeds | Analytics connections tab usa dados do Graph |

---

## 7. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 05 Abr 2026 | Documento inicial |
