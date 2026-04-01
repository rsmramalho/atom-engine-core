╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [UUID — gerado no commit]  ║
║ type:     spec                       ║
║ module:   work                       ║
║ state:    structured                 ║
║ status:   active                     ║
║ stage:    3 △ Triângulo              ║
║ tags:     #mod_work,                 ║
║           #roadmap:RM-ATOM-OS,       ║
║           #project:atom-os           ║
║ source:   claude-project             ║
║ created:  2026-03-31                 ║
║ updated:  2026-04-01                 ║
║ project:  Atom OS                    ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → belongs_to: RM-MASTER            ║
║   → feeds: RM-CONSTELLATION          ║
║   → feeds: RM-MUDA                   ║
╚══════════════════════════════════════╝

# Roadmap — Atom OS (RM-ATOM-OS)

**Serial:** RM-ATOM-OS
**Projeto:** Atom OS — protocolo + interface — O Espelho — serve o indivíduo
**Pergunta:** "Como eu estou?"
**Horizonte:** Sistema operacional pessoal web-based. Presença > produtividade.
**Decisão arquitetural (31 Mar 2026):** MindRoot não é produto separado. É a interface do Atom OS.

---

## Base: Protocolo (Atom Engine)

- Genesis v5.0.1 + Schema v2 (lei — Knowledge base do Project Atom)
- Marco Zero v2.0 (operacional)
- Meta-Template v1.1 (molde dos moldes)
- type-schemas.json com 23 types (src/config/ do mindroot)
- Supabase: 3 tabelas deployed (items, item_connections, atom_events)
- Triggers: sync_genesis_stage, orphan_check
- RPCs: morph_item, decay_item, propagate_effect, commit_item
- RLS ativo. Audit views (orphans, below_floor, stale)
- GitHub: rsmramalho/atom-engine-core (specs, design, roadmaps)

## Base: Interface (MindRoot → Atom OS UI)

- Repo: rsmramalho/mindroot (branch ui-v2)
- Stack: React 19 + TypeScript 5.8 + Vite 6 + Tailwind + Supabase + Zustand
- Deploy: mindroot.com.au (Vercel)
- Design system v2: DM Sans, light-first (#FDFCF9), 8 module colors, 7 stage colors
- 11 wireframes completos: atom-engine-core/design/wireframes/
- 74 decisões UX (D0-D74)
- Component library: GeometryIcon, TypeChip, ModuleBar, StageBadge, ConfidenceBar, FAB
- 4-tab BottomNav: Home, Pipeline, Projects, Calendar

## Base: Raiz (Onboarding — Genesis v5 seção 4)

- 9 domínios × 7 estágios Genesis
- 3 portas de entrada (fácil / o que incomoda / me guia)
- Protocolo de sessão: micro (5-10min), padrão (15-30min), deep (1-2h)
- Soul checkpoints integrados
- Anti-entropia: manutenção semanal/mensal/trimestral
- Zero schema novo — types existentes + tags #domain:*
- Wireframes: telas 10-11 (Raiz Onboarding + Raiz Dashboard)

---

## Implementação — Fases do MindRoot

### Fase 0 — Foundation ✅ FEITO (commit a293)
- Design tokens (tokens.ts)
- 6 atom components (GeometryIcon, TypeChip, ModuleBar, StageBadge, ConfidenceBar, FAB)
- Tailwind config atualizado
- Routing e layout base

### Fase 1 — Home ✅ FEITO (commit d827)
- SoulCard (orbe energia, emoção, intention)
- WrapBanner (sugestão de wrap no crepúsculo)
- Home reestruturada (Soul → Input → Items → Inbox)
- Períodos aurora/zênite/crepúsculo

### Fase 2 — Pipeline + Triage ✅ FEITO (commit 6543)
- Pipeline vertical por estágio (7 stages funnel)
- Triage flow com confiança (3 faixas)
- Auto-classify com UI de confirmação
- FAB de captura

### Fase 3 — Wrap + FSM ✅ FEITO (commit 8cf2)
- fsm.ts: state transitions, floor checks, orphan downgrades
- wrap.ts: session collection, audit computation, entropy detection
- WrapStepper: 7 passos = 7 estágios Genesis
- CommitAnimation: ·→—→△→□→⬠→⬡→○
- Pós-commit: stats + NEXT + "boa noite, Rick. ○"

### Fase 4 — Projects + Calendar + Raiz Onboarding ⬜ PRÓXIMO
- Lista de projetos com cards (milestone + última atividade)
- Detalhe de projeto (progresso, items, connections, links)
- Google Calendar integration
- Raiz onboarding flow: primeiro contato → portas → inventário
- Dashboard de domínios: matriz visual 9 × 7
- Session protocol: micro / padrão / deep

### Fase 5 — Analytics + Library + Reflexões + Settings + Raiz Dashboard ⬜ FUTURO
- Pipeline health (items por estágio, tempo médio, throughput)
- Soul patterns (emoções ao longo do tempo, correlações)
- Connection graph (visualização nativa)
- Library (podcasts, articles, recommendations)
- Reflexões (feed cronológico)
- Settings (perfil, tema, módulos, exports)
- Raiz dashboard permanente (saúde da vida, regressão, anti-entropia)
- Export to Drive/Obsidian (botões sob demanda)

---

## Regras

1. **Dual-track:** Este roadmap vive no trilho CONSTRUIR (aurora).
2. **O schema é o contrato, não o código.** Genesis v5.0.1 é a lei.
3. **Design system:** DM Sans, light-first, module colors, geometrias Genesis.
4. **Rick é o primeiro usuário.** Constellation é o primeiro consumidor externo.
5. **Um commit por fase** no Claude Code. Build passa antes de push.
6. **Source of truth:** KB (lei), atom-engine-core (specs/roadmaps), mindroot (código).
7. **Drive é MORTO.** Nunca consultar, criar, ou modificar no Drive.

---

## Connections

- belongs_to:: [[RM-MASTER]]
- feeds:: [[RM-CONSTELLATION]]
- feeds:: [[RM-MUDA]]
