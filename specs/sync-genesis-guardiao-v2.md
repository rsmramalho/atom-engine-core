# Sync de dentro pra fora — 3 partes

---

## PARTE 1: Edições no Genesis v5.0.2 (atualizar na KB)

As edições abaixo são pra aplicar no documento Genesis na Knowledge base do Project Atom.
Depois de aplicar na KB, o Claude Code sincroniza a cópia em `law/system_spec_genesis_v5-0-1.md`.

### Edição 1 — Part 2: Tabela de pisos (adicionar 3 types)

Na tabela "Piso mínimo por type", encontrar:

```
| checkpoint | 3 (Triângulo) | Documento estruturado |
```

Substituir por:

```
| checkpoint | 3 (Triângulo) | Documento estruturado |
| ritual | 3 (Triângulo) | Body schema (intention, anchors, time_window). Precisa de estrutura |
| review | 3 (Triângulo) | Body schema (subject, rating, highlights). Precisa de estrutura |
| template | 3 (Triângulo) | Define a geometria de um type. Precisa de estrutura |
```

### Edição 2 — Part 4.4: Type Registry aponta pro JSON

Na seção "4.4 Type Registry (body_schema por type)", encontrar a tabela inteira que começa com:

```
| Type | Body schema | Module default |
```

Substituir toda a tabela (incluindo a nota abaixo sobre "Types sem body") por:

```
### Referência canônica

A referência autoritativa dos body schemas por type é `type-schemas.json` no repo MindRoot (`src/config/type-schemas.json`). Este arquivo é carregado no build e contém floor_stage, default_module, has_body_schema, body_schema, extensions, naming, e usage_notes para cada um dos 23 types.

O helper tipado `src/config/types.ts` exporta: `getTypeSchema()`, `getFloorStage()`, `getDefaultModule()`, `hasBodySchema()`, `getExtensions()`.

**Design original (v5.0.1) vs implementação viva:**
A tabela abaixo documenta o design original dos body schemas. A implementação no `type-schemas.json` evoluiu com o primeiro uso real de cada type — seguindo o princípio "Templates nascem do uso: o primeiro item de um type cria o template ao vivo." Quando há divergência, `type-schemas.json` é a referência operacional.

| Type | Body schema (design original v5.0.1) | Module default |
|------|---------------------------------------|----------------|
| recipe | `{ cuisine, serves, prep_time, cook_time, difficulty, ingredients[], steps[] }` | body |
| workout | `{ focus, frequency, level, duration, equipment[], exercises[] }` | body |
| ritual | `{ intention, anchors[], time_window, duration }` | purpose |
| review | `{ period, checklist_items[], reflection, adjustments }` | bridge |
| spec | `{ overview, architecture, data_model, implementation, open_questions[] }` | work |
| checkpoint | `{ done[], pending[], decisions[], next_steps[] }` | work |
| session-log | `{ summary, files_created[], decisions[], pending[], continuation_prompt }` | bridge |
| recommendation | `{ category, recommended_by, source_url, why, rating }` | varies |
| podcast | `{ show_name, episode, topic, key_takeaways[], source_url }` | mind |
| article | `{ author, publication, topic, key_points[], source_url }` | mind |

Types sem body (usam notes + tags): project, task, habit, note, reflection, resource, list, log, doc, research, template, lib, wrap

**Migração pra tabela SQL (futuro):** `type-schemas.json` migra pra tabela SQL (`type_schemas`) se/quando precisar de types dinâmicos (ex: usuário criando types customizados). Esse futuro não é agora.
```

### Edição 3 — Versionamento

Adicionar ao final da tabela de versionamento:

```
| Genesis 5.0.2 + Schema 2.0 | 04 Abr 2026 | Pisos: ritual (3), review (3), template (3) adicionados à tabela. §4.4 Type Registry: type-schemas.json declarado como referência canônica dos body schemas. Tabela original preservada como design intent. Zero mudanças estruturais. |
```

### Edição 4 — Versão no header

Alterar a versão no topo do documento:

```
**Versão:** 5.0.2
```

---

## PARTE 2: Instrução pro Claude Code (fixes de código + sync law/)

Cola isto no Claude Code:

---

### Job: Fix fsm.ts + item.ts + sync Genesis law/ copy

#### Fix 1 — fsm.ts: archived stage

Arquivo: `src/engine/fsm.ts` (mindroot-v2)

Encontrar:
```typescript
  archived: 8,
```

Substituir por:
```typescript
  archived: 7,
```

#### Fix 2 — item.ts: referência de versão

Arquivo: `src/types/item.ts` (mindroot-v2)

Encontrar:
```typescript
// Reference: Genesis v4.2 + AtomItem Schema v2
```

Substituir por:
```typescript
// Reference: Genesis v5.0.2 + AtomItem Schema v2
```

#### Verificação

```bash
cd mindroot-v2
npx vitest run   # 41 testes devem passar
npm run build    # build limpo
```

#### Commit mindroot-v2

```bash
git add src/engine/fsm.ts src/types/item.ts
git commit -m "$(cat <<'EOF'
fix: archived stage 8→7, item.ts reference v4.2→v5.0.2

fsm.ts: archived mapped to stage 8 but Genesis and DB trigger
say 7. DB constraint CHECK(1-7) would reject 8. Fixed.
item.ts: version reference updated to Genesis v5.0.2.

Co-Authored-By: Claude Opus 4.6 (1M context) <noreply@anthropic.com>
EOF
)"
git push
```

#### Sync law/ copy (atom-engine-core)

Depois do commit do mindroot-v2, abrir `atom-engine-core/law/system_spec_genesis_v5-0-1.md`.

Aplicar as mesmas 4 edições do PARTE 1 acima (pisos, §4.4, versionamento, header).

Renomear o arquivo:
```bash
cd atom-engine-core
git mv law/system_spec_genesis_v5-0-1.md law/system_spec_genesis_v5-0-2.md
```

Commit:
```bash
git add -A
git commit -m "$(cat <<'EOF'
docs: Genesis v5.0.2 — pisos completos, type-schemas.json canônico

Part 2: ritual (3), review (3), template (3) adicionados à tabela de pisos.
Part 4.4: type-schemas.json declarado como referência canônica dos body schemas.
Tabela original preservada como design intent v5.0.1. Zero mudanças estruturais.

Co-Authored-By: Claude Opus 4.6 (1M context) <noreply@anthropic.com>
EOF
)"
git push
```

#### NÃO fazer

- Não mexer em nenhum outro arquivo do mindroot-v2
- Não mexer no ROADMAP.md nem CLAUDE.md
- Não alterar type-schemas.json (ele é a referência, não muda)
- Não mexer no Marco Zero nem no Meta-Template

---

## PARTE 3: Guardião v2.0 — Agente de Geometria Documental

### O que é

O Guardião v1.0 verifica alinhamento entre schema (Genesis) e banco (Supabase).
O Guardião v2.0 expande pra verificar a geometria documental inteira — de dentro pra fora.

### As 7 camadas de verificação

```
Camada 1 · KB          — 3 docs-lei existem e estão versionados
Camada 2 — Supabase    — Schema SQL espelha Genesis Part 5
Camada 3 △ Código      — types, enums, FSM espelham Genesis Parts 2-4
Camada 4 □ Config      — type-schemas.json espelha Genesis §4.4 + §8.6
Camada 5 ⬠ Roadmaps   — ROADMAP.md ↔ PENTAGON.md cross-check
Camada 6 ⬡ READMEs    — Árvores, métricas, referências cruzadas
Camada 7 ○ Naming      — Todos os arquivos seguem Meta-Template naming
```

### Checklist do Guardião v2.0

```
GUARDIÃO v2.0 — AUDIT CHECKLIST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

CAMADA 1 · KB (docs-lei)
  [ ] Genesis, Marco Zero, Meta-Template existem na KB
  [ ] Versões na KB = versões nos git copies (law/)
  [ ] Nenhum doc-lei referencia versão desatualizada de outro

CAMADA 2 — Supabase (schema)
  [ ] Enums SQL = Genesis Part 5.1
  [ ] Tabelas SQL = Genesis Part 5.2
  [ ] Triggers SQL = Genesis Part 5.5-5.6
  [ ] RPCs SQL = Genesis Part 6
  [ ] Views SQL = Genesis Part 7

CAMADA 3 △ Código (types + engines)
  [ ] AtomState enum (item.ts) = Genesis Part 4.2
  [ ] AtomType enum (item.ts) = Genesis Part 4.2
  [ ] AtomModule enum (item.ts) = Genesis Part 4.2
  [ ] AtomRelation enum (item.ts) = Genesis Part 4.2
  [ ] AtomSource enum (item.ts) = Genesis Part 4.2
  [ ] FSM state↔stage mapping (fsm.ts) = Genesis Part 5.5
  [ ] Extensions interfaces (item.ts) = Genesis Part 4.3
  [ ] Referências de versão corretas nos comments

CAMADA 4 □ Config (type-schemas)
  [ ] 23 types cobertos no type-schemas.json
  [ ] floor_stage de cada type = Genesis Part 2
  [ ] default_module coerente com Genesis §4.4
  [ ] Extensions listadas fazem sentido pro type
  [ ] Naming segue Meta-Template §8

CAMADA 5 ⬠ Roadmaps (cross-check)
  [ ] ROADMAP.md (mindroot-v2) reflete estado real das fases
  [ ] PENTAGON.md (atom-engine-core) reflete ROADMAP.md
  [ ] Métricas em ambos estão atualizadas
  [ ] Espiral/fase status consistente entre os dois
  [ ] Cross-check line presente com data

CAMADA 6 ⬡ READMEs (referências)
  [ ] atom-engine-core README: árvore = estrutura real
  [ ] mindroot-v2 README: métricas = valores reais
  [ ] mindroot-v2 README: architecture tree = dirs reais
  [ ] Cross-links entre repos estão corretos

CAMADA 7 ○ Naming (convenção)
  [ ] Todos os specs seguem: system_[type]_[name]_[version].md
  [ ] Wireframes seguem: mindroot-wireframe-[page].html
  [ ] Wraps seguem: system_wrap_[date]_[context].md
  [ ] Nenhum arquivo fora da convenção (exceto README, PENTAGON, CLAUDE)

RESULTADO:
  Camadas OK:  _/7
  Issues:      _
  Status:      VERDE | AMARELO | VERMELHO
```

### Quando rodar

| Trigger | Escopo |
|---------|--------|
| Mudança de fase no roadmap | Camadas 5-7 |
| Nova migration no Supabase | Camadas 2-3 |
| Edição nos docs-lei (KB) | Camadas 1, 3-4 |
| Novo spec ou wireframe | Camada 7 |
| Audit mensal (1º de cada mês) | Todas as 7 camadas |
| Antes de qualquer release | Todas as 7 camadas |

### Como rodar

**Opção A — Manual (neste projeto):**
Rick diz "guardião" ou "audit". Arca roda o checklist consultando repos + memória + KB.

**Opção B — Script automatizado (futuro):**
Script em atom-engine-core que faz git clone dos dois repos, extrai enums/types/floors do código, compara com o esperado, e gera relatório. Pode rodar como GitHub Action ou CLI local.

### Onde vive

`atom-engine-core/specs/system_spec_guardiao-audit_v2-0.md`
Substitui o v1.0 (que vira referência histórica no archive/).
