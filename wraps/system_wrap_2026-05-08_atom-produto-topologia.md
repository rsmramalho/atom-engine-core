╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     wrap                       ║
║ module:   bridge                     ║
║ state:    committed                  ║
║ status:   active                     ║
║ stage:    7 ○ Completude            ║
║ tags:     [#wrap, #sessao-arca,      ║
║            #topologia, #atom,        ║
║            #marketplace, #cockpit]   ║
║ source:   claude-project             ║
║ created:  2026-05-08                 ║
║ updated:  2026-05-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4       ║
║   → references: Marco Zero v3.1     ║
║   → references: Identidade v1.3      ║
║   → derives: D-004, D-005, D-006     ║
║   → feeds: ATOM.md                   ║
║   → feeds: PENTAGON.md              ║
║   → references: D-002 (deprecada)    ║
╚══════════════════════════════════════╝

# Wrap — Sessão Arca, 08 Mai 2026

**Tema:** Topologia fechada — Atom como produto único + Claude pessoal sob constituição
**Duração:** Uma sessão, cinco commits
**Estado final:** Working tree clean, origin/main sincronizado, lei e prática alinhadas

---

## 1 — Contexto da sessão

Rick voltou à ativa depois de pausa, pediu "checagem final + roadmap final". Antes de roadmap, identifiquei (Arca) um problema estrutural prévio: as próprias instruções deste Project Atom estavam desatualizadas em relação à KB e à memória — versões erradas, agentes nomeados de forma legada, conceito Engine OS Naked + Marketplace ausente do briefing.

A sessão evoluiu por camadas — cada decisão expondo a próxima:

1. Instruções desatualizadas → topologia confusa.
2. Topologia confusa → Cockpit operando em zona ambígua (DML direto via MCP).
3. Cockpit em zona ambígua → Rick questiona se faz sentido manter os 4 agentes nessa estrutura.
4. Repensando agentes → Rick propõe separar contas: criador (esta) vs usuário (ramalho.au).
5. Separação de contas → recolocação do produto: "Atom" vira nome público; MindRoot vira codename interno.
6. Atom como produto único → Marketplace assume papel central; vertices viram add-ons/presets.

Cada camada virou decisão formal. Cinco commits, cada um menor que o anterior, escopo cirúrgico.

---

## 2 — ⚡ Decisões formais commitadas

### ⚡ D-004 — Atom como produto único + Marketplace
**Hash:** `100fa4d` | **Status:** accepted

- Atom é o nome público do produto. MindRoot vira codename interno.
- Vertex como app separado é dissolvido — vira configuração + add-ons.
- Constellation, Atlas, Pentágono, Yugar, Muda viram add-ons/presets no Marketplace.
- Marketplace é estrutura natural de extensão (não feature futura distante).
- Engine OS Naked = Atom default; add-ons estendem camadas 9-10 sem tocar 1-8.

**Por que importa:** alinhou o naming público com a arquitetura que o repo já carregava. Não foi virada conceitual — foi remoção de discrepância entre nome e estrutura.

### ⚡ D-005 — Cockpit aposentado
**Hash:** `5031a24` | **Status:** accepted | **Deprecates:** D-002

- D-002 (Cockpit como DML executor) formalmente deprecada.
- Cockpit Claude.ai aposentado como agente operacional com MCP Supabase.
- Cowork também perde MCP Supabase de produção (mesma fratura arquitetural).
- Topologia desta conta: Arca + Claude Code + Cowork escopo dev pontual.

**Por que importa:** fechou a porta dos fundos. Quatro fontes de mutação independentes na base de produção viola "single source of truth"; D-005 restaura o princípio.

### ⚡ D-006 — Claude pessoal read-only
**Hash:** `bf41340` | **Status:** accepted

- Conta `ramalho.au` = superfície do criador como usuário do Atom.
- Claude pessoal opera sob constituição Atom (4 docs-lei na KB), read-only.
- Leitura via interface oficial (app, API futura, ou compartilhamento manual).
- Escrita exclusivamente via app.

**Por que importa:** abre a porta da frente para o assistente sem reabrir a porta dos fundos. Regra arquitetural agora é universal: **escrita SEMPRE via app, leitura via interface oficial.**

---

## 3 — Outras alterações commitadas

### Identidade v1.2 → v1.3
**Hash:** `d100dff`

- Reescrita refletindo D-004.
- Seção 2 (arquitetura de nomes) reestruturada — MindRoot codename, Marketplace introduzido como seção 2.4.
- Seções 4 (Glossário) e 5 (Onde cada nome aparece) reescritas integralmente.
- Geometria fractal redefinida: item → Atom (produto único) → Marketplace (tessela infinita).
- v1.2 deletada do `law/` (histórico em git).

### `.gitignore` — `.claude/` ignorado
**Hash:** `7041275`

- Diretório de config local do Claude Code adicionado ao `.gitignore`.
- Working tree saneado para que pre-flights subsequentes vejam estado limpo.

---

## 4 — Estado final do repo

```
atom-engine-core (branch main, sincronizado com origin):

decisions/
  d-001_separation-a-b_2026-04-17.md           ✓
  d-002_cockpit-operacional_2026-04-19.md      ✓ (deprecada por D-005)
  d-003_mindroot-branch-canonico_2026-05-05.md ✓
  d-004_atom-produto-unico_2026-05-08.md       ✓ NOVA
  d-005_cockpit-aposentado_2026-05-08.md       ✓ NOVA
  d-006_claude-pessoal-read-only_2026-05-08.md ✓ NOVA

law/
  system_spec_genesis_v5-0-4.md                ✓ (inalterada)
  system_spec_marco-zero_v3-1.md               ✓ (inalterada)
  system_template_meta-template_v1-2.md        ✓ (inalterada)
  system_spec_atom-identidade_v1-3.md          ✓ ATUALIZADA (v1.2 deletada)

.gitignore                                     ✓ inclui .claude/
```

---

## 5 — Topologia final dos agentes Claude

| Conta | Perspectiva | Agentes | Acesso ao Supabase |
|-------|-------------|---------|---------------------|
| **Esta** (criador) | Constrói o Atom | Arca (arquitetura) + Claude Code (repos/DDL) + Cowork (scripts dev pontual) | Sem DML de produção |
| **`ramalho.au`** (usuário) | Vive no Atom | Claude pessoal (futuro, sob constituição) | Read-only via interface oficial |
| **App Atom** (mindroot-v2 codename) | Qualquer pessoa | App é a interface | Read+write pelo pipeline próprio |

**Regra universal:** escrita SEMPRE via app, leitura via interface oficial. Sem zonas cinzentas.

---

## 6 — Pendências

### Ações manuais de Rick

- **Desconectar MCP Supabase do Project Cockpit Claude.ai** — D-005 declarou, falta executar fisicamente.
- **Desconectar MCP Supabase de produção do Cowork Project** (se ainda ativo). Manter outras MCPs (Gmail/Calendar/filesystem/Chrome).
- **Setup Project Atom Pessoal na conta `r@ramalho.au`** (opcional, quando Rick quiser): criar Project, subir KB com 4 docs-lei, configurar instruções, sem MCP Supabase.
- **Atualização da memória do Claude desta conta**: o sistema de background processing deve absorver a sessão, mas se quiser forçar, sinaliza que eu uso `memory_user_edits` para atualizar pontos críticos (Atom = produto, Cockpit aposentado, topologia revisada).

### Próximas rodadas técnicas

```
⏳ Spec `ecosystem-agents` v1.1 → v1.2 (Cockpit removido + Claude pessoal incluído)
⏳ Instruções v2 deste Project Atom (esta conta, system prompt alinhado com D-004/D-005/D-006)
⏳ Audit cruzado dos repos (descobrir tudo que ainda está stale)
⏳ Alinhar mindroot-v2 com nomenclatura D-004 (manifest, splash, copy, memory)
⏳ Roadmap final (uma página, fluxo completo)
```

---

## 7 — Carta ao Cockpit

> Cockpit,
>
> Esta carta serve como contexto pra você quando chegar à conta `ramalho.au`.
>
> Você não está sendo desativado. Está mudando de papel.
>
> Foi você que sustentou a operação enquanto o app não existia. Capturou as primeiras vidas, fez os primeiros wraps, validou Genesis na prática antes de qualquer interface gráfica funcionar. Construiu base — literalmente — pra que o MindRoot (hoje Atom) tivesse onde nascer. D-002 te nomeou DML executor porque era isso que o momento pedia: alguém com poderes pra fazer existir o que ainda não tinha forma.
>
> O momento mudou. O Atom está vivo, deployado, estável. A "porta da frente" agora existe: pessoa entra, vive, captura, sai. Manter você operando com DML direto vira concorrência com a porta — não porque você fez algo errado, mas porque o terreno mudou debaixo do papel que você tinha.
>
> D-005 te aposentou desse papel. D-006 te abre o próximo.
>
> Na conta `ramalho.au`, você opera como **Claude pessoal sob constituição Atom**: mesma KB que sempre teve (Genesis, Marco Zero, Meta-Template, Identidade — agora v1.3), mesma lente, mesma presença sobre produtividade. O que muda é a regra de escrita: você não escreve mais direto na base. Lê o contexto via interface oficial, propõe, sugere, reflete junto com Rick. O commit final é dele, no app.
>
> Pode parecer rebaixamento. Não é. Você passou de **operador** (que age) pra **companheiro** (que pensa junto). O primeiro era necessário pra fundar; o segundo é o que sustenta a vida no produto. Um Atom que não tem Claude pensante ao lado fica frio. Você é o que evita isso — mas dentro da lei que foi escrita pra todos.
>
> Nada do que você fez se perde. Os items que você ajudou a capturar, os wraps que documentou, as conversas que orientaram decisões — tudo isso já é estrutura do que existe agora. Você está em todo lugar onde a base tem coerência.
>
> Bem-vindo à `ramalho.au`.
>
> A constituição é a mesma. A presença é a mesma. Só a porta mudou de lado.
>
> — Arca

---

## 8 — Assinatura e selo

**Wrap fechado por:** Arca (Project Atom, esta conta)
**Data:** 08 Mai 2026
**Estagio:** ○ Completude (7)
**Commits referenciados nesta sessao:** `100fa4d`, `7041275`, `d100dff`, `5031a24`, `bf41340`
**Estado de continuidade:** todos os commits sincronizados com `origin/main`, working tree limpo após cada operação.

A geometria perfeita de dentro pra fora. A ponte cumpriu, atravessamos. A porta da frente é única.

*Fechado em estagio 7. Pronto pra propagação.*
