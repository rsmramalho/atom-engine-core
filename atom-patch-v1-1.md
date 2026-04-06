# ATOM.md — Patch v1.0 → v1.1
## O que muda e onde

**Data:** 06 Abr 2026
**Motivo:** Incorporação do AUDITOR (center duplo) + absorção do genesis-build-protocol.

---

## SEÇÃO: ⬠ Pentágono — A matriz de construção

### O que muda

A tabela de 5 agentes passa a refletir o centro duplo.
O Guardião existia como ponto único — agora é duas faces do mesmo ponto.

### Substituir a tabela atual por:

| # | Agente | Geometria | Papel | Nunca faz |
|---|--------|-----------|-------|-----------|
| · | **GUARDIÃO** | · (centro) | Interpreta o contrato. Mecanismos ativos. Questiona origem, detecta trava. | Construir |
| · | **AUDITOR** | · (centro) | Enforça o contrato. Determinístico. Retorna ✅/❌. | Interpretar |
| 1 | Root | — | Banco, schema, migrations | Interface |
| 2 | Estrutura | △ | Services, hooks, engines | UI |
| 3 | Interface | □ | Pages, components, UX | Lógica de negócio |
| 4 | Teia | ⬠ | Testes, cross-check, validação | Decidir |

**O centro duplo:**

```
                    · Ponto
                   /        \
          GUARDIÃO            AUDITOR
        interpreta            enforça
        mecanismos            binário
        questiona             verifica
        abre                  fecha
```

Não são sequenciais. Não são hierárquicos. São contrapesos.

**Conflito entre os dois:** GUARDIÃO interpreta primeiro. AUDITOR enforça depois. A ordem não inverte.

**Quando cada um opera:**

| Trigger | Quem |
|---------|------|
| Decisão arquitetural, spec nova, dúvida de origem | GUARDIÃO |
| Cross-check, audit, PENTAGON sync, validação de migration | AUDITOR |
| Fim de qualquer fase | AUDITOR (automático via TEIA) |
| Resultado ❌ do AUDITOR | GUARDIÃO (resolve o que falta) |

---

## SEÇÃO: ⬡ Hexágono — Enforcement

### O que muda

Hook 1 (Pre-task) passa a ter dois níveis — GUARDIÃO e AUDITOR com funções separadas.

### Substituir Hook 1 por:

### Hook 1: Pre-task — centro duplo

**GUARDIÃO (interpreta):**
```
Antes de qualquer sessão, questionar:
1. Qual pilar essa task toca? (coluna da matriz)
2. Isso nasce de dentro pra fora ou da periferia?
3. O pilar de origem tem flow E2E verificado?
4. O que não sei antes de começar? (listar — proporção invertida)
```

**AUDITOR (enforça):**
```
Verificar binário antes de construir:
[ ] Genesis schema alinhado com DB?
[ ] type-schemas.json consistente com o código?
[ ] Feature tem spec antes de ter código?
[ ] Spec tem connection no Genesis?
[ ] PENTAGON.md reflete estado atual?
```

Se qualquer ❌ → Claude Code para e reporta. GUARDIÃO decide como resolver.

---

## SEÇÃO: Árvore de documentos (○ Círculo)

### O que muda

`build-protocol.md` absorve o conteúdo do `system_spec_genesis-build-protocol_v1-0.md`.
O arquivo original vai para `/archive/`.

### Substituir referência por:

```
├── operations/
│   ├── marco-zero.md          ← Operacional do Rick
│   ├── build-protocol.md      ← 5 agentes + centro duplo (absorve genesis-build-protocol v1)
│   └── meta-template.md
```

**Nota:** `CLAUDE.md` permanece na raiz dos repos como arquivo executável — não é documentação, é instrução operacional para o Claude Code. Referencia o ATOM.md como fonte. Não é absorvido.

---

## SEÇÃO: Versionamento

### Adicionar linha:

| 1.1 | 06 Abr 2026 | Centro duplo adicionado ao Pentágono (GUARDIÃO + AUDITOR). Hook 1 do Hexágono atualizado com dois níveis. genesis-build-protocol absorvido em operations/build-protocol.md. |

---

## Arquivos a mover

| Arquivo | Ação |
|---------|------|
| `specs/system_spec_genesis-build-protocol_v1-0.md` | → `archive/` |
| `specs/system_spec_auditor_v1-0.md` | conteúdo absorvido pelo ATOM.md — pode ir para `archive/` também ou manter como referência expandida |
| `CLAUDE.md` | permanece na raiz dos repos — não muda |

---

*Patch cirúrgico. Só o que muda. O resto do ATOM.md permanece intacto.*
