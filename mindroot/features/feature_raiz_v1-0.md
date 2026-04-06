# Feature: Raiz

**Versão:** 1.0
**Data:** 05 Abr 2026
**Status:** live
**Wireframe:** `design/wireframes/mindroot-wireframe-raiz-dashboard.html` + `mindroot-wireframe-raiz-onboarding.html`
**Decisões UX:** D67–D74

---

## 1. Identidade

Guardião da vida — diagnóstico dos 9 domínios da existência digital.

---

## 2. Propósito

A primeira pergunta que o sistema faz não é "o que você quer fazer?" — é "o que existe na sua vida?". Raiz mapeia, monitora e protege. É o checkup permanente. Quando um domínio regride, o Raiz avisa. Quando um domínio avança, o Raiz celebra. Junto com o Atom Agent (filesystem) e os Conectores (APIs), é o guardião que garante que tudo está no lugar certo o tempo todo.

**Marco Zero:** "Rick não quer ser mais produtivo. Quer ser mais presente." O Raiz é presença — saber onde você está antes de decidir pra onde ir.

---

## 3. Não é

- **Não é a Library.** Raiz mostra items dentro do contexto de saúde de um domínio (stage bar, regressão, gates). Library mostra items como acervo universal pra busca e consumo.
- **Não é onboarding descartável.** Raiz é feature permanente — o onboarding é a primeira vez que o Raiz roda, não uma tela separada que desaparece.
- **Não é tab no BottomNav.** Acessível via Home (mini-card) ou Settings. Não compete por espaço na nav principal (D74).
- **Não é ferramenta de produtividade.** Não tem "criar task", "agendar", "priorizar". Isso é Pipeline, Calendar, Triage. Raiz observa e diagnostica.

---

## 4. Estado atual

### O que existe (código live)

- Raiz como page fixa (`/raiz`)
- 9 domínios configurados em `src/config/raiz.ts` (identity, documents, health, finance, storage, memories, time, communication, projects)
- 3 portas de entrada: micro (3 domínios), standard (6), deep (9)
- Inventário por domínio: captura de items com tag `#domain:[key]`
- Panorama 3×3: grid dos 9 domínios com status
- Hook `useRaiz`: query items por domínio, calcula health
- Primeiro acesso: gate via `user_metadata`
- Routine Builder: question flow por módulo, mini-wrap, overlay integrado (11 arquivos, 1044 LOC em `src/features/raiz/`)
- Tom gentil: "depois, talvez" em todo canto

### O que falta do wireframe

- Health ring com gradiente (4/9 domínios ativos) — hoje é grid, wireframe mostra ring + lista
- Stage bar por domínio (7 segmentos preenchidos por estágio)
- Regressão visual (alerta + domain row vermelho + badge "↓ regrediu")
- Domain detail como tela push (stage journey, items, gate, próximo passo)
- Rituais de manutenção (inbox zero semanal, review mensal, audit trimestral)
- "Próximo passo" sugerido pelo Companheiro (depende de F5)

### Arquivos

```
src/pages/Raiz.tsx
src/config/raiz.ts (RAIZ_DOMAINS)
src/hooks/useRaiz.ts
src/features/raiz/ (11 arquivos — Routine Builder)
```

---

## 5. Visão

### Curto prazo (Espiral 2)

- Health ring substituindo o grid 3×3
- Stage bar com 7 segmentos por domínio
- Regressão detectada automaticamente (estágio médio caiu entre audits)
- Domain detail com items + stage journey

### Médio prazo (Espiral 3)

- Atom Agent como braço físico do Raiz — filesystem organizado = domínio "arquivos" saudável
- Conectores alimentando domínios automaticamente (Calendar → tempo, Gmail → comunicação)
- Gates por domínio configuráveis ("pra identidade avançar pro ⬠, precisa de 2FA ativo")
- Rituais de manutenção como habits com Recurrence extension

### Longo prazo (Yugar Vision)

- Raiz expandido pra contextos da propriedade (sensores → domínio resources)
- Raiz como view compartilhada (família vê domínios deles)
- Raiz no touchscreen da casa (kiosk mode)

---

## 6. Conexões

| Com | Relação | Detalhe |
|-----|---------|---------|
| Library | feeds | Botão "ver na library →" no domain detail abre Library com filtro `#domain:*` |
| Conectores | feeds | Conectores alimentam domínios (Calendar→tempo, Gmail→comunicação, Agent→arquivos) |
| Companheiro | references | Companheiro gera "próximo passo" por domínio |
| Soul | mirrors | Raiz mostra saúde da vida, Soul mostra saúde emocional |
| Pipeline | references | Items do Raiz seguem pipeline Genesis normal |
| Routine Builder | belongs_to | Routine Builder vive dentro do Raiz |

---

## 7. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 05 Abr 2026 | Documento inicial — estado atual, visão, conexões com Library e Conectores |
