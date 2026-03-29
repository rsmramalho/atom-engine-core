# Atom Genesis v4 + AtomItem Schema v2
## O Contrato Universal do Atom Engine


**Versão:** 4.2
**Data:** 27 Mar 2026
**Status:** Definitive Spec — Marco Zero
**Evolução:** Genesis v1→v2→v3→v4 | Schema v1→v2
**Cross-check:** 2 rodadas Gemini (análise + BDD + framework) + fusão Claude + 17 gaps auditados e fechados (sessão 25 Mar)
**Princípio:** Este documento é a source of truth. Tudo que não está aqui não existe.


---


## Parte 1 — Filosofia


### O problema que resolve


A maioria dos sistemas de produtividade força estruturação prematura: ou o usuário classifica no momento da captura (criando fricção), ou captura sem estrutura (criando lixo). Não existe zona de maturação entre "tive uma ideia" e "isso é um item estruturado."


### A solução: Maturação Permissiva


O Atom Engine opera sob o princípio de que um item pode existir no sistema em diferentes níveis de maturidade, avançando apenas quando necessário, ou regredindo se perder seus requisitos de integridade. Cada type tem um piso mínimo — o estágio mais baixo em que pode repousar validamente. Abaixo do piso = alerta no audit. Acima do piso = maturação progressiva.


### Três leis


1. **O schema é o contrato, não o código.** Se amanhã troca o Supabase por Postgres puro, o Drive por Obsidian local, o Claude por outro LLM — o schema é o mesmo.
2. **Documentar é executar.** Cada wrap, checkpoint, spec — é trabalho real. Não é overhead.
3. **Nada se perde.** Entropia é reciclagem, não destruição. Mutação preserva identidade. O UUID é eterno.


---


## Parte 2 — Os 7 Estágios (State Machine)


### Pipeline de criação


| # | Geometria | Nome funcional | State (DB) | O que acontece | Gate de passagem |
|---|-----------|---------------|------------|----------------|-----------------|
| 1 | Ponto · | Captura | `inbox` | Texto bruto entra no sistema. Sem tipo, sem módulo, sem forma. | `title.length > 0` |
| 2 | Linha — | Intenção | `classified` | LLM infere type + module. Humano confirma. Item ganha direção. | `type` e `module` definidos |
| 3 | Triângulo △ | Estrutura | `structured` | Template aplicado. UUID gerado. Frontmatter core completo. Body tipado. | Schema-compliant. Campos core preenchidos |
| 4 | Quadrado □ | Fundação | `validated` | 4 portões validados. Naming convention. Prompt de conexão respondido. | Validação completa. Pode sustentar peso |
| 5 | Pentágono ⬠ | Conexão | `connected` | Connections tipadas inseridas. Item é parte do grafo. | ≥1 edge na tabela `item_connections` |
| 6 | Hexágono ⬡ | Ativação | `propagated` | Efeito registrado na fila de eventos. Cascata nos conectados. | ≥1 evento em `atom_events` |
| 7 | Círculo ○ | Completude | `committed` | Commit via wrap. Visível em todas as camadas. | Wrap commitado. Estado congelado |
| 7→ | Entropia | Decaimento | `archived` | Seeds extraídas. Item decompõe. Nó histórico no grafo. | Threshold de inatividade atingido (default: 30 dias) |


### Propriedades da state machine


- **Avanço:** sempre sequencial (1→2→3→4→5→6→7). Não pula estágio. **Exceção:** `wrap` e `session-log` nascem completos no estágio 7 ("born committed") — não passam pelo pipeline.
- **Regressão:** automática por perda de requisitos (ex: perde conexão → 5 volta pra 4).
- **Mutação:** morph() regride pro estágio 2 (re-classifica, re-estrutura, re-valida).
- **Entropia:** item inativo além do threshold (default: 30 dias) → seeds extraídas → `archived`. Nó permanece no grafo.
- **Estágio 6 opcional:** items podem ir do 5 direto pro 7 via wrap. Propagação só acontece quando a conexão gera efeito cascata real. Sem cascata = sem estágio 6.
- **Ciclo:** completude gera seeds. Seeds são novos pontos (estágio 1). Fibonacci: cada completude alimenta novas gêneses.


### 4 Portões de integridade (estágio 4)


1. **Atom sempre ativo** — item registrado no sistema, não descartado
2. **Template first** — body_schema existe pro type. Se não existe, criar antes. Templates nascem do uso: o primeiro item de um type cria o template ao vivo. Não é necessário definir templates abstratamente antes de ter items reais.
3. **Commit obrigatório** — item será incluído no próximo wrap. Wrap commita items no estágio 3+ (piso do type respeitado).
4. **Connections sugeridas** — no estágio 4, o agente pergunta "isso se conecta com algo?" (resposta pode ser "não"). O prompt acontece aqui, a conexão efetiva move pro estágio 5.


### Piso mínimo por type


| Type | Piso | Lógica |
|------|------|--------|
| note, reflection | 2 (Linha) | Precisa de type/module pra existir |
| recommendation, podcast, article | 2 (Linha) | "Vi, gostei" + saber o que é |
| resource, list | 2 (Linha) | Saber o que é basta |
| task, habit | 3 (Triângulo) | Precisa de template pra existir no backlog |
| recipe, workout | 3 (Triângulo) | Template completo. Connections são bônus |
| checkpoint | 3 (Triângulo) | Documento estruturado |
| spec | 5 (Pentágono) | Spec sem connections não especifica nada |
| project | 5 (Pentágono) | Sem connections = ideia, não projeto |
| session-log, wrap | 7 (Círculo) | Nasce completo por definição |


**Regra:** item abaixo do piso gera alerta no audit. Não é bloqueio — é nudge.


---


## Parte 3 — Motores de Automação


### 3.1 Auto-Triage Engine (Estágio 1→2→3)


Motor de IA que analisa texto bruto e aplica classificação com 3 faixas de confiança:


| Confiança | Ação | Tipos afetados |
|-----------|------|----------------|
| ≥ 90% (passivos) / ≥ 95% (acionáveis) | Auto-classifica. Pula pra estágio 3. | Todos |
| 60% — 89% / 94% | Sugere na UI. Humano confirma em 1 toque. | Todos |
| < 60% | Aguarda triagem manual do usuário. | Todos |


**Tipos acionáveis** (threshold 95%): task, project, spec, habit.
**Tipos passivos** (threshold 90%): note, reflection, recommendation, podcast, article, resource, list, recipe, workout.


**Princípio:** classificar errado uma nota é incômodo. Classificar errado uma task é esquecimento. O threshold reflete o risco.


### 3.2 FSM — Finite State Machine (Downgrades)


Triggers no PostgreSQL que mantêm integridade:


| Evento | Downgrade | Lógica |
|--------|-----------|--------|
| Item perde última connection | `connected` → `validated` (5→4) | Sem edges = não está no grafo |
| morph() executado | Volta pra `classified` (→2) | Novo type precisa re-estruturar e re-validar |
| Projeto pai deletado | Items filhos perdem `project_id` | `project_id = NULL`, flag no audit |


### 3.3 Atom Wrap (Controle de Entropia)


Ritual de encerramento de sessão:


1. O agente propõe wrap com todos os items criados/modificados
2. Varredura em items no estágio 7 que atingiram threshold de inatividade (default: 30 dias)
3. Extrai seeds (decisões, learnings, intenções pendentes) pra bandeja temporária
4. O usuário aprova quais seeds viram novos pontos (estágio 1). Seeds rejeitadas → `state: archived` com tag `#seed:rejected`. Nó permanece no grafo.
5. O agente executor commita no Drive + Supabase
6. Seção SOUL registra emoções (aurora → crepúsculo)
7. Seção AUDIT registra estado do Drive


**Princípio:** o usuário decide quais seeds vivem. Automação extrai, humano aprova.


### 3.4 Formato Estruturado do Wrap


O wrap é o ritual de commit. Toda sessão produtiva termina com um wrap que segue este formato:


```
═══ ATOM WRAP — [DD Mon YYYY] ([ritual_slot]) ═══


CREATED:
  - [genesis_stage] type:[type] "[título]" → [destino no Drive]


MODIFIED:
  - [item] → [campo]: [valor anterior] → [valor novo]


DECIDED:
  - "[decisão em linguagem natural]"


CONNECTIONS:
  - [item A] → [relation] → [item B]


SEEDS:
  - "[seed extraída de item em entropia]" → [aprovado | descartado]


SOUL:
  aurora: [emoção] | energy: [high|medium|low]
  intention: "[frase do foco do dia]"
  ---
  [task significativa] → [emoção depois]
  ---
  crepusculo: [emoção] | energy: [high|medium|low]
  shift: [emoção aurora] → [emoção crepúsculo]


AUDIT:
  inbox: [N items]
  below_floor: [N items] → [lista se > 0]
  orphans: [N items] → [lista se > 0]
  stale: [N items no inbox > 7 dias]


NEXT:
  - [ ] [próximo passo concreto]


═════════════════════════════════════════════
```


**Regras do wrap:**
- Seções vazias são omitidas
- SOUL é opcional
- AUDIT roda automaticamente
- SEEDS só aparece se houve entropia na sessão
- NEXT é obrigatório
- O wrap é um AtomItem: type=wrap, state=committed, genesis_stage=7 (nasce completo)


---


[Partes 4-12 continuam com o conteúdo completo do v4.2 conforme o documento anexo]