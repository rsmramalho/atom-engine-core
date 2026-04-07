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
║            #pilar-action]            ║
║ source:   claude-project             ║
║ created:  2026-04-05                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4 §5   ║
║   → feeds: feature_graph            ║
╚══════════════════════════════════════╝

# Feature: Projects

**Versão:** 1.0
**Data:** 05 Abr 2026
**Status:** live
**Wireframe:** `design/wireframes/mindroot-wireframe-projects.html`

---

## 1. Identidade

Pentágono pessoal — work em progresso, visível e conectado.

---

## 2. Propósito

Projects é onde o trabalho ganha corpo. Cada project é um AtomItem (type=project, piso 5 — precisa de connections pra existir). Progress bar, items conectados, next action, links. O Pentágono do Rick (Atom, MindRoot, Constellation, Muda, Yugar, Atlas) vive aqui — cada vértice é um project no MindRoot.

---

## 3. Não é

- **Não é Monday.com.** Atlas Frames usa Monday. Projects no MindRoot é pra projetos pessoais + Pentágono.
- **Não é Gantt chart.** Sem timeline visual. Progress é milestone ou auto-calculated.
- **Não é substituição de spec.** Project mostra overview. Specs são items conectados ao project (type:spec).

---

## 4. Estado atual

- Page `/projects` com cards de projetos (título, status, progress bar, next, stats)
- Project detail com items conectados + links
- Botão "+ criar projeto"
- Progress: auto (conta items completed / total) ou milestone
- Cards com cor de módulo

### Arquivos

```
src/pages/Projects.tsx
src/hooks/useProject.ts
```

---

## 5. Visão

- Project templates (projeto de construção, projeto de software, projeto pessoal)
- Project timeline: milestones como nós numa linha temporal
- Project dashboard: métricas específicas (velocity, burndown — se fizer sentido)
- Sub-projects via connections (project → belongs_to → project pai)
- Atlas Frames como project no MindRoot (sync bidirecional com Monday — futuro distante)

---

## 6. Conexões

| Com | Relação | Detalhe |
|-----|---------|---------|
| Library | references | Items do project aparecem na Library |
| Graph | feeds | Project = cluster no graph (items do mesmo project_id) |
| Pipeline | references | Items do project passam pelo Pipeline |
| Raiz | references | Domínio "projetos" no Raiz mostra saúde dos projects |

---

## 7. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 05 Abr 2026 | Documento inicial |
