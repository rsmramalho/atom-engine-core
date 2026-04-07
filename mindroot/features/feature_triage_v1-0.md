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
║            #pilar-action, #ai]       ║
║ source:   claude-project             ║
║ created:  2026-04-05                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4 §3.1 ║
║   → derives: feature_captura        ║
║   → feeds: feature_pipeline         ║
╚══════════════════════════════════════╝

# Feature: Triage

**Versão:** 1.0
**Data:** 05 Abr 2026
**Status:** live
**Wireframe:** `design/wireframes/mindroot-wireframe-triage-pipeline-v2.html`

---

## 1. Identidade

Motor de classificação — IA propõe, humano decide.

---

## 2. Propósito

O Triage resolve o dilema central: classificar no momento da captura (fricção) ou capturar sem estrutura (lixo). A IA classifica com 3 faixas de confiança. Alta confiança = auto-classifica. Média = sugere. Baixa = aguarda humano. Threshold diferente pra tipos acionáveis (95%) vs passivos (90%) — classificar errado uma task é esquecimento, uma nota é incômodo.

**Genesis §3.1:** "O threshold reflete o risco."

---

## 3. Não é

- **Não é Pipeline.** Triage é o motor (estágios 1→2→3). Pipeline é a visualização da esteira inteira (1→7).
- **Não é batch processing.** Triage é item por item, com contexto. Não é "classificar 50 de uma vez".
- **Não é substituição humana.** IA sugere. Humano confirma ou corrige. Sempre.

---

## 4. Estado atual

- Edge function `triage-classify` com Claude Haiku (deployed, 135 LOC)
- 3 faixas: auto (≥90/95%), sugere (60-89/94%), manual (<60%)
- Threshold diferenciado (acionáveis vs passivos)
- Fallback: item fica no inbox se edge function falha
- Roda automaticamente via usePipeline

### Gap

- ItemDetail chips clicáveis (type/module/status editáveis inline — correção manual pós-triage)

### Arquivos

```
src/service/triage-service.ts
src/hooks/useTriage.ts
supabase/functions/triage-classify/index.ts
```

---

## 5. Visão

- Triage aprende com correções (feedback loop — IA vê que humano mudou type:note pra type:task)
- Batch triage visual: cards empilhados, swipe confirma/pula
- Triage de conectores: items vindos de Gmail/Calendar já entram com sugestão de type
- Confidence display: barra de confiança visível no card de triage

---

## 6. Conexões

| Com | Relação | Detalhe |
|-----|---------|---------|
| Pipeline | belongs_to | Triage opera nos estágios 1→3 do Pipeline |
| Captura | feeds | Captura cria item → Triage classifica |
| Conectores | feeds | Items de conectores passam pelo Triage |
| Companheiro | references | Companheiro pode classificar via conversa |

---

## 7. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 05 Abr 2026 | Documento inicial |
