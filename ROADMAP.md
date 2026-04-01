# Atom OS — Roadmap Oficial

**Versão:** 2.0
**Data:** 01 Abr 2026
**Status:** active
**Princípio:** Motor → Inteligência → Visualização → Reflexão

---

## Visão geral

O Atom OS é o produto completo: **Atom Engine** (cérebro) + **MindRoot** (corpo).
O Engine define as regras (Genesis v5). O MindRoot implementa a experiência.

Este é o roadmap único e oficial. Vive no GitHub (`atom-engine-core/`).
Se não está aqui, não está planejado.

---

## Pentágono — Ecossistema

| # | Projeto | Status | Descrição |
|---|---------|--------|-----------|
| V1 | **Atom OS** (Engine + MindRoot) | active | Sistema operacional pessoal. Foco atual. |
| V2 | **Constellation OS** | paused | Infraestrutura operacional. Landing page entregue. Aguarda Atom OS. |
| V3 | **Atlas Frames** | active | Negócio físico. Estruturas de aço. Monday.com. Operação independente. |
| V4 | **Muda** | concept | Comunidade. Nasce do Atom OS quando maduro. |
| V5 | **Yugar Commons** | concept | Mt Samson. Visão de longo prazo. |

**Regra:** MindRoot primeiro. O resto nasce dele.

---

## Infraestrutura — Estado atual

### Supabase (deployed ✓)

- 3 tabelas: `items`, `item_connections`, `atom_events`
- Triggers: `sync_genesis_stage`, `check_orphan_downgrade`
- RPCs: `morph_item`, `decay_item`, `propagate_effect`, `commit_item`
- RLS: ativo (row-level security por user_id)
- Audit views: `v_orphan_items`, `v_below_floor`, `v_inbox_stale`

### Specs e design (completo ✓)

- Genesis v5.0.1 + Schema v2 (definitive)
- Marco Zero v2.0 (operacional)
- Meta-Template v1.1 (molde dos moldes)
- type-schemas.json com 23 types + helper tipado
- 11 wireframes + 74 decisões UX (D0-D74)

### MindRoot repo — branch `ui-v2`

- Stack: React 19 + Vite 6 + TypeScript + Supabase + Zustand + Tailwind
- Data layer existente do alpha.26 (services, engines, hooks)
- `type-schemas.json` + `types.ts` commitados

---

## Fases de implementação

### ✅ Fase 0 — Foundation (UI)
**Status:** implementada (commit `a293329`)
**Escopo:** Design tokens + component library base

Entregáveis:
- `tokens.ts` — cores (8 módulos + 7 estágios), tipografia (DM Sans), espaçamento
- `GeometryIcon` — 7 geometrias SVG (· — △ □ ⬠ ⬡ ○)
- `TypeChip` — pill com cor do módulo
- `ModuleBar` — indicador lateral de módulo
- `StageBadge` — badge com geometria + label
- `ConfidenceBar` — barra de confiança do triage (3 faixas)
- `FAB` — floating action button de captura rápida

### ✅ Fase 1 — Home (UI)
**Status:** implementada (commit `d827214`)
**Escopo:** Tela principal com estado do dia

Entregáveis:
- `SoulCard` — aurora/crepúsculo emocional
- `WrapBanner` — resumo do último wrap
- Home reestruturada com cards de estado

### ✅ Fase 2 — Pipeline / Triage (UI)
**Status:** implementada (commit `6543535`)
**Escopo:** Visualização do pipeline e fluxo de triagem

Entregáveis:
- Funnel visual dos 7 estágios
- Triage flow (3 faixas de confiança)
- FAB integrado com captura → inbox

### ✅ Fase 3 — Wrap + FSM (UI)
**Status:** implementada (commit `8cf2204`)
**Escopo:** Ritual de wrap e state machine visual

Entregáveis:
- `fsm.ts` — lógica de transição de estágios
- `wrap.ts` — estrutura JSONB do wrap
- `WrapStepper` — wizard de 7 passos (created → soul → audit → next)

---

### 🔵 Fase 4 — Service Layer + FSM Runtime
**Status:** próximo
**Escopo:** O sistema nervoso — conectar a UI ao Supabase
**Princípio:** Sem esta fase, a UI é casca e o banco é motor parado.

Entregáveis:
- **Supabase client service** — CRUD tipado pra `items`, `item_connections`, `atom_events`
- **FSM runtime** — invocar RPCs reais (morph, decay, propagate, commit) a partir da UI
- **Pipeline service** — avançar/regredir items pelos 7 estágios com validação de gates
- **Connection service** — criar/deletar edges tipadas com downgrade automático
- **Wrap service** — gerar body JSONB estruturado, INSERT como AtomItem type=wrap
- **Audit service** — queries reais contra views (orphans, below_floor, stale)
- **Real-time subscriptions** — Supabase Realtime pra atualizar a UI quando dados mudam

Dependências:
- Fases 0-3 (UI components prontos pra consumir dados reais)
- Supabase deployed (tabelas, triggers, RPCs, views)

Critério de done:
- Um item pode ser criado, classificado, estruturado, validado, conectado, e commitado via wrap — tudo pelo MindRoot, tudo persistido no Supabase.
- Audit roda com dados reais.
- FSM impede transições inválidas.

### 🔵 Fase 5 — Auto-Triage Engine
**Status:** aguardando Fase 4
**Escopo:** Classificação inteligente — o primeiro sopro de vida do sistema
**Princípio:** Transforma o sistema de "lista bonita" em "organismo vivo".

Entregáveis:
- **Triage engine** — envia texto bruto → LLM infere type + module + confiança
- **3 faixas de confiança** — auto-classify (≥90/95%), sugerir (60-89/94%), manual (<60%)
- **Threshold diferenciado** — 95% pra acionáveis (task, project, spec, habit), 90% pra passivos
- **UI de confirmação** — toque único pra aprovar/rejeitar sugestão
- **Batch triage** — processar múltiplos items do inbox de uma vez
- **Learning loop** — registrar correções do usuário pra melhorar confiança futura

Dependências:
- Fase 4 (service layer funcional pra persistir classificações)
- API key de LLM configurada

Critério de done:
- Item capturado no inbox é classificado automaticamente ou apresentado com sugestão.
- Usuário confirma em 1 toque. Item avança pro estágio 3 (structured).

### 🟡 Fase 6 — Projects + Calendar + Raiz Onboarding
**Status:** aguardando Fase 5
**Escopo:** Visualização de projetos, integração de calendário, onboarding da vida

Entregáveis:
- **Projects list** — cards de projeto com progresso, milestones, connections
- **Project detail** — items conectados, timeline, status
- **Calendar view** — Google Calendar integration (events ↔ items com deadline/due_date)
- **Raiz onboarding** — 3 portas de entrada → inventário por domínio → primeiros items
- **Raiz dashboard** — matriz visual 9 domínios × 7 estágios

Wireframes: já prontos (telas 3, 5, 10, 11 das 11)

Dependências:
- Fase 4 (service layer)
- Google Calendar API (MCP ou direct)

### 🟡 Fase 7 — Analytics + Library + Reflexões + Settings
**Status:** aguardando Fase 6
**Escopo:** A camada mais externa — olhar pra trás e ver padrões

Entregáveis:
- **Pipeline health** — distribuição de items por estágio, velocidade de maturação
- **Soul patterns** — tendências emocionais ao longo do tempo (aurora → crepúsculo)
- **Connection graph** — visualização nativa do grafo (substitui Obsidian)
- **Library** — items consumíveis (recipes, workouts, articles, podcasts)
- **Reflexões** — timeline de reflections e checkpoints
- **Settings** — configuração do app (theme, modules, notifications, export)

Wireframes: já prontos (telas 6, 7, 8, 9 das 11)

Dependências:
- Dados reais fluindo (Fases 4-5 funcionais)
- Histórico de wraps e items pra gerar analytics

### ⚪ Fase 8 — Export + Desacoplamento
**Status:** futuro
**Escopo:** Drive e Obsidian como outputs opcionais

Entregáveis:
- **Export to Drive** — botão que gera Google Doc com ATOM ENVELOPE
- **Export to Obsidian** — gera vault completo ou parcial com YAML frontmatter
- **Naming convention** aplicada automaticamente nos exports
- Drive totalmente opcional
- Obsidian totalmente opcional

---

## Regras do roadmap

1. **Uma fase por vez.** Não começar a próxima sem terminar a atual.
2. **Spec antes de código.** Cada fase ganha spec completo aqui antes de ir pro Claude Code.
3. **Build from the inside out.** Motor → Inteligência → Visualização → Reflexão.
4. **Critério de done explícito.** Se não dá pra demonstrar, não tá pronto.
5. **Este documento é a referência.** Se não está aqui, não está planejado.

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 31 Mar 2026 | MINDROOT-ROADMAP.md — fases 0-5 originais |
| 2.0 | 01 Abr 2026 | Roadmap unificado Atom OS. Reordenado: motor → inteligência → visualização → reflexão. Service layer e FSM runtime como Fase 4 (antes de novas telas). Auto-triage como Fase 5. Fases UI renumeradas (6-7). Export como Fase 8. Pentágono mapeado. |
