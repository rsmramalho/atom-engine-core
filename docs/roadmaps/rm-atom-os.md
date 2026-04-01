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
║           #project:atom-engine,      ║
║           #project:mindroot          ║
║ source:   claude-project             ║
║ created:  2026-03-31                 ║
║ updated:  2026-03-31                 ║
║ project:  Atom OS                    ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → belongs_to: project-atom-engine  ║
║   → belongs_to: RM-MASTER            ║
║   → feeds: RM-CONSTELLATION         ║
║   → feeds: RM-MUDA                  ║
╚══════════════════════════════════════╝

## Roadmap — Atom OS (RM-ATOM-OS)

**Serial:** RM-ATOM-OS
**Projeto:** Atom OS — protocolo + interface — O Espelho — serve o indivíduo
**Pergunta:** "Como eu estou?"
**Milestone atual:** C1 (fundação)
**Horizonte:** Sistema operacional pessoal web-based. Presença > produtividade.

**Decisão arquitetural (31 Mar 2026):** MindRoot não é produto separado. É a interface do Atom OS.

---

### Base: Protocolo (Atom Engine)

- Genesis v4.2.1 + Schema v2
- Marco Zero v1.3
- Meta-Template v1.0
- 12 templates commitados
- GitHub rsmramalho/atom-engine-core
- Supabase 3 tabelas deployed
- drive-tools.js operacional
- Clean Claude test validado

### Base: Interface (MindRoot → Atom OS UI)

- v1.0.0-alpha.25.2 (51 componentes, 467 testes, 21.655 LOC)
- Stack: React 19 + TypeScript 5.8 + Vite 6 + Tailwind + Supabase + Claude API
- Deploy: Vercel (mindroot.com.au)
- Core Loop + Soul Layer funcionais
- Ritual Aurora/Zênite/Crepúsculo implementado
- PWA + Google Auth + Analytics + Notifications + AI parsing
- Design system: Cormorant/Inter/JetBrains, dark theme, amber #b8976e
- M1+M2+M3 completos

---

### C1 — Fundação do OS
**Status:** in_progress

| Task | Status | Notas |
|------|--------|-------|
| OAuth callback estabilização definitiva | pending | Bloqueio #1 |
| Supabase RPCs operacionais | pending | SQL existe, falta edge functions |
| Pipeline end-to-end testado | pending | Teste real do Genesis no OS |
| OnboardingWizard QA em produção | pending | |
| Propagar amber #b8976e | pending | |
| Cockpit Standard spec | pending | |

**Métrica de saída:** 10 logins sem falha. Pipeline completo. RPCs chamáveis.

### C2 — Automação
**Status:** not_started

| Task | Status |
|------|--------|
| Drive↔Obsidian sync via n8n | pending |
| Auto-triage Engine implementado | pending |
| Captura chat → Drive+Supabase automático | pending |
| MindRoot UI consumindo RPCs | pending |
| Wrap semi-automático | pending |

### C3 — Consumidores Reais
**Status:** not_started

| Task | Status |
|------|--------|
| Constellation via Schema v2 | pending |
| PHI-TIME extraído (@rsm/phi-time) | pending |
| DAG cycle detection | pending |
| Landing page pública Atom OS | pending |

### C4 — Protocolo Aberto
**Status:** not_started

| Task | Status |
|------|--------|
| Documentação pública | pending |
| GitHub public | pending |
| Muda como primeiro consumidor externo | pending |
| SDK/CLI | pending |
| Beta público | pending |

### Horizonte — Atom OS

O espelho digital. Emoção precede ação. Reflexão fecha o ciclo. Presença sobre produtividade.

### Regras

1. Dual-track: Este roadmap vive no trilho CONSTRUIR (aurora).
2. OAuth é bloqueio #1.
3. O schema é o contrato, não o código.
4. Um alpha por sessão Claude Code.
5. audit.sh 20/20 antes de commit.
6. Design system sagrado.
7. UI português, código inglês.
8. Rick é o primeiro usuário.
9. Constellation é o primeiro consumidor externo.

## Connections
- belongs_to:: [[project-atom-engine]]
- belongs_to:: [[RM-MASTER]]
- feeds:: [[RM-CONSTELLATION]]
- feeds:: [[RM-MUDA]]
