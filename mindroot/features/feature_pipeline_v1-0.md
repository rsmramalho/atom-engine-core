╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   work                       ║
║ state:    connected                  ║
║ status:   active                     ║
║ stage:    5 ⬠ Pentagono              ║
║ tags:     [#feature, #motor,         ║
║            #pilar-action, #fsm]      ║
║ source:   claude-project             ║
║ created:  2026-04-05                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4 §2   ║
║   → derives: feature_captura        ║
║   → feeds: feature_wrap             ║
╚══════════════════════════════════════╝

# Feature: Pipeline

**Versão:** 1.0
**Data:** 05 Abr 2026
**Status:** live
**Wireframe:** `design/wireframes/mindroot-wireframe-triage-pipeline-v2.html`

---

## 1. Identidade

Esteira Genesis — do ponto ao círculo, visível e tocável.

---

## 2. Propósito

O Pipeline é a materialização visual dos 7 estágios do Genesis. Cada item entra como ponto (·) e caminha até o círculo (○). O Pipeline mostra onde cada item está, quantos items existem por estágio, e permite mover items manualmente ou via triage. É o coração mecânico do sistema — sem ele, a state machine é invisível.

---

## 3. Não é

- **Não é Triage.** Triage é o motor de classificação (IA + humano). Pipeline é a visualização da esteira completa. Triage opera dentro do Pipeline (estágios 1→2→3).
- **Não é Library.** Pipeline mostra items em trânsito. Library mostra items que já chegaram (stage 2+).
- **Não é to-do list.** Pipeline não prioriza. Mostra estado no Genesis.

---

## 4. Estado atual

- Page `/pipeline` com stages horizontais
- Contadores por estágio
- Tap num estágio expande lista de items
- Cards clicáveis levam pro ItemDetail
- Triage integrado (AI classification via edge function)
- 3 faixas de confiança: auto (≥90/95%), sugere (60-89/94%), manual (<60%)
- Fallback: item fica no inbox se edge function falha

### Arquivos

```
src/pages/Pipeline.tsx
src/hooks/usePipeline.ts
src/service/pipeline-service.ts
src/service/triage-service.ts
```

---

## 5. Visão

- Swipe-to-triage (wireframe): swipe direita confirma, swipe esquerda pula
- Batch triage: classificar múltiplos items de uma vez
- Pipeline por módulo: filtrar a esteira por work, body, mind, etc.
- Animação: item avançando de estágio com transição visual (geometria cresce)

---

## 6. Conexões

| Com | Relação | Detalhe |
|-----|---------|---------|
| Triage | belongs_to | Triage opera nos estágios 1→2→3 do Pipeline |
| Captura | feeds | Captura cria items no estágio 1 → Pipeline mostra |
| Library | feeds | Items que passam do estágio 2 aparecem na Library |
| Wrap | references | Wrap commita items no estágio 7 |

---

## 7. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 05 Abr 2026 | Documento inicial |
