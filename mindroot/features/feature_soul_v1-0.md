# Feature: Soul

**Versão:** 1.0
**Data:** 05 Abr 2026
**Status:** live
**Wireframe:** `design/wireframes/mindroot-wireframe-home.html` (SoulCard + AuroraCheckin)

---

## 1. Identidade

Camada emocional — presença sobre produtividade.

---

## 2. Propósito

O Soul Layer é a razão de existir do MindRoot. Não é feature — é princípio. Antes de perguntar "o que você vai fazer?", o sistema pergunta "como você está?". Três momentos: aurora (como chega), task significativa (como foi), crepúsculo (como sai). O shift aurora→crepúsculo é o dado mais importante do dia.

**Marco Zero §5:** "Nunca forçar. Linguagem livre. Task check-in só em peso > 1. Padrões, não julgamentos."

---

## 3. Não é

- **Não é terapia.** Soul Layer observa e registra. Não diagnostica, não prescreve, não julga.
- **Não é obrigatório.** "Bora trabalhar" sem emoção é válido. O sistema nunca insiste.
- **Não é gamification.** Sem streaks de "dias felizes", sem pontos de "bem-estar". É registro puro.
- **Não é mood tracker genérico.** É emoção no contexto de trabalho real — vinculado a items, wraps, decisões.

---

## 4. Estado atual

- AuroraCheckin: primeiro acesso do dia → emotion + energy + intention
- SoulCard na Home: orbe pulsante (aurora = dourado, crepúsculo = roxo) + emotion + energy
- soul-store (Zustand): guarda aurora data na sessão
- Wrap SoulStep: captura crepúsculo (emotion + energy)
- Analytics soul tab: energy trends (14d), emotion frequency, shift history

### Gaps

- aurora → wrap body flow (shift = null)
- task emotion_after prompt (peso > 1)

### Arquivos

```
src/components/home/AuroraCheckin.tsx
src/components/home/SoulCard.tsx
src/store/soul-store.ts
src/engine/soul-engine.ts
src/service/soul-service.ts (stub)
```

---

## 5. Visão

- Soul patterns: "você tende a começar ansioso e terminar satisfeito" (Companheiro observa)
- Emotion vocabulary cresce com uso (não é lista fixa — linguagem livre se repete e forma padrões)
- Soul no domain detail (Raiz): emotion associada a domínios específicos
- Voice check-in: "como você está?" via Web Speech API (Espiral 3)

---

## 6. Conexões

| Com | Relação | Detalhe |
|-----|---------|---------|
| Wrap | belongs_to | Soul é step 1 do Wrap |
| Home | belongs_to | SoulCard + AuroraCheckin vivem na Home |
| Analytics | feeds | Soul tab mostra trends e patterns |
| Raiz | mirrors | Raiz = saúde da vida, Soul = saúde emocional |
| Companheiro | references | Companheiro lê soul patterns pra sugerir ações |

---

## 7. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 05 Abr 2026 | Documento inicial |
