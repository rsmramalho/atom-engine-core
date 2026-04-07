╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     checkpoint                 ║
║ module:   bridge                     ║
║ state:    committed                  ║
║ status:   active                     ║
║ stage:    7 ○ Circulo                ║
║ tags:     [#system, #audit,          ║
║            #baseline]                ║
║ source:   claude-project             ║
║ created:  2026-04-07                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4      ║
║   → references: ATOM.md v1.2        ║
╚══════════════════════════════════════╝

# Guardião Audit — Baseline 07 Abr 2026

**Modo:** AUDITOR (read-only). Nada foi modificado, nada foi commitado.
**Auditor:** Claude (Opus 4.6 [1m])

---

## 0. Discrepâncias de path (antes de qualquer bloco)

| Esperado no prompt | Real no disco | Status |
|--------------------|---------------|--------|
| `c:/Users/rsmra/Downloads/mindroot-v2` | `c:/Users/rsmra/Downloads/mindroot` | ⚠️ Pasta `mindroot-v2` **não existe**. PENTAGON.md v3.3 referencia `mindroot-v2` em 5 pontos — desalinhado. |
| Branch `master` | Branch `ui-v2` | ⚠️ Branch `master` não existe. Default branch é `ui-v2` (branches locais: `ui-v2`). |

Procedi usando `c:/Users/rsmra/Downloads/mindroot` @ branch `ui-v2`.

## Repos
- **mindroot** (mindroot-v2 no PENTAGON): HEAD `7650cc9e` — *docs: ROADMAP v7.0 honest sync — verified against code post Schema v2*
- **atom-engine-core**: HEAD `7a5554c` (branch `main`) — *docs: PENTAGON v3.3 cross-check — ROADMAP v7.0 synced*

---

## 1. Schema alignment (Genesis v5.0.4 vs src/types/item.ts)

| Check | Esperado | Real | Status |
|-------|----------|------|--------|
| AtomType | 23 | 23 | ✅ exato (mesma ordem do Genesis Part 4.2) |
| AtomModule | 8 | 8 | ✅ work, body, mind, family, purpose, bridge, finance, social |
| AtomState | 8 | 8 | ✅ inbox→archived |
| AtomStatus | 8 | 8 | ✅ inbox, draft, active, paused, waiting, someday, completed, archived |
| AtomRelation | 8 | 8 | ✅ belongs_to, blocks, feeds, mirrors, derives, references, morphed_from, extracted_from |
| AtomSource | 11 | 11 | ✅ claude-project, claude-chat, claude-chrome, claude-code, mindroot, constellation, obsidian, drive, monday, manual, atom-engine |

**Header obsoleto em [src/types/item.ts:2](../../Users/rsmra/Downloads/mindroot/src/types/item.ts#L2):** comentário diz `Reference: Genesis v4.2` mas o conteúdo é Genesis v5. Uma linha — não bloqueante mas confuso.

### 1b. type-schemas.json floors vs Genesis Part 2

| Type | Genesis piso | type-schemas | Status |
|------|--------------|--------------|--------|
| note, reflection | 2 | 2 | ✅ |
| recommendation, podcast, article | 2 | 2 | ✅ |
| resource, list | 2 | 2 | ✅ |
| task, habit | 3 | 3 | ✅ |
| recipe, workout | 3 | 3 | ✅ |
| ritual | 3 | 3 | ✅ (note dentro do JSON: "Genesis piso technically 2 but functionally needs 3") |
| review | 3 | 3 | ✅ |
| checkpoint | 3 | 3 | ✅ |
| template | 3 | 3 | ✅ |
| spec | 5 | 5 | ✅ |
| project | 5 | 5 | ✅ |
| session-log | 7 | 7 | ✅ |
| wrap | 7 | 7 | ✅ |
| log, doc, research, lib | (não tabelado) | 2 | ✅ default coerente com "saber o que é basta" |

**23/23 types presentes em [src/config/type-schemas.json](../../Users/rsmra/Downloads/mindroot/src/config/type-schemas.json).** Floors batem 100%.

### 1c. config/types.ts helpers

[src/config/types.ts](../../Users/rsmra/Downloads/mindroot/src/config/types.ts) exporta: `getTypeSchema`, `getFloorStage`, `getDefaultModule`, `hasBodySchema`, `getExtensions`, `ALL_TYPES`. ✅ Completo.

---

## 2. State machine — [src/engine/fsm.ts](../../Users/rsmra/Downloads/mindroot/src/engine/fsm.ts)

| Check | Status | Detalhe |
|-------|--------|---------|
| Avanço sequencial 1→7 | ⚠️ parcial | `canAdvance` só exige `targetStage > genesis_stage` — **permite pular estágios** (ex: 2→5 direto). Genesis Part 2: "sempre sequencial". |
| Born-committed (wrap, session-log → 7) | ❌ NÃO IMPLEMENTADO | Nenhum branching por type. Item de type=wrap criado em stage 1 percorre o mesmo gate genérico. |
| Stage 6 opcional (5→7) | ⚠️ implícito | Como o avanço aceita qualquer target maior, 5→7 funciona, mas não é modelado explicitamente. |
| Regressão por perda de requisitos | ❌ Ausente do fsm.ts | Genesis delega isso a triggers no PostgreSQL — **não existe espelho TS**. Engine não consegue regredir items localmente. |
| `morph()` regride pra stage 2 | ❌ Não existe `morph()` em fsm.ts | RPC `morph_item` é referenciada no CLAUDE.md mas não há wrapper TS no engine layer. |
| Gates (type+module, notes, intervalo de revisão) | ✅ presente | `checkGates` cobre 2/3/4. |
| `getBelowFloor`, `getOrphans`, `getStageInfo` | ✅ presentes | OK. |

### 2b. Testes do FSM

**`src/engine/__test__/fsm.test.ts` NÃO EXISTE.** Não há `fsm.test.ts` em lugar nenhum do repo. Os 462 testes que passam **não cobrem o FSM diretamente**. (Há testes em parsing, recurrence, search, dashboard-filters, soul, theme, insights, ai-suggestions, export, offline-queue — mas zero pro motor de estados.)

---

## 3. Import direction (regra ATOM.md §Quadrado)

| Violação verificada | Status |
|---------------------|--------|
| `engine/` → `service|hooks|components|pages` | ✅ NENHUMA |
| `service/` → `components|pages` | ✅ NENHUMA |
| `hooks/` → `components|pages` | ✅ NENHUMA |

Geometria inside-out **íntegra**. Todo o `src/` respeita `types → engine → service → hooks → components → pages`.

---

## 4. Docs sync — atom-engine-core/law/

| Doc | Filename version | Conteúdo (Versão:) | PENTAGON refere | Status |
|-----|------------------|---------------------|-----------------|--------|
| Genesis | `v5-0-3` | **5.0.4** | "Genesis v5.0.4" | ⚠️ filename obsoleto (deveria ser `v5-0-4`) |
| Marco Zero | `v3-0` | **3.1** | (não fixa versão) | ⚠️ filename obsoleto (deveria ser `v3-1`) |
| Meta-Template | `v1-2` | 1.2 (mas título `# Atom Meta-Template v1.1`) | (n/a) | ⚠️ título interno dessincado com versão |
| Atom Identidade | `v1-1` | (Atom Envelope, sem campo Versão visível no head) | "Identity v1.2" no PENTAGON | ⚠️ filename `v1-1` mas PENTAGON cita v1.2 |
| ATOM.md (root) | (sem versão no path) | 1.2 | "ATOM.md v1.1" no commit msg recente | ⚠️ commit `8e829f2` diz "v1.1" mas conteúdo é v1.2 |

**Padrão:** as versões dos arquivos seguem evoluindo no header sem renomear o filename — viola a própria convenção do Meta-Template (`*_v[X-Y].md`).

---

## 5. PENTAGON.md state — [PENTAGON.md](PENTAGON.md)

- ✅ v3.3, 07 Abr 2026, status `active`
- ✅ Espiral 1 marcada COMPLETA ○ (7/7 fases)
- ✅ Espiral 2 F1-F5 listadas com estado real (F3 ✅, F4 ◐, F1/F2/F5 ⚪)
- ✅ Cross-check line presente: "07 Abr 2026 — ROADMAP v7.0 synced (mindroot-v2 8e6a06a0)"
- ✅ Vértices V2-V5 + Atlas hexágono presentes com status correto (V2 paused, V3-V5 concept, Atlas active)
- ⚠️ HEAD do mindroot referenciado: `8e6a06a0` — **mas o HEAD real agora é `7650cc9e`** (1 commit à frente: `docs: ROADMAP v7.0 honest sync`). PENTAGON está **1 commit atrás** do que existe no disco.
- ⚠️ Refere-se ao repo como `mindroot-v2` mas a pasta no disco é `mindroot`. Cosmético, mas inconsistente.
- ⚠️ Linha 232 fala em "Genesis v5.0.4, Identity v1.2" — versões que **não existem como filename** em `law/`.

---

## 6. CLAUDE.md (mindroot) — [CLAUDE.md](../../Users/rsmra/Downloads/mindroot/CLAUDE.md)

- ✅ v3.0 (06 Abr 2026)
- ✅ Referencia `atom-engine-core/ATOM.md`, `atom-engine-core/law/genesis_v5-0-3.md`, design system, PENTAGON
- ⚠️ Cita `genesis_v5-0-3.md` no header, mas a fonte real é `system_spec_genesis_v5-0-3.md` (path completo na seção "Referências" usa `genesis.md` sem prefixo) — múltiplas grafias do mesmo arquivo
- ⚠️ **NÃO menciona "5 agentes" / "Build Protocol" como Pentágono** — substituiu por "4 Protocolos" (Proporção Invertida, Maturação Permissiva, Detector de Trava, Tudo Só É). Conflito potencial: PENTAGON.md ainda fala em "Genesis Build Protocol v1.0 — 5 agentes".
- ❌ **Não há hooks de enforcement** documentados (apesar de o prompt esperar). Apenas check pré-commit textual (`tsc -b && npm test && npm run build`).
- ⚠️ Cita "467 tests, 24 suites" — **vitest real reporta 462 testes em 24 suites** (off by 5).

---

## 7. Redundâncias e conflitos

| Item esperado pelo prompt | Estado real |
|----------------------------|-------------|
| `mindroot/ops/` directory | ❌ Não existe |
| `mindroot/ops/dev-workflow.md` | ❌ Não existe |
| `mindroot/ops/README.md` vs root README | ❌ Nenhum dos dois existe |
| `atom-engine-core/specs/` | ✅ Existe — 4 arquivos: `atom-agent_v1-0`, `guardiao-audit_v2-0`, `yugar-vision_v0-1`, `template_roadmap-phi_v2-0` |

**Duplicações encontradas no mindroot root** (não levantadas pelo prompt mas relevantes): coexistem `ATOM-ENGINE-ARCHIVE.md`, `CLAUDE.md`, `FASE1-README.md`, `MINDROOT-ROADMAP.md`, `PRODUCTION-SETUP.md`, `PROJECT-INSTRUCTIONS.md`, `ROADMAP.md`. Sete arquivos `.md` na raiz, dois roadmaps (`ROADMAP.md` + `MINDROOT-ROADMAP.md`), nenhum `README.md` canônico. Possível debt documental.

**Build Protocol vs Pentágono ATOM.md:** CLAUDE.md v3.0 fala em "4 Protocolos (todo agente executa internamente)". ATOM.md fala em "Pentágono" (5 vértices). PENTAGON.md cita "Genesis Build Protocol v1.0 — 5 agentes". **Três modelos parcialmente sobrepostos** sem reconciliação clara. Não é redundância pura — é vocabulário derivando.

---

## 8. Build health

| Check | Resultado |
|-------|-----------|
| `npx tsc --noEmit` | ✅ **0 errors** (exit 0) |
| `npx vitest run` | ✅ **462 / 462 passed** (24 suites, 3.77s) |
| `npm run build` | ✅ **OK** in 2.82s |
| Bundle (gzipped) | index 90.80 kB · supabase 45.90 kB · motion 37.76 kB · query 15.27 kB · pages 3-9 kB cada |
| Bundle total (raw) | ~1.0 MB JS / ~250 kB gzipped |

Build perfeito. Zero debt técnico no nível de compilação/testes.

---

## 9. Atom Envelope compliance (atom-engine-core)

| Doc | Tem envelope ASCII? | Status |
|-----|---------------------|--------|
| `ATOM.md` | ❌ não, header markdown | ➖ master doc — envelope não exigido |
| `PENTAGON.md` | ❌ não | ➖ master doc — envelope não exigido |
| `README.md`, `LICENSE` | — | ➖ |
| `law/system_spec_genesis_v5-0-3.md` | ❌ header markdown | ⚠️ é spec law-level, deveria ter envelope |
| `law/system_spec_marco-zero_v3-0.md` | ❌ header markdown | ⚠️ idem |
| `law/system_spec_atom-identidade_v1-1.md` | ✅ envelope ASCII completo | ✅ |
| `law/system_template_meta-template_v1-2.md` | ❌ header markdown | ⚠️ é o próprio meta-template — irônico, não usa o que prescreve |
| `specs/system_spec_atom-agent_v1-0.md` | ⚠️ YAML frontmatter (não ASCII envelope) | ⚠️ parcial — formato antigo |
| `specs/system_spec_guardiao-audit_v2-0.md` | ✅ envelope ASCII completo | ✅ |
| `specs/system_spec_yugar-vision_v0-1.md` | ⚠️ YAML frontmatter | ⚠️ parcial |
| `specs/system_template_roadmap-phi_v2-0.md` | ❌ header markdown | ⚠️ é template — também irônico |
| `mindroot/features/feature_*_v1-0.md` (14 files) | ❌ header markdown (amostra: feature_raiz) | ⚠️ inconsistente — features são docs operacionais, podem ficar como ➖ se forem master per feature |
| `wraps/system_wrap_*.md` (5 files) | ⚠️ formato `═══ ATOM WRAP ═══` — convenção própria | ➖ wraps usam formato Genesis Part 3.4 (válido por outra spec) |

**Score de compliance:** 2 envelopes ASCII completos (identidade, guardiao-audit) de ~10 docs que deveriam ter. **Coexistem 3 formatos:** ASCII envelope, YAML frontmatter, header markdown puro.

---

## Veredicto geral

**🟡 AMARELO** — Código verde-bandeira, lei verde, mas a camada de docs/operacional drifta.

- **Verde:** schema 100% sincronizado, geometria de imports íntegra, build/test/typecheck zero erros, type registry completo.
- **Amarelo:** FSM não reflete totalmente o contrato Genesis (born-committed, regressão, morph), zero testes do FSM, doc versioning desalinhado entre filename e header em quase toda law/, três vocabulários paralelos pra "como agentes constroem" (4 Protocolos / 5 Agentes / Pentágono), duplicação de roadmaps no mindroot root, paths inconsistentes (`mindroot` vs `mindroot-v2`).
- **Vermelho:** nenhum item.

---

## Ações sugeridas (não executar)

1. **Renomear arquivos law/ pra refletir versão real:** `system_spec_genesis_v5-0-3.md` → `_v5-0-4.md`, `system_spec_marco-zero_v3-0.md` → `_v3-1.md`, `system_spec_atom-identidade_v1-1.md` → `_v1-2.md`. Atualizar todas as refs em CLAUDE.md / PENTAGON.md / README.
2. **Decidir o nome do repo de visualização:** ou renomear a pasta local pra `mindroot-v2`, ou atualizar PENTAGON.md (5 ocorrências) e o commit subject pra `mindroot`. Branch `master` vs `ui-v2` idem.
3. **Atualizar PENTAGON.md HEAD-ref:** `8e6a06a0` → `7650cc9e` (commit de honest sync já entrou). PENTAGON está 1 commit atrás.
4. **Criar `src/engine/__test__/fsm.test.ts`** cobrindo os cenários do prompt: avanço estritamente sequencial, born-committed (wrap/session-log → 7), stage 6 opcional, regressão por perda de requisitos, morph regride pra 2.
5. **Reconciliar fsm.ts com Genesis:** ou (a) implementar born-committed e regressão no engine TS, ou (b) documentar explicitamente que essa lógica vive só em triggers PostgreSQL e o engine TS é "advance-only mirror".
6. **Reconciliar vocabulário "como construir":** decidir entre "4 Protocolos" (CLAUDE.md), "5 Agentes / Genesis Build Protocol" (PENTAGON), ou "Pentágono" (ATOM.md). Hoje os três coexistem e parecem três coisas diferentes — não são.
7. **Padronizar Atom Envelope em law/ e specs/:** escolher um formato (ASCII envelope ✅, YAML, header puro) e migrar os outros. Meta-template é o doc que prescreve, deveria praticar.
8. **Limpar docs root do mindroot:** 7 arquivos `.md` na raiz sem README canônico. Fundir `MINDROOT-ROADMAP.md` + `ROADMAP.md`, mover `FASE1-README.md` / `ATOM-ENGINE-ARCHIVE.md` pra `archive/`.
9. **Header obsoleto em `src/types/item.ts`:** trocar `Reference: Genesis v4.2` por `v5.0.4` (1 linha).
10. **Atualizar contagem de testes em CLAUDE.md:** `467 tests` → `462 tests` (ou rodar e ver se algum foi removido por engano).
11. **Seed:** *VS Code serve-web / Codespaces como ponte permanente entre Claude Project (Arca) e codebase — explorar quando infra estiver no ar.* Registrado pra Espiral 3 Resiliência/Propagação.

---

*Audit gerado por Guardião AUDITOR mode — read-only. Nenhum arquivo modificado, nada commitado. Output salvo em `audit-baseline-07apr.md` na root do atom-engine-core.*
