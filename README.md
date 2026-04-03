<p align="center">
  <code>·  —  △  □  ⬠  ⬡  ○</code>
  <br/><br/>
  <strong>Atom Engine Core</strong>
  <br/>
  <sub>The brain of Atom HS — protocol, schema, specs, design.</sub>
</p>

---

## What is this

The engine that powers [Atom HS](https://github.com/rsmramalho) (Human Systems). This repo contains the Genesis protocol, the schema that governs every item in the system, and the specs that define every feature.

If [MindRoot](https://github.com/rsmramalho/mindroot-v2) is the face, this is the brain.

## Architecture

```
atom-engine-core/
├── PENTAGON.md                         Master roadmap (all 6 vertices)
├── law/                                3 docs-lei (git-versioned copies)
│   ├── system_spec_genesis_v5-0-1.md   The universal contract
│   ├── system_spec_marco-zero_v2-0.md  Operational guide
│   └── system_template_meta-template_v1-1.md
├── specs/                              Active specs
│   ├── system_spec_atom-agent_v1-0.md
│   ├── system_spec_genesis-build-protocol_v1-0.md
│   ├── system_spec_guardiao-audit_v1-0.md
│   ├── system_spec_yugar-vision_v0-1.md
│   └── system_template_roadmap-phi_v2-0.md
├── wraps/                              Session wraps
├── design/
│   └── wireframes/                     11 interactive wireframes (HTML)
├── sql/                                Reference SQL
└── archive/                            Superseded docs and templates
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
**Espiral 1** — complete. **Espiral 2** — in progress (F1 done, F2 partial).

---

<sub>Private repository. Part of the <a href="https://github.com/rsmramalho">Atom HS</a> ecosystem.</sub>
