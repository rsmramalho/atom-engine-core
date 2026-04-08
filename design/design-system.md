╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   bridge                     ║
║ state:    structured                 ║
║ status:   active                     ║
║ stage:    3 △ Triângulo              ║
║ tags:     [#system, #design,         ║
║            #design-system, #ux]      ║
║ source:   claude-project             ║
║ created:  2026-04-08                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4       ║
║   → references: ATOM.md v1.2        ║
║   → references: Design Tree v1.0    ║
║   → feeds: MindRoot implementation   ║
╚══════════════════════════════════════╝

# Atom OS — Design System v1.0

**Versão:** 1.0
**Data:** 08 Abr 2026
**Status:** Definitive
**Referência:** Genesis v5.0.4 + ATOM.md v1.2 + Design Tree v1.0
**Princípio:** O visual do sistema reflete a geometria do sistema. De dentro pra fora.

---

## 1 — Filosofia visual

O Atom OS não é um app de produtividade. É um sistema operacional pessoal. O design reflete isso:

- **Presença sobre produtividade.** O visual é calmo, quente, silencioso. Um espaço pra pensar.
- **Emoção precede ação.** O SoulCard é o primeiro componente que o usuário vê.
- **A geometria é o DNA.** Os 7 estágios (· — △ □ ⬠ ⬡ ○) aparecem em toda parte — StageBar, badges, pipeline.
- **Módulos são cores.** 8 módulos = 8 cores fixas. Nunca mudam entre vertices.
- **Mobile-first no dev, carinho igual no desktop.** 360×800 viewport mínimo.
- **Sunsama-level polish.** Cards limpos, sombras sutis, espaçamento generoso, hierarquia tipográfica clara.

---

## 2 — Tokens

### 2.1 Surfaces

| Token | Hex | Uso |
|-------|-----|-----|
| `--bg` | `#18171a` | Fundo da página |
| `--card` | `#201e24` | Cards e containers |
| `--surface` | `#1c1a22` | Inputs, chips, overlays |

### 2.2 Text

| Token | Hex | Uso |
|-------|-----|-----|
| `--text-heading` | `#f0ece6` | Títulos, nomes de items |
| `--text-primary` | `#d4d0cc` | Corpo, descrições |
| `--text-secondary` | `#8a8580` | Timestamps, labels, hints |

### 2.3 Accent

| Token | Hex | Uso |
|-------|-----|-----|
| `--accent` | `#7F77DD` | Botões primários, elementos ativos, accent global |
| `--accent-muted` | `rgba(127,119,221,0.15)` | Fundo de chips accent |

### 2.4 Module colors (8 — sagradas, nunca mudam)

| Módulo | Hex | CSS var |
|--------|-----|---------|
| work | `#8a9e7a` | `--mod-work` |
| body | `#b8c4a8` | `--mod-body` |
| mind | `#a89478` | `--mod-mind` |
| family | `#d4856a` | `--mod-family` |
| purpose | `#c4a882` | `--mod-purpose` |
| bridge | `#8a8a8a` | `--mod-bridge` |
| finance | `#7a9e8a` | `--mod-finance` |
| social | `#9e7a8a` | `--mod-social` |

**Uso:** borda lateral esquerda (3px) em cards de items. Fundo de chips a 15% opacity.

### 2.5 Stage colors (7 — geometria sagrada)

| Stage | Geometria | Hex | CSS var |
|-------|-----------|-----|---------|
| 1 inbox | · Ponto | `#8a8580` | `--stage-1` |
| 2 classified | — Linha | `#9e9488` | `--stage-2` |
| 3 structured | △ Triângulo | `#7a9e8a` | `--stage-3` |
| 4 validated | □ Quadrado | `#7a8a9e` | `--stage-4` |
| 5 connected | ⬠ Pentágono | `#7F77DD` | `--stage-5` |
| 6 propagated | ⬡ Hexágono | `#9e7a8a` | `--stage-6` |
| 7 committed | ○ Círculo | `#c4a882` | `--stage-7` |

**Uso:** StageBar (segmentos proporcionais), StageBadge (ícone + cor), Pipeline (filtros).

### 2.6 Ritual colors (3 — ciclo do dia)

| Ritual | Hex | CSS var |
|--------|-----|---------|
| Aurora (05h–08h) | `#c4a882` | `--ritual-aurora` |
| Zênite (08h–17h) | `#8a8580` | `--ritual-zenite` |
| Crepúsculo (17h+) | `#7F77DD` | `--ritual-crepusculo` |

### 2.7 Borders & misc

| Token | Valor |
|-------|-------|
| `--border` | `rgba(255,255,255,0.06)` |
| `--border-strong` | `rgba(255,255,255,0.12)` |
| `--radius` | `14px` (cards) |
| `--radius-sm` | `10px` (chips) |
| `--radius-lg` | `20px` (containers) |
| `--shadow` | `0 2px 8px rgba(0,0,0,0.3)` |

### 2.8 Typography

| Propriedade | Valor |
|-------------|-------|
| Font family | DM Sans |
| Weight regular | 400 |
| Weight medium | 500 |
| Weight bold | **Nunca.** Máximo 500. Nunca 600+. |
| Heading | 22-28px, weight 500, `--text-heading` |
| Body | 15-16px, weight 400, `--text-primary` |
| Secondary | 13-14px, weight 400, `--text-secondary` |
| Label | 11px, uppercase, letter-spacing 0.15em, `--text-secondary` |

---

## 3 — BottomNav (oficial)

5 slots fixos. Universal pra qualquer vertex do Pentágono.

| Slot | Label | Ícone | Camada |
|------|-------|-------|--------|
| 1 | Home | 🏠 (Home) | 9 Yesod |
| 2 | Search | 🔍 (Search) | 8 Hod |
| 3 | · | Ponto em círculo accent | 3 Binah (captura) |
| 4 | Pipeline | ▥ (BarChart3) | 8 Hod |
| 5 | Raiz | 🌱 (Sprout/Leaf) | Engine universal |

**Comportamento:**
- Ativo: ícone + label em `--accent`, demais em `--text-secondary`
- Slot 3 (captura): círculo accent (`--accent`) com · branco no centro, ligeiramente elevado
- Dark background: `--card` com `--border` no topo (1px)
- Height: 56px + safe area bottom

**Customização por vertex (futuro):** cada vertex pode trocar os labels/ícones dos slots 2 e 5. Slots 1, 3, 4 são fixos.

---

## 4 — Componentes

### 4.1 Atoms

**ModuleChip**
Pill mostrando nome do módulo. Fundo na cor do módulo a 15% opacity. Texto na cor do módulo.
- Height: 24px. Padding: 4px 10px. Radius: `--radius-sm`.
- Font: 12px, weight 500.
- Exemplo: `<span style="background: rgba(138,158,122,0.15); color: #8a9e7a">Work</span>`

**StageBadge**
Símbolo de geometria com cor do estágio.
- Size: 20×20px. Font: 14px.
- Símbolos: · — △ □ ⬠ ⬡ ○
- Cor do texto = cor do estágio correspondente.

**StatusDot**
Círculo 8px indicando status.
- Active: `#7a9e8a` (verde). Paused: `#c4a882` (amber). Archived: `#8a8580` (cinza).

**IconButton**
Botão circular com ícone.
- Size: 40×40px. Background: `--surface`. Radius: 50%.
- Ícone: 20px, `--text-secondary`. Hover: opacity 0.8.
- Variantes: Search, Filter, Plus, MoreHorizontal (lucide-react).

### 4.2 Molecules

**TaskCard**
Card de item com borda lateral de módulo.
- Background: `--card`. Radius: `--radius`. Shadow: `--shadow`.
- Borda esquerda: 3px solid `--mod-[module]`. Padding: 16-20px.
- Título: 15px, weight 500, `--text-heading`.
- Horário: 13px, `--text-secondary`.
- ModuleChip alinhado à direita do horário.

**InboxItem**
Row de item no pipeline/inbox.
- Full-width. Padding: 12px 16px. Border-bottom: 1px `--border`.
- Checkbox circular (20px) à esquerda. Título: 15px, `--text-primary`.
- Source badge: pill cinza (12px, `--surface`). Star: 16px amarelo quando ativo.
- Timestamp: 13px, `--text-secondary`, alinhado à direita.

**SubtaskItem**
Checkbox + label com dois estados.
- Unchecked: circle outline `--border-strong` + texto normal.
- Checked: circle preenchido `--accent` + ✓ branco + texto strikethrough `--text-secondary`.

**MetricCard**
Número grande + label + trend badge.
- Background: `--card`. Radius: `--radius`. Padding: 16px.
- Número: 28-32px, weight 500, `--text-heading`.
- Label: 12px, `--text-secondary`.
- Trend: 12px pill. Positivo: verde. Negativo: vermelho.

**CalendarEvent**
Bloco colorido na view de dia.
- Background: cor do módulo a 20% opacity. Radius: `--radius-sm`.
- Título: 14px, weight 500, `--text-primary`. Duração: 13px, `--text-secondary`.

**SettingsRow**
Row de configuração.
- Icon (20px, `--text-secondary`) + Label (16px, `--text-primary`) + Value/Chevron à direita.
- Padding: 16px. Border-bottom: 1px `--border`.

**ConnectorCard**
Card de conector/boca.
- Background: `--card`. Radius: `--radius`. Padding: 20px.
- Ícone (24px) + Nome (16px medium) + Status pill (Connected verde / Not connected cinza).
- Descrição: 14px, `--text-secondary`.
- Stats: 13px, `--text-secondary`. Toggle switch à direita.

**EmailItem**
Email classificado pelo triage.
- Similar a InboxItem, com adição de: sender avatar (circle 32px com inicial), sender name (14px bold), subject (15px).
- AI classification pill: borda dashed `--accent`, texto "→ task · work" em 12px.

### 4.3 Organisms

**SoulCard** — O COMPONENTE ASSINATURA
Card de check-in emocional. Primeira coisa que o usuário vê na aurora.
- Background: `--card`. Radius: `--radius`. Shadow: `--shadow`.
- Borda superior: 3px solid `--ritual-aurora` (#c4a882).
- Glow: `radial-gradient(ellipse at top, rgba(196,168,130,0.06) 0%, transparent 70%)` atrás do card.
- Pergunta: "como você tá chegando hoje?" — 15px, italic, `--text-primary`.
- Input: placeholder "escreva como se sente...", `--surface` background.
- Energy chips: 3 pills (alta / média / baixa), rounded-full, tappable, `--surface` default, `--accent-muted` quando selecionado.
- Regras: nunca forçar. Se o humano ignora, tá ok.

**StageBar**
Barra horizontal mostrando distribuição de items por estágio.
- Height: 8px. Radius: rounded-full. Sem gaps entre segmentos.
- 7 segmentos coloridos (stage colors), largura proporcional ao count.
- Abaixo: 7 símbolos (· — △ □ ⬠ ⬡ ○) em 12px com cores correspondentes + counts.
- Tap: expande detalhes (nome do estágio + count).

**AtomInput**
Input de captura rápida. O gesto estágio 1.
- Full-width. Background: `--surface`. Radius: `--radius`. Height: 44px.
- Esquerda: · em `--stage-1` (o ponto). Placeholder: "captura rápida...".
- Direita: botão send (circle accent com seta).

**AuditSummary**
Row compacto de saúde do sistema.
- Texto: "inbox: N · floor: N · stale: N · orphans: N"
- Números > 0: `--ritual-aurora` (amber). Números = 0: `--stage-3` (verde).
- Font: 13px, `--text-secondary`.

**FocusTimer**
Timer circular de deep work.
- Circle: 200px, ring de progresso em `--accent`, fundo `--surface`.
- Tempo: 32px, weight 500, `--text-heading`, centrado. "remaining" abaixo em 13px.
- Controles: 3 botões circulares (prev, play/pause, next).
- Stats: 3 métricas (Today, Sessions, Focus %).

**WrapStepper**
Stepper de 7 passos pro ritual de commit.
- Header: "Atom Wrap" + data + 7-dot stepper (dot ativo em `--accent`).
- Step label: nome do passo em `--accent`.
- Content: varia por passo (cards de decisão, connections, soul, audit).
- Footer: "Back" ghost + "Next" primary button + progress bar (7 segmentos em stage colors).

---

## 5 — As 14 telas do Atom OS

### 5.1 Mapa completo

| # | Tela | Camada | Nav access | v0 ref |
|---|------|--------|-----------|--------|
| 1 | Home | 9 Home | BottomNav slot 1 | Screen Templates |
| 2 | Item Detail | universal | Tap em qualquer item | Screen Templates |
| 3 | Calendar | 7 Bocas | Home (schedule) ou Search | Screen Templates |
| 4 | Focus | feature | Home ou item action | Screen Templates |
| 5 | Pipeline | 8 Olhos | BottomNav slot 4 | Screen Templates |
| 6 | Analytics | branch | Home ou Raiz | Screen Templates |
| 7 | Settings | 2 Porta | Header icon (Home/Raiz) | Screen Templates |
| 8 | Wrap | ritual | Crepúsculo auto ou manual | Wireframes Completo |
| 9 | Email | 7 Bocas | Connectors ou Pipeline | Wireframes Completo |
| 10 | Projects | 8 Olhos | Pipeline (filtro) ou Search | Wireframes Completo |
| 11 | Connectors | 7 Bocas | Settings ou Raiz | Wireframes Completo |
| 12 | Search | 8 Olhos | BottomNav slot 2 | Wireframes Completo |
| 13 | Login | 2 Porta | Primeira vez / logout | Wireframes Completo |
| 14 | Raiz | Engine | BottomNav slot 5 | Wireframes Completo |

### 5.2 Referências visuais (v0.dev)

| Projeto v0 | URL | Conteúdo |
|-----------|-----|----------|
| Screen Templates | `v0.app/chat/atom-os-screens-vlEp2nGL1lL` | 7 telas base — verdade visual |
| Component Library | `v0.app/chat/component-library-showcase-tUbyqmmEuhi` | Tokens + componentes + 3 views compostas |
| Wireframes Completo | `v0.app/chat/atom-personal-os-jbHkPxrMC8u` | 7 telas (Wrap, Email, Projects, Connectors, Search, Login, Raiz) |

### 5.3 Ajustes pendentes nos v0

| # | Gap | Projetos afetados | Status |
|---|-----|-------------------|--------|
| 1 | ~~BottomNav oficial~~ | ~~Todos 3~~ | ✅ aplicado |
| 2 | ~~Screen Templates cores genéricas~~ | ~~Screen Templates~~ | ✅ corrigido (follow-up) |
| 3 | ~~Home sem SoulCard~~ | ~~Screen Templates~~ | ✅ adicionado |
| 4 | ~~StageBar nas telas base~~ | ~~Screen Templates~~ | ✅ adicionado |
| 5 | ~~Renomear Inbox/Insights~~ | ~~Screen Templates~~ | ✅ Pipeline/Analytics |
| 6 | Focus Mode é vertex (MindRoot), não Engine | Screen Templates | Pendente — avaliar |
| 7 | Tokens divergem entre os 3 projetos | Todos 3 | Pendente — baixa prioridade |

---

## 6 — Regras de implementação

### 6.1 CSS no MindRoot

Tokens vivem em `src/index.css` como CSS custom properties no `:root`. Dark mode é o default (não existe light mode por agora).

```css
:root {
  --bg: #18171a;
  --card: #201e24;
  --surface: #1c1a22;
  --text-heading: #f0ece6;
  --text-primary: #d4d0cc;
  --text-secondary: #8a8580;
  --accent: #7F77DD;
  --accent-muted: rgba(127,119,221,0.15);
  --border: rgba(255,255,255,0.06);
  --border-strong: rgba(255,255,255,0.12);
  --shadow: 0 2px 8px rgba(0,0,0,0.3);
  --radius: 14px;
  --radius-sm: 10px;
  --radius-lg: 20px;
  --mod-work: #8a9e7a;
  --mod-body: #b8c4a8;
  --mod-mind: #a89478;
  --mod-family: #d4856a;
  --mod-purpose: #c4a882;
  --mod-bridge: #8a8a8a;
  --mod-finance: #7a9e8a;
  --mod-social: #9e7a8a;
  --stage-1: #8a8580;
  --stage-2: #9e9488;
  --stage-3: #7a9e8a;
  --stage-4: #7a8a9e;
  --stage-5: #7F77DD;
  --stage-6: #9e7a8a;
  --stage-7: #c4a882;
  --ritual-aurora: #c4a882;
  --ritual-zenite: #8a8580;
  --ritual-crepusculo: #7F77DD;
}
```

### 6.2 Arquivo de componentes

Cada componente listado na seção 4 corresponde a um arquivo React em `src/components/`:
- Atoms: `src/components/atoms/ModuleChip.tsx`, `StageBadge.tsx`, `StatusDot.tsx`, `IconButton.tsx`
- Molecules: `src/components/shared/TaskCard.tsx`, `InboxItem.tsx`, `SubtaskItem.tsx`, `MetricCard.tsx`, etc.
- Organisms: `src/components/home/SoulCard.tsx`, `src/components/shared/StageBar.tsx`, `src/components/shared/AtomInput.tsx`, `src/components/shell/BottomNav.tsx`, etc.

### 6.3 Regras visuais invioláveis

1. **Nunca bold 600+.** Máximo weight 500. Nunca.
2. **Nunca borda dura.** Sombras sutis, nunca `border: 1px solid`.
3. **Módulo = cor da borda esquerda.** Todo card de item tem 3px left border na cor do módulo.
4. **Estágio = geometria.** Todo item mostra · — △ □ ⬠ ⬡ ○ com a cor do estágio.
5. **SoulCard sempre primeiro.** Na Home aurora, o SoulCard é o primeiro componente visível.
6. **Mobile-first.** 360px mínimo. Componentes escalam de 360 → desktop sem quebrar.
7. **Dark mode only.** Sem light mode por agora.
8. **DM Sans only.** Sem segunda fonte. 400 + 500 pesos, nada mais.

---

## 7 — Tela Raiz (Engine-level)

A Raiz é o inventário da vida. Slot 5 do BottomNav. É Engine, não vertex — os 9 domínios são universais.

### 7.1 Os 9 domínios

| # | Domínio | Tag | Ícone | O que contém |
|---|---------|-----|-------|-------------|
| 1 | Identity | `#domain:identity` | 👤 | Nome, documentos pessoais, contas digitais, perfis |
| 2 | Health | `#domain:health` | ❤️ | Plano de saúde, exames, receitas médicas, vacinas |
| 3 | Finance | `#domain:finance` | 💰 | Contas bancárias, investimentos, seguros, impostos |
| 4 | Storage | `#domain:storage` | 📦 | Onde as coisas vivem — físico e digital |
| 5 | Memories | `#domain:memories` | 🧠 | Fotos, diários, marcos, reflexões |
| 6 | Time | `#domain:time` | ⏰ | Calendário, rituais, recurrence, deadlines |
| 7 | Communication | `#domain:communication` | 💬 | Emails, contatos-chave, canais ativos |
| 8 | Projects | `#domain:projects` | 🎯 | Projetos ativos com status e connections |
| 9 | Documents | `#domain:documents` | 📄 | Vital docs (passaporte, contrato, certidão) |

### 7.2 Layout da tela

- Header: "Raiz" + subtitle "o chão da sua vida"
- 9 domain cards em grid (3×3 mobile, pode adaptar desktop)
- Cada card:
  - Background: `--card`. Radius: `--radius`. Shadow: `--shadow`.
  - Ícone (24px) + Nome do domínio (15px medium, `--text-heading`)
  - Count de items: "12 items" em 13px `--text-secondary`
  - Health indicator: dot verde (ok), amber (precisa atenção), vermelho (urgente)
  - Tap: abre lista de items filtrada por `#domain:[nome]`
- Abaixo do grid:
  - Seção "Vital docs" — lista dos documentos marcados com `#vital-doc`
  - Seção "Contas" — lista de contas digitais com status (`#account:active`, `#account:redirect`, etc.)
- BottomNav no fundo (slot 5 Raiz ativo em accent)

### 7.3 Customização por vertex

MindRoot: mostra todos os 9 domínios como reflexão pessoal.
Constellation: troca por "Diagnóstico" — 9 áreas da empresa (finanças, RH, operações...).
A estrutura é a mesma. Os dados e labels mudam.

---

## 8 — Wrap: os 7 passos

O Wrap é o ritual de commit. Stepper de 7 passos. Body JSONB definido no Genesis §3.4. Aqui está o que cada passo mostra na UI.

| Passo | Nome | Conteúdo na tela | Dados do body |
|-------|------|-----------------|---------------|
| 1 | Created | Lista de items criados na sessão. Cada item: stage badge + type chip + título + destino. Botão "+ Add" pra items esquecidos. | `body.created[]` |
| 2 | Modified | Lista de items modificados. Cada item: campo + valor anterior → novo valor. Highlight no que mudou. | `body.modified[]` |
| 3 | Decisions | Cards de decisão em linguagem natural. Input pra adicionar decisão. Cards editáveis. | `body.decided[]` |
| 4 | Connections | Connections feitas na sessão: item A → relação → item B. Visualização mini-grafo opcional. | `body.connections[]` |
| 5 | Seeds | Items em entropia (>30 dias inativos). Cada seed: título + "manter?" toggle. Aprovadas viram novos pontos. Rejeitadas → `#seed:rejected`. | `body.seeds[]` |
| 6 | Soul | Check-out emocional. "Como você tá saindo hoje?" + input emoção + energy chips (alta/média/baixa). Mostra shift: aurora emotion → crepúsculo emotion. | `body.soul{}` |
| 7 | Audit + Next | AuditSummary automático (inbox, floor, stale, orphans). Abaixo: "Próximos passos" — lista editável de next actions. Botão "Commit wrap" em accent. | `body.audit{}` + `body.next[]` |

### 8.1 Comportamento do stepper

- Header: "Atom Wrap" + data + 7-dot stepper
- Dot ativo: `--accent` preenchido. Completos: `--accent` outline. Futuros: `--border-strong`.
- Step label: número + nome em `--accent`
- Footer: "Back" ghost button + "Next: [nome do próximo]" primary button
- Progress bar: 7 segmentos usando stage colors (stage 1 → stage 7)
- Último passo: "Next" muda pra "Commit Wrap" em `--accent`
- Seções vazias são puladas automaticamente (se não criou nada, step 1 não aparece)

### 8.2 Born committed

O Wrap nasce no estágio 7 (committed). Não passa pelo pipeline. É AtomItem type=wrap, state=committed, genesis_stage=7. O body JSONB é a fonte canônica.

---

## 9 — Estados de componentes

Todo componente tem 4 estados possíveis. Nenhum pode ficar sem tratamento visual.

### 9.1 Loading

| Componente | Estado loading |
|-----------|---------------|
| TaskCard | Skeleton: retângulo `--surface` pulsando (opacity 0.3→0.6→0.3, 1.5s loop). Formato do card com placeholder lines. |
| InboxItem | Skeleton: circle + 2 lines pulsando. |
| MetricCard | Skeleton: large rect (número) + small rect (label) pulsando. |
| StageBar | Barra cinza uniforme `--surface` pulsando. Sem segmentos. |
| SoulCard | Card com borda amber mas conteúdo skeleton. Glow ativo (o calor permanece). |
| Lista (qualquer) | 3 skeleton items empilhados com stagger delay (0, 100ms, 200ms). |

**Regra geral:** skeleton usa `--surface` como cor base, pulsa entre 0.3 e 0.6 opacity, animação 1.5s ease-in-out infinite. Nunca spinner circular. Skeleton mantém o layout exato do componente carregado.

### 9.2 Empty

| Contexto | Visual |
|---------|--------|
| Pipeline vazio | Ícone · (ponto, 48px, `--text-secondary`) centrado. "Nada no pipeline" em 15px `--text-secondary`. "Capture algo com o ·" em 13px `--text-secondary`. Botão ghost "Capturar agora" que abre AtomInput. |
| Home sem tasks | SoulCard normal (sempre presente). Abaixo: "Dia limpo" em 16px `--text-heading`. "Sem tasks pra hoje. Aproveite." em 14px `--text-secondary`. Sem botão — dia limpo é bom. |
| Search sem resultados | Ícone search (48px, `--text-secondary`). "Nenhum resultado pra '[query]'" em 15px. Sugestão: "Tente termos mais amplos" em 13px. |
| Projects vazio | "Nenhum projeto ativo" + "Crie um projeto capturando e classificando como type:project" em 13px. |
| Email sem novos | "Inbox zerado ✓" em 16px `--text-heading` com check verde. "Nenhum email novo." em 14px. Tom positivo — inbox zero é conquista. |
| Connectors nenhum ativo | 4 cards de connectors todos "Not connected". Nenhuma mensagem extra — os cards já comunicam. |
| Raiz domínio vazio | Card do domínio com count "0 items". Dot cinza (neutro, não urgente). Tap abre lista vazia com "Adicione items com #domain:[nome]". |
| Wrap sem created | Step 1 (Created) é pulado automaticamente. Stepper vai direto pro próximo step com conteúdo. |

**Princípio:** empty states são oportunidades de guiar, não de reclamar. Tom positivo ou neutro. Nunca "você não fez nada". Sempre "aqui está como começar" ou "tudo limpo".

### 9.3 Error

| Contexto | Visual |
|---------|--------|
| Supabase offline | Toast no topo: "Sem conexão com o servidor" em 14px, fundo `--card`, borda esquerda 3px vermelha. Retry automático 1x. Se falha: toast persistente com botão "Tentar de novo". |
| Triage falha | Toast: "Classificação automática indisponível" + item fica no inbox. Non-blocking. |
| Captura falha | NUNCA perder texto. Salvar localmente (Zustand). Toast: "Salvo offline. Sincroniza quando voltar." Tom calmo. |
| Wrap falha | NUNCA perder o wrap. Salvar draft no Zustand. Toast: "Wrap salvo como rascunho. Tente commitar novamente." Botão retry. |
| Connector falha | ConnectorCard mostra status pill "Error" em vermelho. Descrição: "Última sync falhou. Verifique as credenciais." Botão "Reconectar". |
| Load de lista falha | Substituir skeleton por mensagem: "Não foi possível carregar" + botão "Tentar de novo". Manter layout (não colapsar). |

**Regra geral de toasts:**
- Max-width: 320px. Padding: 12px 16px. Radius: `--radius-sm`.
- Background: `--card`. Borda esquerda: 3px (vermelha pra erro, amber pra warning, verde pra success).
- Texto: 14px `--text-primary`. Nunca trunca — word-break se necessário.
- Posição: top-center, abaixo do status bar. Não sobrepõe conteúdo.
- Auto-dismiss: 5s pra sucesso, 8s pra warning, persistente pra erro (com X pra fechar).

### 9.4 Offline

Quando o dispositivo perde conexão:
- Banner sutil no topo: "Modo offline" em 13px `--text-secondary`, fundo `--surface`.
- Capturas continuam funcionando (salvam localmente).
- Listas mostram dados do cache (TanStack Query).
- Ações de escrita (criar, editar, commitar) ficam em fila.
- Quando volta online: sync automático + toast "Sincronizado ✓".

---

## 10 — Animações (spec futura)

Definido na Fase 3 do roadmap UX. Specs preliminares:

| Animação | Trigger | Tipo | Duração |
|----------|---------|------|---------|
| Page enter | Navegação entre telas | Slide left/right | 300ms ease |
| Card stagger | Lista de items carrega | Stagger children (fade up) | 50ms delay each |
| SoulCard glow | Aurora (05h-08h) | Pulse opacity (radial glow) | 3s loop |
| StageBar expand | Tap na barra | Expand height + show labels | 200ms ease |
| Chip toggle | Tap em chip | Scale + color transition | 150ms |
| Card press | Touch/hold em card | Scale 0.98 + shadow increase | 100ms |
| Wrap step | Next no stepper | Slide left + fade | 250ms ease |
| Capture send | Tap send no AtomInput | Slide up + fade | 200ms |

Stack: Framer Motion (já no MindRoot). CSS transitions pra estados simples.

---

## 11 — Roadmap UX

4 fases, de dentro pra fora. Cada fase tem um ou mais projetos v0 associados.

### Fase 1 — Design system (tokens + componentes) ✅

| Entrega | Status |
|---------|--------|
| Tokens canônicos (18 cores semânticas) | ✅ definidos |
| 4 atoms (ModuleChip, StageBadge, StatusDot, IconButton) | ✅ spec + v0 |
| 8 molecules (TaskCard, InboxItem, SubtaskItem, MetricCard, CalendarEvent, SettingsRow, ConnectorCard, EmailItem) | ✅ spec + v0 |
| 6 organisms (SoulCard, StageBar, AtomInput, BottomNav, AuditSummary, FocusTimer, WrapStepper) | ✅ spec + v0 |
| 3 views compostas (Home Aurora, Pipeline, Item Detail) | ✅ v0 |
| v0: Component Library Showcase | ✅ v2 polida |

### Fase 2 — Wireframes de todas as telas ✅

| Entrega | Status |
|---------|--------|
| 7 telas base (Home, Item Detail, Calendar, Focus, Pipeline, Analytics, Settings) | ✅ Screen Templates v0 |
| 6 telas novas (Wrap, Email, Projects, Connectors, Search, Login) + Raiz | ✅ Wireframes v0 |
| BottomNav oficial em todas as telas | ✅ aplicado |
| SoulCard + StageBar + AtomInput na Home | ✅ aplicado |
| Renomear Inbox→Pipeline, Insights→Analytics | ✅ aplicado |
| Module colors nas bordas de cards | ✅ aplicado |
| v0: Screen Templates (7 telas) | ✅ atualizado |
| v0: Wireframes Completo (6 telas) | ✅ atualizado |

### Fase 3 — Fluxos, transições e animações ⚪

| Entrega | Status |
|---------|--------|
| Navigation map (tap → tela destino) | ⚪ pendente |
| Micro-interactions (card press, chip toggle, star tap) | ⚪ spec preliminar (§10) |
| Page transitions (slide, fade, stagger) | ⚪ spec preliminar (§10) |
| SoulCard aurora glow animation | ⚪ spec preliminar (§10) |
| Wrap stepper transitions | ⚪ spec preliminar (§10) |
| v0: Flows & Animations (novo projeto) | ⚪ não criado |

### Fase 4 — Protótipo interativo + spec final ⚪

| Entrega | Status |
|---------|--------|
| Telas navegáveis entre si no v0 | ⚪ pendente |
| Protótipo clicável pra teste com usuários | ⚪ pendente |
| Design system doc commitado no repo | ⚪ job gerado, aguardando execução |
| Claude Code implementa no MindRoot | ⚪ depende do commit |

### Pendências abertas

| # | Item | Prioridade | Notas |
|---|------|-----------|-------|
| 1 | Focus Mode é vertex ou Engine? | Média | Pomodoro parece vertex (MindRoot), não universal |
| 2 | Tokens divergem entre os 3 projetos v0 | Média | Cada v0 interpretou ligeiramente diferente |
| 3 | Screen Templates usa cores genéricas em alguns cards | Média | Follow-up parcialmente corrigiu, verificar |
| 4 | ~~Raiz screen — wireframe não existe no v0~~ | ~~Alta~~ | ✅ Adicionado ao Wireframes Completo v0 |
| 5 | Home Crepúsculo — variante noturna da Home | Baixa | Aurora existe, crepúsculo não |
| 6 | Companion/AI chat interface | Futuro | Definido como feature futura no roadmap do MindRoot |
| 7 | Figma tokens sync com v0 tokens | Baixa | 28 vars no Figma, validar alinhamento |

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 08 Abr 2026 | Documento inaugural completo. Tokens (18 cores), 20 componentes, BottomNav oficial, 13 telas, Raiz (9 domínios), Wrap (7 passos detalhados), estados de componentes (loading/empty/error/offline), regras de implementação, specs de animação, roadmap UX (4 fases + 7 pendências). Consolidação de 3 projetos v0 (Screen Templates, Component Library, Wireframes Completo). |

---

*O visual do sistema reflete a geometria do sistema.*
*Cada cor tem razão. Cada sombra tem propósito. Cada componente tem posição.*
*De dentro pra fora — sempre.*
