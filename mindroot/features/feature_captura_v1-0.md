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
║            #pilar-action]            ║
║ source:   claude-project             ║
║ created:  2026-04-05                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4 §2,§3║
║   → feeds: feature_pipeline         ║
║   → feeds: feature_triage           ║
╚══════════════════════════════════════╝

# Feature: Captura

**Versão:** 1.0
**Data:** 05 Abr 2026
**Status:** live
**Wireframe:** `design/wireframes/mindroot-wireframe-home.html` (AtomInput)

---

## 1. Identidade

Ponto de entrada — texto vira item em 2 segundos.

---

## 2. Propósito

A captura é o estágio 1 do Genesis — o ponto (·). Uma frase, sem classificação, sem organização. "Experimentar aquele ramen do centro." Pronto. O Triage cuida do resto. A captura deve ser tão rápida quanto um pensamento. Se demora mais que 2 segundos, o pensamento se perdeu.

**Marco Zero §4.2:** "Captura rápida: abre o Atom, digita uma frase. Não classifica. Não organiza. Volta pro que tava."

---

## 3. Não é

- **Não é formulário.** Sem campos obrigatórios, sem dropdown, sem categorias. Uma caixa de texto.
- **Não é chat.** Captura é unidirecional. Você despeja, o sistema absorve. Sem resposta.
- **Não é nota.** Captura é efêmera. A nota é o item que nasce depois que o Triage classifica.

---

## 4. Estado atual

- AtomInput na Home (campo de captura rápida)
- Toast "Item capturado" após envio
- Badge inbox no BottomNav atualiza
- Item criado no Supabase: state=inbox, genesis_stage=1
- Triage roda automaticamente após captura

### Arquivos

```
src/components/home/AtomInput.tsx
src/hooks/useItemMutations.ts (create)
```

---

## 5. Visão

- Captura por voz: Web Speech API → texto → item (Espiral 3)
- Captura via email: forward pra atom@ramalho.au → inbox (Espiral 3)
- Captura offline: queue local → sync quando online
- FAB flutuante em todas as telas (não só Home)
- Captura contextual: se está na Library com filtro body, item ganha tag #mod_body automaticamente

---

## 6. Conexões

| Com | Relação | Detalhe |
|-----|---------|---------|
| Pipeline | feeds | Captura cria item no estágio 1 |
| Triage | feeds | Triage classifica o item capturado |
| Home | belongs_to | AtomInput vive na Home |
| Conectores | mirrors | Conectores são "captura automática" (Gmail, Calendar, filesystem) |

---

## 7. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 05 Abr 2026 | Documento inicial |
