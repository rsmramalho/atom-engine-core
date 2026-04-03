# Atom Engine Core

The brain of Atom HS — specs, protocols, and the universal schema that defines how information matures.

**Version:** Genesis v5.0.1 + AtomItem Schema v2
**Status:** Active — production validated
**Principle:** The schema is the contract. Code is a consumer.

## What is this

Atom Engine Core is the specification layer for [Atom HS](https://github.com/rsmramalho/mindroot-v2) (Human Systems). It contains the law documents, design specs, and operational protocols that every implementation follows. No application code — only contracts.

## The Genesis Protocol

Genesis defines how any piece of information — a task, a recipe, a reflection, a project — is captured, matures, connects, and completes. 7 stages, sacred geometry, one state machine:

```
  ·  Ponto       — Capture       inbox
  —  Linha       — Classified    type + module assigned
  △  Triangulo   — Structured    template applied
  □  Quadrado    — Validated     4 integrity gates
  ⬠  Pentagono   — Connected     linked to other items
  ⬡  Hexagono    — Activated     effects propagated
  ○  Circulo     — Committed     finalized in daily wrap
```

**Properties:** advance sequentially (never skip), regress on lost requirements, mutate (morph) preserves history, entropy extracts seeds from completed items. The cycle is Fibonacci — each completion feeds new beginnings.

## Documents

### Law (3)
| Document | What it defines |
|----------|----------------|
| **Genesis v5.0.1** | Universal contract. 23 types, 8 modules, 7 stages, state machine, SQL schema, RPCs, audit views. |
| **Marco Zero v2.0** | Operational guide. How the system is used day-to-day. Soul layer, rituals, wrap protocol. |
| **Meta-Template v1.1** | Template of templates. Exact structure every item template follows. |

### Specs (3)
| Document | What it defines |
|----------|----------------|
| **Genesis Build Protocol v1.0** | Agent orchestration for Claude Code. 5 agents (Guardian, Root, Structure, Interface, Web), inside-out construction. |
| **Guardian Audit v1.0** | Geometric alignment verification ritual. Run before new phases, after law changes, or when something feels off. |
| **Yugar Vision v0.1** | Long-term vision document. Property as living organism. |

### Templates (1)
| Document | What it defines |
|----------|----------------|
| **Roadmap PHI v2.0** | Universal roadmap format. Fibonacci spiral (1-1-2-3-5-8-13), protocol field per phase. |

### Master
| Document | What it defines |
|----------|----------------|
| **PENTAGON.md** | Cross-project master roadmap. 6 vertices (Atom HS at center), dependency map, audit trail. |

## Schema

**23 types:** note, reflection, recommendation, podcast, article, resource, list, task, habit, recipe, workout, spec, checkpoint, project, session-log, wrap, ritual, review, log, doc, research, template, lib

**8 modules:** work, body, mind, family, purpose, bridge, finance, social

**8 states:** inbox, classified, structured, validated, connected, propagated, committed, archived

**Type floors:** each type has a minimum maturity stage (tasks need structure at stage 3, projects need connections at stage 5)

## Build Protocol

The Genesis Build Protocol defines how features are built using Claude Code:

| Protocol | Agents | When |
|----------|--------|------|
| `inner` | Guardian | Architecture decisions, spec validation |
| `foundation` | Guardian + Root | New tables, schema changes |
| `logic` | Guardian + Root + Structure | Backend without UI |
| `full` | All 5 agents | Complete features |
| `surface` | Interface only | Visual changes, no data |

Each agent only sees what was born before it. The geometry is preserved because decisions flow from the contract, not from assumptions.

## The Pentagon

```
              V2 Constellation
             /                \
        V6 Lab            V3 Atlas
            |                 |
        V5 Yugar          V4 Muda
             \                /
              — V1 Atom HS —
                 (center)
```

Atom HS is the center — it feeds all vertices. Everything else orbits around it.

## Related

- **[mindroot-v2](https://github.com/rsmramalho/mindroot-v2)** — The UI layer. React + TypeScript + Supabase. Where Genesis becomes touchable.

## License

To be defined. Intended as open-source after internal validation.
