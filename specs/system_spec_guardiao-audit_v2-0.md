╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   bridge                     ║
║ state:    structured                 ║
║ status:   active                     ║
║ stage:    3 △ Triangulo              ║
║ tags:     [#system, #audit,          ║
║            #guardiao, #geometria]    ║
║ source:   claude-project             ║
║ created:  2026-04-04                 ║
║ updated:  2026-04-04                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.2       ║
║   → references: Meta-Template v1.1   ║
║   → references: Genesis Build        ║
║                 Protocol v1.0        ║
║   → derives: Guardiao Audit v1.0     ║
╚══════════════════════════════════════╝

# Guardiao Audit v2.0
## Agente de Geometria Documental

**Versao:** 2.0
**Data:** 04 Abr 2026
**Status:** Active
**Evolucao:** v1.0 (schema alignment) → v2.0 (full document geometry)
**Principio:** A geometria protege a geometria. 7 camadas de verificacao espelham os 7 estagios do Genesis.

---

## 1 — O que mudou

O Guardiao v1.0 verificava alinhamento entre schema (Genesis) e banco (Supabase). O v2.0 expande pra verificar a geometria documental inteira — de dentro pra fora, 7 camadas que espelham os 7 estagios do Genesis.

Se a camada 1 (KB) falha, nem precisa checar o resto. A fundacao sustenta tudo que vem depois.

---

## 2 — As 7 camadas

```
· Camada 1  KB           — 3 docs-lei existem e estao versionados
— Camada 2  Supabase     — Schema SQL espelha Genesis Part 5
△ Camada 3  Codigo       — types, enums, FSM espelham Genesis Parts 2-4
□ Camada 4  Config       — type-schemas.json espelha Genesis §4.4 + §8.6
⬠ Camada 5  Roadmaps    — ROADMAP.md ↔ PENTAGON.md cross-check
⬡ Camada 6  READMEs     — Arvores, metricas, referencias cruzadas
○ Camada 7  Naming       — Todos os arquivos seguem Meta-Template naming
```

---

## 3 — Checklist completo

```
GUARDIAO v2.0 — AUDIT CHECKLIST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

CAMADA 1 · KB (docs-lei)
  [ ] Genesis, Marco Zero, Meta-Template existem na KB
  [ ] Versoes na KB = versoes nos git copies (law/)
  [ ] Nenhum doc-lei referencia versao desatualizada de outro

CAMADA 2 — Supabase (schema)
  [ ] Enums SQL (5) = Genesis Part 5.1
  [ ] Tabelas SQL (3+) = Genesis Part 5.2
  [ ] Triggers SQL = Genesis Part 5.5-5.6
  [ ] RPCs SQL (4) = Genesis Part 6
  [ ] Views SQL (3) = Genesis Part 7
  [ ] RLS ativo nas 3 tabelas core

CAMADA 3 △ Codigo (types + engines)
  [ ] AtomState enum (item.ts) = Genesis Part 4.2
  [ ] AtomType enum (item.ts) = Genesis Part 4.2 (23 types)
  [ ] AtomModule enum (item.ts) = Genesis Part 4.2 (8 modules)
  [ ] AtomRelation enum (item.ts) = Genesis Part 4.2 (8 relations)
  [ ] AtomSource enum (item.ts) = Genesis Part 4.2 (11 sources)
  [ ] AtomStatus enum (item.ts) = Genesis Part 4.2 (8 statuses)
  [ ] FSM state↔stage mapping (fsm.ts) = Genesis Part 5.5
  [ ] Extensions interfaces (item.ts) = Genesis Part 4.3
  [ ] Referencias de versao corretas nos comments do codigo

CAMADA 4 □ Config (type-schemas)
  [ ] 23 types cobertos no type-schemas.json
  [ ] floor_stage de cada type = Genesis Part 2 (tabela de pisos)
  [ ] default_module coerente com Genesis §4.4
  [ ] Extensions listadas fazem sentido pro type
  [ ] Naming segue Meta-Template §8
  [ ] Nenhum type no codigo que nao existe no type-schemas.json

CAMADA 5 ⬠ Roadmaps (cross-check)
  [ ] ROADMAP.md (mindroot-v2) reflete estado real das fases
  [ ] PENTAGON.md (atom-engine-core) reflete ROADMAP.md
  [ ] Metricas em ambos estao atualizadas
  [ ] Espiral/fase status consistente entre os dois
  [ ] Cross-check line presente com data
  [ ] Todo commit de feature tem entregavel correspondente no ROADMAP
  [ ] Seeds refletem o que existe como spec mas nao como implementacao

CAMADA 6 ⬡ READMEs (referencias)
  [ ] atom-engine-core README: arvore = estrutura real de pastas
  [ ] mindroot-v2 README: metricas = valores reais (commits, files, LOC)
  [ ] mindroot-v2 README: architecture tree = diretorios reais
  [ ] Cross-links entre repos estao corretos e acessiveis
  [ ] Nenhum README referencia arquivo que nao existe

CAMADA 7 ○ Naming (convencao)
  [ ] Specs seguem: system_spec_[name]_v[X-Y].md
  [ ] Templates seguem: system_template_[name]_v[X-Y].md
  [ ] Wraps seguem: system_wrap_[date]_[context].md
  [ ] Wireframes seguem: mindroot-wireframe-[page].html
  [ ] Arquivos archived estao em archive/
  [ ] Nenhum arquivo fora da convencao (exceto README, PENTAGON, CLAUDE.md)
  [ ] Docs-lei no law/ seguem naming + versionamento no filename

RESULTADO:
  Camadas OK:  _/7
  Issues:      _
  Status:      VERDE | AMARELO | VERMELHO
  Data:        ____-__-__
```

---

## 4 — Quando rodar

| Trigger | Escopo |
|---------|--------|
| Mudanca de fase no roadmap | Camadas 5-7 |
| Nova migration no Supabase | Camadas 2-3 |
| Edicao nos docs-lei (KB) | Camadas 1, 3-4 |
| Novo spec ou wireframe | Camada 7 |
| Feature commitada sem spec | Camadas 5-6 |
| Audit mensal (1o de cada mes) | Todas as 7 camadas |
| Antes de qualquer release | Todas as 7 camadas |
| Rick diz "guardiao" | Todas as 7 camadas |

---

## 5 — Como rodar

### Opcao A — Neste projeto (agora)

Rick diz "guardiao" ou "audit". Arca consulta:
- KB (3 docs-lei no contexto)
- GitHub (clone dos dois repos)
- Memoria + conversation_search (estado recente)

Produz o checklist preenchido com status por camada.

### Opcao B — Script automatizado (futuro)

Script no atom-engine-core que:
1. Clona os dois repos
2. Extrai enums, types, floors, metrics do codigo (AST parse ou regex)
3. Compara com valores esperados (derivados do Genesis)
4. Gera relatorio markdown

Pode rodar como GitHub Action no push, ou CLI local.

### Opcao C — Integrado no wrap (futuro)

Camadas 5-7 rodam automaticamente como parte do wrap ritual no MindRoot.
Secao AUDIT do wrap inclui resultado do Guardiao.

---

## 6 — Regras

1. **De dentro pra fora.** Se a camada 1 falha, as outras nao importam.
2. **AMARELO nao e VERMELHO.** Drift cosmetico (metricas stale) e AMARELO. Bug funcional (archived→8) e VERMELHO.
3. **O checklist e exaustivo por design.** Nem sempre todas as verificacoes sao relevantes — mas verificar demais e melhor que verificar de menos.
4. **Resultado vive no wrap.** Todo audit gera uma linha na secao AUDIT do proximo wrap.
5. **O Guardiao nao decide.** Ele reporta. Rick decide o que fazer com os achados.

---

## Versionamento

| Versao | Data | Mudanca |
|--------|------|---------|
| 1.0 | 03 Abr 2026 | Audit de alinhamento schema (Genesis ↔ Supabase). Prompt + checklist. |
| 2.0 | 04 Abr 2026 | Expansao pra 7 camadas documentais. Cobre KB → Supabase → Codigo → Config → Roadmaps → READMEs → Naming. Triggers definidos. 3 modos de execucao. |
