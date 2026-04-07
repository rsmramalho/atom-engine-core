╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   bridge                     ║
║ state:    connected                  ║
║ status:   active                     ║
║ stage:    5 ⬠ Pentagono              ║
║ tags:     [#feature, #motor,         ║
║            #pilar-time, #ritual]     ║
║ source:   claude-project             ║
║ created:  2026-04-05                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4 §3.3 ║
║   → derives: feature_pipeline       ║
║   → feeds: feature_soul             ║
╚══════════════════════════════════════╝

# Feature: Wrap

**Versão:** 1.0
**Data:** 05 Abr 2026
**Status:** live
**Wireframe:** `design/wireframes/mindroot-wireframe-wrap.html`

---

## 1. Identidade

Ritual de fechamento — o commit do dia.

---

## 2. Propósito

O Wrap é o crepúsculo do sistema. Tudo que aconteceu no dia — items criados, modificados, decisões tomadas, conexões feitas — é consolidado num único commit. O Soul Layer registra emoções (aurora → crepúsculo). O Audit verifica saúde (inbox, pisos, órfãos). Seeds nascem de items em entropia. O Wrap é um AtomItem (type=wrap, state=committed, genesis_stage=7) — nasce completo.

**Marco Zero §2.3:** "17:00 — Atom wrap. Fechar o dia. MindRoot propõe wrap + audit completo. Rick confirma. Supabase commita."

---

## 3. Não é

- **Não é journal.** Wrap é commit técnico + emocional. Journal é reflexão livre (type:reflection na Library).
- **Não é retrospectiva.** Wrap é diário e rápido (5 min). Retrospectivas são reviews (type:review, periodicidade maior).
- **Não é obrigatório em dias vazios.** Se não criou/modificou nada, não tem wrap. O sistema não cobra.

---

## 4. Estado atual

- WrapComposer com 7 steps (wireframe: 7 steps = 7 estágios Genesis)
- Steps: Soul (aurora/crepúsculo) → Created → Modified → Decisions → Connections → Seeds → Audit
- Body JSONB estruturado (Genesis Part 3.4)
- Commit via `commit_item` RPC
- Wrap vive no Supabase como AtomItem

### Gaps

- aurora data (soul-store) não flui pro wrap body → shift = null
- Seção SOUL não renderiza no display
- NEXT section (obrigatória) não implementada como input

### Arquivos

```
src/pages/Wrap.tsx
src/service/wrap-service.ts
src/engine/wrap-engine.ts
src/store/wrap-store.ts
```

---

## 5. Visão

- Wrap proposto pelo Companheiro (auto-detecta items do dia)
- NEXT items viram inbox items automaticamente no dia seguinte
- Wrap exportável como ATOM ENVELOPE (Google Doc) ou .md (Obsidian)
- Wrap histórico: timeline de wraps passados com filtro por período
- Animação de completude: geometria · → ○ ao finalizar

---

## 6. Conexões

| Com | Relação | Detalhe |
|-----|---------|---------|
| Soul | belongs_to | Soul layer é step 1 do Wrap (aurora + crepúsculo) |
| Pipeline | references | Wrap commita items no estágio 7 |
| Library | feeds | Wraps commitados aparecem na Library |
| Companheiro | feeds | Companheiro propõe wrap baseado nos items do dia |
| Captura | feeds | NEXT do wrap vira items no inbox (futuro) |

---

## 7. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 05 Abr 2026 | Documento inicial — gaps documentados (soul flow, NEXT) |
