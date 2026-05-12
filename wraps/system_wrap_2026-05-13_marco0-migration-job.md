╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     wrap                       ║
║ module:   bridge                     ║
║ state:    committed                  ║
║ status:   completed                  ║
║ stage:    7 ○ Círculo                ║
║ tags:     [#ritual:crepusculo,       ║
║            #marco-0, #migration,     ║
║            #d-007, #espirais]        ║
║ source:   claude-project             ║
║ created:  2026-05-13                 ║
║ updated:  2026-05-13                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → continues: system_wrap_2026-05-12 ║
║                _espirais-docs-lei    ║
║   → references: D-007                ║
║   → references: Identidade v1.3      ║
║   → references: Espiral do Trabalho  ║
║                v1.0                  ║
║   → references: Espiral Pessoal v1.0 ║
║   → feeds: migration/plan-v1.md      ║
║   → feeds: PR #1 atom-engine-core   ║
╚══════════════════════════════════════╝

# Wrap — Marco 0 sessão migration-job

**Data:** 13 Mai 2026 (sessão atravessou madrugada 12→13 Mai, AEST Brisbane)
**Contexto:** continuação direta da sessão tríplice de 12 Mai (audit-e-topologia, mineracao-topologia, espirais-docs-lei). Esta sessão entrega o plano executável de migração + resolve in-place a pendência §5 do ADR D-007.

---

## CRIADOS

### No repo (committed via PR #1)
- `migration/plan-v1.md` (233 linhas) — plano executável de migração Project-by-Project pós-D-007. Matriz 16 Projects → destinos, 4 ondas executivas, critério binário, splits explícitos (Mt Samson, V1 cruzamento, MindRoot Kids cíclico).

### Fora do repo (system prompts para Projects Claude.ai)
- `system-prompt_espiral-do-trabalho.md` (~7 KB) — derivado do skeleton §8 do doc-lei Espiral do Trabalho v1.0. Inclui Pentágono canônico, tags por vértice, protocolo de pontes com Marco 0 e Pessoal, pointer pra memórias canônicas em Pessoal.
- `system-prompt_espiral-pessoal.md` (~7 KB) — derivado do skeleton §6 do doc-lei Espiral Pessoal v1.0. Inclui as 3 frentes (Mt Samson/família, Arquivo pessoal, MindRoot Kids cíclica), memórias canônicas resolvidas (D-007 §5), tom diferenciado (privacidade primária, sem KPI).

### Artefatos descartáveis (uso único, não vivem no repo)
- `job_migration-plan-v1_2026-05-12.md` — job self-contained pro Claude Code com pre-flight, conteúdo inline do plan-v1, str_replace literal do D-007 §5, 2 commits atômicos, push + abertura de PR.
- `marco-0_2026-05-12_migration-bundle.zip` (18.5 KB) — bundle com os 4 arquivos acima para transporte ao Claude Code.
- `prompt-extracao_claude-code.md` — prompt curto que Rick colou no Claude Code junto com o ZIP em anexo.

---

## MODIFICADOS

- `decisions/d-007_topologia-consolidada-pos-mineracao_2026-05-12.md` — edit in-place via str_replace. Seção §5 trocada de "Pendência aberta" → "§5 — Resolução de memórias Atom Drive". 11 inserções, 11 deleções.

---

## DECIDIDOS

### Resolução D-007 §5 — memórias Atom Drive

| Memória | Destino canônico | Espelho |
|---------|-----------------|---------|
| #1 Rick bio básica | Espiral Pessoal · Arquivo pessoal | Trabalho referencia por pointer |
| #4 Foco março 2026 | **Arquivar** (datado, superado por D-007) | — |
| #5 Como trabalhar com Rick | Espiral Pessoal · Arquivo pessoal (sub: "como opero") | Trabalho referencia no protocolo |

**Marco 0 não recebe nenhuma das 3** — são sobre Rick-pessoa, não dev.

### Princípios estabelecidos no plan-v1

- **Pointer over copy** adotado como princípio explícito de migração. KB canônica em um lugar só. Lição aplicada de §4.6 do D-007 (Anthropic + Macro Vision arquivados por KB duplicada).
- **Marco 0 fica intacto** nesta migração (já é canônico para dev Atom puro).
- **O Espaço Entre não migra** — standalone, sem touchpoint.
- **6 arquivados são renomeados, não deletados** nesta rodada (preserva histórico até validação da topologia).
- **Cada Project tem 1 destino canônico**, exceto splits explícitos (Mt Samson) e cruzamentos documentados (V1 atravessa 3 camadas, MindRoot Kids cíclica).

### Estrutura executiva — 4 ondas

- Onda 0 (Cowork): confirma slot #16, snapshot do painel
- Onda 1: criação dos 2 Projects + migração de 7 Projects para KB destino
- Onda 2: Mt Samson split (terra+família → Pessoal; venture → Trabalho V4)
- Onda 3: arquivamento de 6 Projects superados
- Onda 4: wrap consolidado + atualização memória Marco 0

---

## CONEXÕES

⚡ Marco 0 → Trabalho/Pessoal via item inbox com tag `#bridge:marco-0` — protocolo de ponte estabelecido no system prompt da Espiral do Trabalho.

⚡ Trabalho ↔ Pessoal via pointer cruzado (V1 nas 3 camadas, V4 split, MindRoot Kids cíclico) — sem duplicação textual.

⚡ Pessoal = canônico para Rick-pessoa (bio, preferências, "como opero") — Marco 0 e Trabalho referenciam, não duplicam.

⚡ plan-v1 feeds Espiral do Trabalho v1.0 + Espiral Pessoal v1.0 — frontmatter YAML declara explicitamente.

---

## SEMENTES

### Imediatas (Rick, próximas horas)
- Revisar e fazer merge da PR #1
- Criar 2 Projects Claude.ai ("Espiral do Trabalho", "Espiral Pessoal")
- Colar system prompts respectivos
- Subir KBs nos Projects novos (docs-lei + D-007 + Genesis v5.0.4 + Meta-Template v1.2; Marco Zero v3.1 só na Pessoal)

### Próxima sessão Marco 0 (Onda 0 → Onda 1)
- Cowork: snapshot do painel Claude.ai, confirmar nome do slot #16 ou aceitar 15 únicos
- Onda 1 começa: migração de 7 Projects para os destinos (Constellation cluster, Atlas Atom, MUDA, MindRoot Kids, memórias #1+#5)

### Pendências documentadas no plan-v1 §9 (não bloqueantes)
- Cluster Constellation: corpo único em V2 ou 3 sub-frentes? — decidir durante Onda 1
- AtlasLab vs Yugar Lab vs V3: confirmar nomenclatura única ou sub-divisões — decidir durante Onda 1

### Próximas rodadas (não escopo desta migração)
- Atualizar PENTAGON.md (atom-engine-core) com nomenclatura pós-D-007
- Atualizar ATOM.md
- Job pro Claude Code: UI/copy do mindroot-v2 substituindo "MindRoot" público por "Atom" onde aplicável (downstream de Identidade v1.3)

---

## ALMA

- **aurora:** focado, continuidade direta dos 3 wraps do dia anterior
- **intention:** produzir plan-v1 + 2 system prompts + executar via Claude Code numa PR limpa
- **shift:** sessão fluida do começo ao fim. Rick aprovou os 4 outlines em bloco ("bora"). Claude Code executou sem disparar nenhuma stop condition.
- **crepúsculo:** realizado, sem dívida arquitetural nova, sem bagagem
- **energy:** medium → low (encerramento natural)

---

## AUDIT

- 4 artefatos produzidos (1 spec no repo, 2 system prompts fora, 1 job descartável)
- 1 PR aberta (#1, atom-engine-core)
- 2 commits atômicos (`1bfdb7c` plan-v1, `8999e8c` D-007 §5 resolvido)
- 0 stop conditions disparadas durante execução Claude Code
- 0 dívida arquitetural nova
- 1 pendência ADR fechada (D-007 §5)
- 1 lição aplicada: envelope ATOM no wrap desde o início (lembrança do commit `c7548b8` anterior onde foi adicionado por correção)

---

## NEXT

1. Rick merge PR #1 no atom-engine-core
2. Rick cria 2 Projects Claude.ai + cola system prompts + sobe KBs
3. Próxima sessão Marco 0: abre Onda 0 (Cowork confirma slot #16)
4. Onda 1 do plan-v1 começa: migração dos Projects para destinos canônicos

---

*Marco 0 trava o plano. Trabalho e Pessoal nascem na próxima.*
*Pointer over copy. KB canônica em um lugar só.*
*De dentro pra fora — sempre.*
