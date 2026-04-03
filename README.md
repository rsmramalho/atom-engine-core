<p align="center">
  <code>·  —  △  □  ⬠  ⬡  ○</code>
  <br/><br/>
  <strong>Atom Engine Core</strong>
  <br/>
  <sub>The brain of Atom HS — protocol, schema, rules, agent.</sub>
</p>

---

## What is this

The engine that powers [Atom HS](https://github.com/rsmramalho) (Human Systems). This repo contains the Genesis protocol, the schema that governs every item in the system, the specs that define every feature, and the local agent that organizes the physical filesystem.

If [MindRoot](https://github.com/rsmramalho/mindroot-v2) is the face, this is the brain.

## Architecture

```
atom-engine-core/
├── docs/                   Genesis protocol, Marco Zero, specs
│   ├── genesis-v5.md       The universal contract (7 stages, schema v2)
│   ├── marco-zero-v2.md    Operational guide
│   ├── meta-template.md    The template of templates
│   ├── atom-agent-v1.md    Local agent spec
│   └── ...                 All operational specs
├── design/
│   └── wireframes/         11 complete wireframes (HTML)
├── agent/                  Atom Agent — Python CLI
│   ├── src/
│   │   └── atom_agent/
│   │       ├── core/       classifier, dedup, namer, mover
│   │       ├── commands/   scan, watch, clean, protect, migrate, entropy
│   │       └── scanners/   filesystem, gmail, photos, calendar, drive
│   └── tests/
└── PENTAGON.md             Master roadmap (all 5 vertices)
```

## Genesis — the protocol

Every item in Atom HS progresses through 7 stages of maturation:

| Stage | Geometry | State | What happens |
|-------|----------|-------|-------------|
| 1 | `·` Point | inbox | Raw capture enters the system |
| 2 | `—` Line | classified | Type + module assigned |
| 3 | `△` Triangle | structured | Template applied, UUID generated |
| 4 | `□` Square | validated | 4 integrity gates passed |
| 5 | `⬠` Pentagon | connected | Connections to other items |
| 6 | `⬡` Hexagon | propagated | Effects cascade to connected items |
| 7 | `○` Circle | committed | Committed via wrap. Complete. |

Items advance sequentially, regress automatically when integrity breaks, and decompose into seeds when inactive — the seeds become new points. Fibonacci: each completion feeds new genesis.

## Atom Agent

The physical arm of Atom HS. A Python CLI that organizes the real filesystem.

```bash
atom-agent scan ~/Downloads          # organize chaos
atom-agent watch ~/Downloads         # monitor in background
atom-agent clean --duplicates        # find and remove duplicates
atom-agent protect --vitals          # verify backups of vital docs
atom-agent migrate photos --from a@x.com --to b@y.com
atom-agent entropy                   # lifecycle: trash, stale, seeds
```

Files are classified, deduplicated, renamed (Genesis naming convention), and physically moved to an organized filesystem (`AtomDrive/`). Every processed file becomes an indexed item in Supabase — visible in MindRoot.

## Schema

23 types · 8 modules · 8 states · 8 relations · Supabase (PostgreSQL + JSONB)

The schema is the contract. If tomorrow you swap Supabase for raw Postgres, or MindRoot for a CLI — the schema is the same.

## Related

| Repo | Role |
|------|------|
| [`mindroot-v2`](https://github.com/rsmramalho/mindroot-v2) | Web/mobile interface (React, TypeScript, Tailwind) |
| Supabase | Data layer (items, connections, events) |

## Status

**Genesis v5.0.1** — definitive spec. **Schema v2** — deployed.
**Atom Agent v1.0** — spec complete, build planned.

---

<sub>Private repository. Part of the <a href="https://github.com/rsmramalho">Atom HS</a> ecosystem.</sub>
