╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   work                       ║
║ state:    connected                  ║
║ status:   active                     ║
║ stage:    5 ⬠ Pentagono              ║
║ tags:     [#feature, #boca,          ║
║            #pilar-time, #calendar]   ║
║ source:   claude-project             ║
║ created:  2026-04-05                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → belongs_to: feature_conectores  ║
║   → references: Genesis v5.0.4      ║
╚══════════════════════════════════════╝

# Feature: Calendar

**Versão:** 1.0
**Data:** 05 Abr 2026
**Status:** live
**Wireframe:** `design/wireframes/mindroot-wireframe-calendar.html`

---

## 1. Identidade

Tempo — rituais visíveis, compromissos integrados.

---

## 2. Propósito

O Calendar não é Google Calendar dentro do MindRoot. É a view de tempo do Genesis — mostra ritual bands (aurora/zênite/crepúsculo), eventos sincronizados do Google Calendar, e o wrap do dia como marcador. O tempo pertence ao humano. O Calendar mostra como o tempo está sendo usado vs como deveria ser usado (ritual do Marco Zero).

---

## 3. Não é

- **Não é Google Calendar.** Não cria eventos (leitura apenas — Espiral 2). Ações são Espiral 3.
- **Não é to-do list com datas.** Tasks com deadline vivem no Pipeline. Calendar mostra blocos de tempo.
- **Não é agenda genérica.** É view de rituais + eventos. Aurora/zênite/crepúsculo são cidadãos de primeira classe.

---

## 4. Estado atual

- Page `/calendar` com ritual bands (aurora, zênite, crepúsculo)
- Eventos do Google Calendar sincronizados via edge function
- Today's wrap indicator
- Real ritual slot grouping
- Removido do BottomNav (substituído por Library)

### Gaps

- Timezone: UTC → Australia/Brisbane
- Eventos recorrentes do ritual como eventos reais no Google Calendar (Espiral 3)

### Arquivos

```
src/pages/Calendar.tsx
supabase/functions/calendar-sync/
```

---

## 5. Visão

- Timezone fix (date-fns-tz ou Intl.DateTimeFormat)
- Week view com ritual bands coloridos
- Conflito visual: quando um evento invade um bloco de ritual, mostra alerta sutil
- Recurring AtomItems (habits, rituals) com RRULE → push pro Google Calendar (Espiral 3)
- Calendar como fonte de "tempo disponível" pro Companheiro sugerir tasks

---

## 6. Conexões

| Com | Relação | Detalhe |
|-----|---------|---------|
| Conectores | belongs_to | Calendar sync é um conector (Google Calendar API) |
| Wrap | references | Wrap indicator no dia atual |
| Soul | references | Ritual bands espelham aurora/zênite/crepúsculo do Soul |
| Raiz | references | Domínio "tempo" no Raiz reflete estado do Calendar |

---

## 7. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 05 Abr 2026 | Documento inicial |
