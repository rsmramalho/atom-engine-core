---
id: D-005
title: Aposentadoria do Cockpit como agente operacional
date: 2026-05-08
status: accepted
deprecates: [D-002]
relates_to: [D-001, D-004]
authors: [Rick, Arca]
tags: [agents, ecosystem, topology, supabase, mcp, deprecation]
---

# D-005 — Aposentadoria do Cockpit como agente operacional

## Contexto

D-002 (commit `17684bb`, 19 Abr 2026) nomeou o Cockpit Claude.ai como "DML executor" — agente operacional com MCP Supabase, autoridade pra inserir/atualizar/deletar AtomItems direto na base. À época, MindRoot ainda não estava pronto pra ser a única superfície de captura, e o Cockpit servia dois propósitos simultâneos:

1. **Simular o Atom Engine na prática** — testar Genesis, validar schema, popular items reais enquanto o app não existia.
2. **Operar a vida do criador** — capturar, ritualizar, fazer wrap diário, organizar, no intervalo até o app chegar.

Em 08 Mai 2026, três fatos convergiram para encerrar essa fase:

- **MindRoot LIVE** em `mindroot.com.au`, estável, em uso real (estabilizado em master após D-003).
- **D-004** declarou Atom como produto único — o app é a única "porta da frente". O conceito de produto não comporta porta dos fundos paralela.
- **Sessão arquitetural com Rick** identificou que Cockpit fazendo DML direto via MCP fere a tese: se MindRoot é a porta, ninguém passa por baixo dela. Quatro fontes de mutação independentes (Cockpit, Cowork, MindRoot, Claude Code) numa arquitetura que se promete "uma fonte de verdade" é frágil por design — depende de disciplina humana, não de estrutura.

Cockpit deixou de ser ponte de tempo e virou **fonte paralela de mutação**. Cumpriu o papel para o qual foi feito — não é falha, é fim de fase.

## Decisão

1. **D-002 (Cockpit como DML executor) está deprecada por D-005.**

2. **O Cockpit como agente operacional Claude.ai está aposentado.** Não há mais agente Claude.ai com MCP Supabase de leitura/escrita escrevendo na base de produção.

3. **MCP Supabase desconectado do Cockpit.** Project Claude.ai do Cockpit pode ser arquivado ou deletado (decisão pessoal de Rick, não desta).

4. **Função operacional do Cockpit volta toda pra dentro do app Atom.** Captura, ritual aurora/zênite/crepúsculo, wrap diário, pipeline — tudo no app, em `mindroot.com.au`.

5. **Topologia de agentes desta conta resultante:**
   - **Arca** — arquitetura, não toca dado, sem MCP Supabase. Continua nesta conta.
   - **Claude Code** — executor de repos Git e migrations DDL. Continua.
   - **Cowork** — reduzido a escopo de scripts dev pontuais. **Sem MCP Supabase de produção.** Outras MCPs (Gmail, Calendar, filesystem, Chrome) podem persistir conforme caso de uso, mas DML direto no Supabase de produção sai junto com o Cockpit (mesma fratura).

6. **Dados existentes no Supabase preservados.** Esta decisão não toca a base. Wraps, items, conexões já capturados via Cockpit ficam — são histórico legítimo da fase simulador.

7. **Wraps de sessão arquitetural** (como esta conversa) continuam sendo commitados em `atom-engine-core/wraps/` via Claude Code — esse fluxo não envolve MCP Supabase de produção e é distinto do Cockpit. Permanece válido.

## Consequências

### Imediato

- Cockpit Claude.ai não recebe mais sessões operacionais.
- Rick captura, wrap, ritual diário **no app Atom** (`mindroot.com.au`).
- Memória do Claude (esta conta) atualizada removendo Cockpit do ecossistema ativo.
- Cowork: MCP Supabase de produção desconectado se ainda estiver ativo.

### Curto prazo

- Spec `ecosystem-agents` v1.1 → v1.2 (próxima rodada): topologia atualizada, Cockpit removido como agente.
- ATOM.md, PENTAGON.md, READMEs do `atom-engine-core` alinham com nova topologia (rodadas futuras).
- D-006 (próxima decisão) define como Claude na conta `ramalho.au` opera read-only — completa o quadro: usuário vive no app, assistente Claude lê mas não escreve.

### Não muda

- **D-001** (separação A/B partition) — continua válida.
- **D-003** (mindroot-v2 branch canônico = master) — continua válida.
- **D-004** (Atom produto único + Marketplace) — continua válida; D-005 é consequência operacional dela.
- **Genesis v5.0.4, Marco Zero v3.1, Meta-Template v1.2, Identidade v1.3** — intactos.
- **Schema Supabase, tabelas, RLS, triggers, edge functions** — intactos.
- **Repos `atom-engine-core` e `mindroot-v2`** — intactos.
- **Histórico de wraps e items capturados via Cockpit** — preservado na base.

## Alternativas consideradas

**Alt 1 — Manter Cockpit com MCP Supabase apenas em leitura (sem DML).**
- Rejeitado: ainda mantém agente Claude.ai paralelo ao app, com risco de drift conceitual. A regra mais limpa é: assistente Claude lê via app ou via API oficial, nunca direto na base. Essa será a regra de D-006.

**Alt 2 — Aposentar Cockpit mas manter Cowork com MCP Supabase de produção.**
- Rejeitado: Cowork tem outras superfícies (Gmail, Calendar, filesystem) que justificam existir, mas DML direto no Supabase é exatamente a fratura que D-005 está fechando. Cowork também perde MCP Supabase de produção.

**Alt 3 — Adiar deprecation até MindRoot ter feature parity completa com Cockpit.**
- Rejeitado: Cockpit funcionando como fallback "se app quebrar" cria dependência reversa e impede investimento sério no app. A linha tem que ser dura: app é a porta, ponto.

**Alt 4 — Reusar Cockpit como "modo dev" do criador (Rick programador).**
- Rejeitado: confunde papéis (dev usa Arca + Claude Code; usuário usa app) e mantém porta dos fundos sob justificativa de conveniência.

## Documentos a atualizar

- [ ] `atom-engine-core/specs/ecosystem-agents` v1.1 → v1.2 (próxima rodada)
- [ ] ATOM.md (atom-engine-core) — referências a Cockpit ajustadas
- [ ] PENTAGON.md — idem
- [ ] README.md (atom-engine-core) — idem se aplicável
- [ ] System prompt do Project Atom (esta conta) v2 — Cockpit fora do ecossistema ativo
- [ ] Memória do Claude — Cockpit removido do "4-agent ecosystem"

## Notas

- O Cockpit cumpriu o papel para o qual foi feito. Não é "falha de execução" — é **fim de fase**. A fase simulador encerrou no momento em que o app real ficou pronto e estável.
- D-005 fecha formalmente o capítulo. Aposentadoria é diferente de "ignorar e nunca mais usar" — sem decisão formal, o agente fica em zona ambígua, podendo voltar por inércia.
- D-006 (Claude `ramalho.au` read-only) completa a topologia final: na conta usuário, Claude assistente lê dados via API oficial do app, mas captura/escrita acontece **sempre via app**. A regra arquitetural única.
- Esta decisão é **arquitetural**, não pessoal. Outras pessoas em outras vidas podem operar como quiserem; o que importa para o Atom (produto) é que ninguém escreve direto na base de produção sem passar pelo app.

---

*A ponte cumpriu. Atravessamos.*
