# Claude Code — Setup & Operação

**Versão:** 1.0
**Data:** 2026-05-13
**Status:** Active
**Origem:** consolidação do Project Atom Drive (deprecated) + práticas validadas em ondas Mar–Mai 2026

> Documento de referência para qualquer sessão Claude Code operando localmente no PC de Rick. Lê isto na primeira sessão; depois disso, basta consultar o CLAUDE.md do repo específico.

---

## Identidade do agente

**Claude Code** é o executor local. Único agente do ecossistema Atom que **escreve em repositórios e roda comandos no filesystem**. Arca (claude.ai) propõe; Cockpit (deprecated, ver D-005) operava DML; Cowork toca superfícies externas. Claude Code toca código.

Conta operacional: `r@ramalho.au`.

---

## Stack local

| Componente | Valor |
|---|---|
| OS host | Windows |
| Camada Linux | WSL2 (Ubuntu) |
| Editor | VS Code |
| Terminal | VS Code integrated terminal → `wsl` → `claude` |
| Package manager (Node) | npm (canônico, D-003) |
| MCP Google Drive (legado Atom Drive) | `@a-bonus/google-docs-mcp` · token em `/home/rsmra/.config/google-docs-mcp/token.json` · config em `/home/rsmra/.claude.json` |

**Boot diário:** abre VS Code → terminal integrado → `wsl` → `claude`.

---

## Repos canônicos

| Repo | Path local | Branch canônico |
|---|---|---|
| atom-engine-core | `c:/repos/atom-engine-core` | `main` |
| mindroot-v2 | `c:/repos/mindroot` | `master` (D-003) |
| atlas-atom | (consultar inventory) | `main` |
| Mistico | (consultar inventory) | `main` |

Para caminhos WSL2, traduzir Windows path para `/mnt/c/...`. Atenção a espaços no path (quoting consistente em bash).

---

## Regras de operação

### 1. Anti-loop
Se algo falhar 3 vezes seguidas, **para e reporta**. Não entra em loop de debug lendo arquivos repetidamente. Pedir contexto direto a Rick é mais eficiente do que insistir.

### 2. Idioma
- Nomenclatura (slugs, código, pastas, IDs, mensagens de commit em prefixos): **inglês**
- Conteúdo (texto, documentação, reflexões, descrições): **português brasileiro**

### 3. Escrita em escala
Para operações de muitos arquivos, escrever direto no filesystem é significativamente mais rápido e confiável que rotear via MCP API.

### 4. Antes de codar
Sempre `git pull` antes de começar trabalho substantivo. Sempre ler o `CLAUDE.md` do repo se existir. Se houver `MAPA.md`, `ROADMAP.md` ou doc equivalente, consultar para entender o estado.

### 5. Branches e commits
Convenções por repo (definidas em cada `CLAUDE.md`):
- **atom-engine-core:** trabalhar em `main`, commits atômicos por decisão/job, push imediato
- **mindroot-v2:** seguir CLAUDE.md do repo (audit.sh 20/20, named exports, service layer, etc.)
- **atlas-atom:** branches `adr/session-YYYY-MM-DD`, PRs com **Create a merge commit** (nunca squash/rebase)

### 6. Confirmação antes de ações destrutivas
- `git reset --hard`, `git push --force`, `rm -rf` (em paths que não sejam temp): pausar e confirmar com Rick
- Migrações Supabase (DDL): aplicadas manualmente por Rick no Supabase Dashboard
- Push em `main`/`master`: OK quando trabalho explicitamente foi pedido pra ir direto na canônica (sem PR)

### 7. Operação atômica
Quando um job pede múltiplos arquivos relacionados, manter **delete + create na mesma operação** (mesmo commit). Padrão validado em D-002 (Identidade v1.2 → v1.3).

### 8. Stop conditions
Sempre que um job apresentar "Stop conditions", honrar. Nunca prosseguir após uma condição-stop sem reportar.

---

## Erros conhecidos / cuidados

### MCP Google Drive no Windows nativo
`@modelcontextprotocol/server-gdrive` tem bug de path no Windows insolúvel (`os.homedir()` gera `C:\C:\Users\rsmra` em algumas chamadas). Conclusão: **deprecar essa rota**. WSL2 com `@a-bonus/google-docs-mcp` é a stack vencedora.

### Path com espaços
Path WSL2 do vault Atom Drive (legado): `/mnt/c/Users/rsmra/Google Drive/My Drive/Atom Drive/`. Sempre quotar paths com espaços em comandos bash.

### Service role vs auth.uid()
Supabase SQL Editor roda como postgres service role, **não** como authenticated user. `auth.uid()` retorna NULL ali. Em inserts feitos via SQL Editor, hardcode o UUID do usuário.

### CodeMirror editors (WP Customizer, GitHub web)
Quando trabalhar via Claude in Chrome em WordPress Customizer ou GitHub web editor, lembrar que CodeMirror não responde a `.value` — usar `document.querySelectorAll('.CodeMirror')` + `.CodeMirror.getValue()/.setValue()` (WP) ou `document.querySelector('.cm-content').cmTile.view` (GitHub).

---

## Princípios validados

- **De dentro pra fora.** Cada fase precisa funcionar antes da próxima começar.
- **Construir incrementalmente.** Entender antes de automatizar.
- **Agent-agnostic por design.** Documentos, repos e protocolo devem fazer sentido pra qualquer agente futuro, não só pra este Claude.
- **Soberania de dados.** Tudo em repos do Rick. Nenhuma plataforma retém.
- **Open source por padrão.** Protocolo público; produtos com dono.

---

## Referências

- Atom Drive (Project Claude deprecated) — origem desta consolidação
- D-005 — Cockpit aposentado, escrita via app sempre
- D-006 — Claude pessoal futuro (read-only via app)
- ecosystem-agents v1.2 (commit c14a5bd) — papéis dos 4 agentes
- `CLAUDE.md` de cada repo — convenções específicas

---

*Documento vivo. Atualizar quando convenções mudarem ou novos repos entrarem no escopo.*
