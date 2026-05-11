---
id: D-006
title: Claude assistente pessoal read-only via app Atom
date: 2026-05-08
status: accepted
deprecates: []
relates_to: [D-001, D-004, D-005]
authors: [Rick, Arca]
tags: [agents, ecosystem, topology, identity, read-only, ramalho]
---

# D-006 — Claude assistente pessoal read-only via app Atom

## Contexto

D-005 aposentou o Cockpit como agente operacional Claude.ai com MCP Supabase. Removeu a porta dos fundos. Mas a aposentadoria sozinha não responde a uma pergunta natural: **se o criador agora vive no Atom como usuário, qual o papel do Claude assistente na conta usuária?**

Em sessão arquitetural de 08 Mai 2026, Rick decidiu separar contas Claude.ai por perspectiva:

- **Esta conta (criador)** — onde se constrói o Atom. Arca + Claude Code + Cowork escopo dev. Sem captura pessoal, sem ritual diário, sem wrap de vida.
- **Conta `ramalho.au` (usuário)** — onde se vive no Atom. Primeiro usuário do produto. Captura, wrap, ritual diário acontecem no app.

A separação só funciona se as duas contas tiverem regras arquiteturais consistentes. D-006 define a regra para o Claude assistente da conta usuária: **read-only em relação ao Supabase, escrita exclusivamente via app**. Mesma lei que D-005 estabeleceu pra Cockpit/Cowork — universal.

Esta decisão também opera como **teste de canário do produto**: se o criador consegue viver no Atom com Claude assistente sem precisar de DML direto, qualquer pessoa consegue. Se não consegue, a fricção descoberta vira backlog do app, não justificativa pra reabrir porta dos fundos.

## Decisão

1. **Conta `ramalho.au` é a superfície do criador como usuário do Atom.** Captura, ritual aurora/zênite/crepúsculo, wrap diário, pipeline — tudo no app, em `mindroot.com.au`.

2. **Claude assistente pessoal opera nessa conta sob a constituição Atom.** Project Claude.ai dedicado, KB com os 4 docs-lei (Genesis v5.0.4, Marco Zero v3.1, Meta-Template v1.2, Identidade v1.3), instruções alinhadas.

3. **Read-only em relação ao Supabase de produção.** Sem MCP de DML, sob nenhuma justificativa.

4. **Leitura de dados acontece via interface oficial do Atom** — app, API pública (quando existir), ou compartilhamento manual no chat. Antes da API existir, contexto é compartilhado pelo usuário (copy/paste, screenshot, descrição). Quando o Atom expor API/MCP read-only oficial, esse caminho substitui o manual.

5. **Escrita exclusivamente via app.** Claude assistente pode propor, sugerir, formatar, estruturar texto bruto em formato de item — mas o commit final é o usuário fazendo no app. A "porta da frente" é única e indivisível.

6. **Funções legítimas do Claude assistente pessoal:**
   - Reflexão sobre o dia, semana, projeto
   - Estruturação de captura (texto bruto → item proposto que o usuário cola no app)
   - Sugestão de wrap (Claude propõe, usuário commita no app)
   - Conversação sob constituição Atom (Genesis, presença sobre produtividade)
   - Leitura de items existentes para contextualizar conversa (via compartilhamento manual ou API futura)

7. **Funções não permitidas:**
   - DML direto no Supabase, mesmo que MCP fosse tecnicamente possível
   - Bypass do app para qualquer fluxo de escrita
   - "Captura silenciosa" sem confirmação manual no app
   - Operar como agente autônomo que age sem o usuário intermediar

## Consequências

### Imediato

- Rick cria/loga conta Claude.ai com `r@ramalho.au`.
- Cria Project Claude.ai novo: "Atom — Pessoal" (ou similar).
- Sobe a KB com os 4 docs-lei.
- Configura system prompt mínimo declarando o escopo read-only.
- **Não conecta MCP Supabase.**
- Memória do Claude pessoal pode evoluir naturalmente conforme uso.

### Curto prazo

- Quando o Atom expor API pública ou MCP read-only oficial (spec futura), avaliar conectar.
- Identificar fricções de uso → backlog do app, não justificativa pra reabrir porta dos fundos.
- Documentar patterns de uso conforme aparecem (qual fluxo é melhor no Claude, qual no app).

### Médio prazo

- Spec `atom-public-api` (futura): define endpoints/MCP read-only que terceiros (e Claude pessoal) podem consumir. Esta decisão precede a spec.
- Modelo replicável: outras pessoas que tenham conta Claude.ai podem instalar "Atom Pessoal" como Project com a mesma KB e regras. Marketplace pode oferecer presets de instruções.

### Não muda

- **D-001** (separação A/B partition).
- **D-003** (mindroot-v2 branch canônico = master).
- **D-004** (Atom como produto único + Marketplace).
- **D-005** (Cockpit aposentado, Cowork sem DML produção).
- **Genesis v5.0.4, Marco Zero v3.1, Meta-Template v1.2, Identidade v1.3** — são os mesmos para qualquer conta sob a constituição Atom.
- **Esta conta (criador)** — Arca + Claude Code + Cowork escopo dev pontual permanecem.

## Alternativas consideradas

**Alt 1 — Sem Claude na conta `ramalho.au`, app puro.**
- Rejeitado: perde valor de companheiro reflexivo sob constituição Atom. Claude assistente tem função legítima desde que respeite a porta da frente.

**Alt 2 — Claude na `ramalho.au` com MCP DML em base separada (staging, não produção).**
- Rejeitado: cria base paralela, viola "single source of truth". Mesmo erro conceitual que o Cockpit cometeu — só com nome diferente.

**Alt 3 — Claude com MCP read-only direto no Supabase de produção.**
- Considerado, ressalvado: tecnicamente OK (sem write é seguro), mas requer auth/keys delicados que vazam contexto técnico pra superfície usuária. Solução mais limpa é API oficial do Atom quando existir. Por agora, leitura via compartilhamento manual; conectar MCP só quando API pública existir.

**Alt 4 — Claude pessoal idêntico a Arca (esta conta), só renomeado.**
- Rejeitado: papéis diferentes. Arca é arquiteto; Claude pessoal é companheiro reflexivo. Mesma constituição, funções diferentes. Confundir os dois traz de volta o problema do "Rick programador" vs "Rick humano" misturados.

## Documentos a atualizar

- [ ] `atom-engine-core/specs/ecosystem-agents` v1.2 → v1.3 (próxima rodada): adicionar "Claude pessoal read-only" como agente legítimo na conta usuária.
- [ ] System prompt do Project Atom Pessoal (na conta `ramalho.au`) — Rick configura conforme criar.
- [ ] Memória do Claude pessoal evolui organicamente conforme uso.

## Notas

- D-006 é **regra arquitetural**, não spec técnica. A implementação concreta (qual API, qual MCP, qual auth) é spec separada que vem depois.
- A regra única e universal agora é: **escrita SEMPRE via app, leitura via interface oficial**. Aplica-se a Cockpit (aposentado, D-005), Cowork (sem DML produção, D-005), e Claude pessoal (D-006). Sem exceções, sem zonas cinzentas.
- O Claude pessoal **completa a tese**: o criador vira usuário e prova o produto pelo uso real. Esse é o teste de canário mais honesto possível.
- D-005 + D-006 formam um par. D-005 fechou a porta dos fundos. D-006 abriu, com regras claras, a porta da frente para o assistente. As duas decisões juntas estabelecem a topologia final dos agentes Claude no ecossistema Atom.
- Esta decisão **não obriga** Rick a usar Claude pessoal — define o escopo se/quando ele criar. A conta `ramalho.au` pode existir sem Project Claude.ai algum, e isso é válido. D-006 só estabelece como será SE existir.

---

*A porta da frente é única. Quem entra, entra por ela. Quem sai, sai por ela.*
