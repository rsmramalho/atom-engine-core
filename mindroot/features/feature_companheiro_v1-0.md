# Feature: Companheiro

**Versão:** 0.1
**Data:** 05 Abr 2026
**Status:** futuro (F5 Espiral 2)
**Wireframe:** `design/wireframes/mindroot-wireframe-ai-companion.html`

---

## 1. Identidade

IA contextual — o sistema pensando em voz alta.

---

## 2. Propósito

O Companheiro é o Claude operando dentro do MindRoot. Não é chatbot genérico. É o sistema pensando — com Genesis como contrato, Marco Zero como contexto, Raiz como mapa, dados do usuário como memória. Sabe o que existe (Raiz), o que entrou (Conectores), o que foi classificado (Triage), e o que está conectado (Graph). Sugere, não decide.

**Marco Zero §4.1:** "Abre o Project Atom. Digita 'bom dia'. Claude te diz onde tu parou e o que tá pendente."

---

## 3. Não é

- **Não é ChatGPT.** Não responde perguntas genéricas. Opera no contexto do Rick e do sistema.
- **Não é automação.** Sugere ações, não executa sem autorização.
- **Não é coach.** Não dá conselhos de vida. Observa padrões, oferece espelho.
- **Não é always-on.** Aparece quando tem algo útil a dizer. Silêncio é válido.

---

## 4. Estado atual

- FAB companion (ícone ○) presente nas telas (wireframe)
- Wireframe completo: chat interface, context cards, sugestões inline
- Page `/companion` scaffolded mas sem funcionalidade
- Nenhuma integração com IA no companion (Triage usa IA, mas é feature separada)

---

## 5. Visão

### F5 Espiral 2

- Interface de conversa dentro do MindRoot
- Contextual: sabe inbox count, stale items, soul patterns, domain health
- Nudges: "3 dias sem wrap", "domínio finance vazio", "12 items no inbox"
- Propõe wrap baseado nos items do dia
- Propõe aurora baseado no último wrap + domain health
- Classifica items via conversa ("isso é uma task ou uma note?")
- Sugere connections ("esse item parece se conectar com [X]")

### Espiral 3

- Captura por voz: Web Speech API → texto → conversa → item
- Companion como intermediário de ações (Escudo): "manda esse email", "cria esse evento"
- Proactive: "você tem um exame amanhã, quer que eu prepare um reminder?"

### Longo prazo

- Companion por contexto (casa, workshop, commons — Yugar Vision §6)
- Companion com memória de longo prazo (patterns across wraps)
- Companion como interface pra família ("Flora, quer adicionar algo no meal plan?")

---

## 6. Conexões

| Com | Relação | Detalhe |
|-----|---------|---------|
| Raiz | references | Lê domain health pra sugerir próximo passo |
| Soul | references | Lê soul patterns pra calibrar tom |
| Wrap | feeds | Propõe wrap, puxa items do dia |
| Triage | references | Pode classificar items via conversa |
| Graph | references | Sugere connections baseado no grafo |
| Captura | feeds | Captura por voz via Companheiro (futuro) |

---

## 7. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 0.1 | 05 Abr 2026 | Documento inicial — visão, sem implementação |
