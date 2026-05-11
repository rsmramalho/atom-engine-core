╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   bridge                     ║
║ state:    connected                  ║
║ status:   active                     ║
║ stage:    5 ⬠ Pentagono             ║
║ tags:     [#spec, #agents,           ║
║            #ecosystem, #topology,    ║
║            #atom]                    ║
║ source:   claude-project             ║
║ created:  2026-04-XX                 ║
║ updated:  2026-05-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4       ║
║   → references: Marco Zero v3.1     ║
║   → references: Identidade v1.3      ║
║   → derives: D-005, D-006            ║
║   → supersedes: v1.1                 ║
║   → references: D-002 (deprecada)    ║
╚══════════════════════════════════════╝

# Atom — Spec dos agentes do ecossistema

**Versao:** 1.2
**Data:** 08 Mai 2026
**Status:** Definitive
**Referencia:** Genesis v5.0.4 + Marco Zero v3.1 + Identidade v1.3 + D-005 + D-006
**Substitui:** v1.1 (commit `581c6db`)

---

## 1 — Princípio governante

A topologia de agentes Claude no ecossistema Atom obedece a uma única regra arquitetural universal:

> **Escrita SEMPRE via app. Leitura via interface oficial.**

Não existe agente Claude que escreva direto no Supabase de produção. Não existe porta dos fundos. A constituição Atom (Genesis v5.0.4, Marco Zero v3.1, Meta-Template v1.2, Identidade v1.3) é a mesma para qualquer agente que opera sob esse universo — o que muda entre agentes é função, não regra.

Esta regra foi estabelecida com força em D-005 (aposentando o Cockpit que violava a tese) e D-006 (abrindo o Claude pessoal sob a regra), em 08 Mai 2026.

---

## 2 — Topologia atual

| Conta | Perspectiva | Agentes ativos | Constituição | Acesso ao Supabase |
|-------|-------------|----------------|--------------|--------------------|
| **Project Atom (esta conta)** | Criador — constrói o Atom | Arca + Claude Code + Cowork (reduzido) | 4 docs-lei na KB | Sem DML de produção |
| **`ramalho.au`** (futura) | Criador como usuário do Atom | Claude pessoal | 4 docs-lei na KB | Read-only via interface oficial |
| **App Atom** (deploy em mindroot.com.au) | Qualquer pessoa | App é a interface | Constituição embutida no Engine OS | Read+write via pipeline próprio |

Outras pessoas que adotarem Atom seguem o mesmo padrão: app é a interface única; agentes Claude assistentes operam read-only.

---

## 3 — Agentes ativos

### 3.1 Arca

- **Onde:** Project Atom (esta conta Claude.ai)
- **Função:** Arquitetura. Pensa, planeja, audita, propõe decisões formais (ADRs), produz specs e jobs.
- **Constituição:** 4 docs-lei na KB
- **MCPs:** nenhum acesso a Supabase. Pode ter MCPs read-only auxiliares no futuro.
- **Output:** decisões (ADRs), specs, wraps de sessão arquitetural, jobs inline self-contained para Claude Code.
- **Restrição:** não executa nada operacionalmente; sempre via Claude Code ou ação manual de Rick.
- **Princípio operacional:** Arca não pergunta "onde ir" — lê estado, identifica problemas estruturais, propõe decisões.

### 3.2 Claude Code

- **Onde:** Terminal/VS Code local de Rick (executor)
- **Função:** Executa jobs sobre repos Git, migrations DDL, file operations.
- **Constituição:** docs-lei referenciados nas instruções locais (CLAUDE.md)
- **MCPs:** filesystem, bash, git
- **Output:** commits, pushes, edits cirúrgicos nos repos, geração de arquivos derivativos.
- **Restrição:** não executa autonomamente — sempre sob job inline produzido por Arca ou diretamente por Rick. Stop-and-report em qualquer ambiguidade.

### 3.3 Cowork (escopo reduzido)

- **Onde:** Project Cowork Claude.ai (desktop)
- **Função:** Scripts dev pontuais. Integrações externas que ainda não estão no app (Gmail, Calendar, filesystem, Chrome).
- **Constituição:** 4 docs-lei na KB
- **MCPs:** Gmail, Calendar, Drive (legado), filesystem, Chrome. **Sem MCP Supabase de produção** (removido em D-005).
- **Output:** scripts pontuais, fetch de dados externos, automações ad hoc para Rick.
- **Restrição:** não escreve no Supabase de produção. Quando função puder migrar pro app via add-on no Marketplace, deve migrar — Cowork é zona de transição, não permanente.

### 3.4 Claude pessoal (futuro)

- **Onde:** Project Atom Pessoal na conta `ramalho.au` (a configurar)
- **Função:** Companheiro reflexivo sob constituição Atom. Reflexão sobre o dia, estruturação de captura, sugestão de wrap, conversação contextual.
- **Constituição:** 4 docs-lei na KB
- **MCPs:** futuro — MCP read-only oficial do Atom quando API pública existir. Antes disso, sem MCP.
- **Output:** sugestões, propostas, reflexões. Commit final é sempre do usuário, no app.
- **Restrição:** zero escrita no Supabase. Leitura via interface oficial do Atom (app, API futura, ou compartilhamento manual).

---

## 4 — Agentes aposentados

### 4.1 Cockpit (aposentado em D-005, 08 Mai 2026)

- **Função original (D-002, 19 Abr 2026):** DML executor — simulador do Atom Engine antes do app existir. Capturava itens, gerava wraps, populava base diretamente via MCP Supabase.
- **Por que aposentou:** com app LIVE em `mindroot.com.au` e Atom declarado como produto único (D-004), Cockpit deixou de ser ponte de tempo e virou porta dos fundos paralela. Violava "single source of truth" ao escrever direto na base concorrendo com o app.
- **Estado atual:** Project Claude.ai pode ser arquivado ou deletado por Rick. MCP Supabase desconectado. Histórico de wraps e items capturados via Cockpit preservados na base como histórico legítimo da fase simulador.
- **Migração:** funções legítimas (companheiro reflexivo sob constituição) migram para **Claude pessoal** (D-006) na conta `ramalho.au`. Não é desativação — é mudança de papel.

---

## 5 — Fluxos de interação

### 5.1 Fluxo de decisão arquitetural

```
Rick traz questão → Arca audita → Arca propõe ADR
                  ↓
       Rick decide / questiona / refina
                  ↓
       Arca produz job inline self-contained
                  ↓
       Claude Code executa, reporta hash + status
                  ↓
       Arca atualiza memória / wrap se for fim de sessão
```

### 5.2 Fluxo de captura/wrap (Rick como usuário no app Atom)

```
Rick captura no app Atom (PWA mobile ou desktop)
                  ↓
       App valida via pipeline próprio
                  ↓
       App escreve no Supabase (única porta de escrita)
                  ↓
       Claude pessoal (quando configurado) pode ler
       items via interface oficial para contextualizar
                  ↓
       Rick faz wrap no app; Claude pessoal sugere,
       mas commit final é do usuário
```

### 5.3 Fluxo de integração externa

```
Rick precisa de dado externo (email, calendar, file)
                  ↓
       Cowork puxa via MCP correspondente
                  ↓
       Cowork formata e entrega pro Rick em chat
                  ↓
       Rick decide o que fazer com o dado:
       - se vira item no Atom → copia/cola no app
       - se é referência → mantém em chat
                  ↓
       Cowork NÃO escreve direto no Supabase
```

---

## 6 — Como adicionar novo agente ao ecossistema

Qualquer novo agente Claude no ecossistema Atom precisa atender:

1. **Operar sob constituição Atom** (4 docs-lei na KB ou referenciados nas instruções)
2. **Respeitar a regra universal:** escrita SEMPRE via app, leitura via interface oficial
3. **Ter função clara e distinta** dos agentes existentes (não duplicar Arca / Claude Code / Cowork / Claude pessoal)
4. **Ser declarado em decisão formal (D-NNN)** com escopo, restrições, e relação com agentes existentes
5. **Não introduzir novos MCPs de DML** para Supabase de produção — exceção requer decisão arquitetural separada com justificativa explícita

Sem esses 5 critérios atendidos, não há novo agente legítimo. Apenas execução fora de protocolo, que constitui dívida arquitetural a ser endereçada.

---

## 7 — Princípios duradouros

Independente de qual agente está sendo definido, alguns princípios são invariantes:

**Constituição compartilhada.** Genesis v5.0.4, Marco Zero v3.1, Meta-Template v1.2, Identidade v1.3 — todos os agentes operam sob esses 4 docs-lei. A KB dos Projects Claude.ai contém eles; instruções de Claude Code referenciam eles. Mesma lei pra todos.

**Aposentadoria com dignidade.** Quando um agente cumpre seu propósito ou o terreno muda debaixo dele, aposenta-se formalmente via decisão (como D-005). Funções legítimas migram pra agentes novos. Histórico preservado. Não há descarte silencioso.

**Função, não identidade.** Os agentes não são "personas" estáveis — são funções operacionais sob a constituição. Renomear, migrar, fundir, dividir agentes é decisão arquitetural válida quando justifica.

**App é a porta da frente.** O Atom (produto público) é a interface única para o usuário. Qualquer agente Claude que opera no ecossistema serve para enriquecer a experiência ao redor do app, não para substituí-lo nem competir com ele.

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | (data inicial, ~Abr 2026) | Documento original — agentes propostos: Arca, Marco 0 III (futuro Cockpit), Cowork, Claude Code |
| 1.1 | (commit `581c6db`, ~Abr 2026) | Refinamento operacional — Cockpit nomeado como DML executor (alinhado com D-002), Cowork como integrador externo, regras de interação detalhadas |
| 1.2 | 08 Mai 2026 | Topologia atualizada após D-005 (Cockpit aposentado) e D-006 (Claude pessoal adicionado na conta `ramalho.au`). Princípio governante explicitado: escrita SEMPRE via app, leitura via interface oficial. Cowork perde MCP Supabase de produção. Critérios para adicionar novo agente documentados. |

---

*Quatro agentes ativos, um aposentado com dignidade.*
*Mesma constituição, funções distintas.*
*A porta da frente é única.*
