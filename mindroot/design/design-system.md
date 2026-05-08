# MindRoot — Design System (V1)

**Versão:** 1.1
**Data:** 08 Mai 2026
**Status:** active
**Herda de:** law/atom-brand-identity.md (semente universal)
**Princípio:** Este documento é o fruto do V1. Tudo que não está aqui herda da semente.

---

## 1 — O que herda (não repetir)

MindRoot herda sem modificação da semente (atom-brand-identity.md):
- 8 cores de módulo (§3.2)
- 7 cores de estágio (§3.3)
- 3 cores de ritual (§3.4)
- Accent purple (§3.1)
- Padrão de 3 camadas de superfície (§4)
- Base 4px spacing (§6)
- 7 geometrias Unicode (§7)
- Padrões de componente (§8)
- Dark mode obrigatório
- Mobile-first

---

## 2 — Tipografia

**Fonte primária:** DM Sans
**Fonte monospace:** JetBrains Mono

| Nível | Tamanho | Peso | Uso |
|-------|---------|------|-----|
| display | 36px | 500 | Títulos de página |
| heading | 24px | 500 | Títulos de seção |
| subheading | 18px | 500 | Subtítulos |
| body | 15px | 400 | Texto corrido |
| small | 13px | 400 | Texto secundário |
| caption | 11px | 400 | Metadata, timestamps |
| label | 10–11px | 500 | Section labels (tracking 1.2px, uppercase) |
| mono | 13px | 400 | Código, genesis_stage, state labels |

---

## 3 — Superfícies

### 3.1 Light mode

| Token | Hex | CSS var |
|-------|-----|---------|
| bg | #FDFCF9 | --color-bg |
| card | #FFFFFF | --color-card |
| surface | #F5F3EE | --color-surface |
| border | #E8E4DC | --color-border |
| text | #3D3A36 | --color-text |
| text-muted | #706B66 | --color-text-muted |
| text-heading | #2A2724 | --color-text-heading |

### 3.2 Dark mode (padrão)

| Token | Hex | CSS var |
|-------|-----|---------|
| bg | #111318 | --color-bg |
| card | #1E2024 | --color-card |
| surface | #1A1D24 | --color-surface |
| border | #2A2D34 | --color-border |
| text | #D4D0CC | --color-text |
| text-muted | #8A8580 | --color-text-muted |
| text-heading | #F0ECE6 | --color-text-heading |

### 3.3 Accent (derivado do universal)

| Token | Light | Dark | CSS var |
|-------|-------|------|---------|
| accent | #534AB7 | #7F77DD | --color-accent |
| accent-light | #7F77DD | #AFA9EC | --color-accent-light |
| accent-lighter | — | #CECBF6 | --color-accent-lighter |
| accent-bg | #EEEDFE | rgba(83,74,183,0.15) | --color-accent-bg |
| accent-hover | — | rgba(83,74,183,0.25) | --color-accent-hover |

**Nota:** o accent universal é #7B6FE8. O MindRoot usa variações de intensidade por modo (light mais escuro, dark mais claro) pra garantir contraste nas suas superfícies.

---

## 4 — Status

| Status | Cor | Text | Background |
|--------|-----|------|------------|
| success | #1D9E75 / #5DCAA5 | #3B6D11 / #9FE1CB | #EAF3DE / rgba(29,158,117,0.12) |
| warning | #EF9F27 / #FAC775 | #854F0B / #FAC775 | #FAEEDA / rgba(239,159,39,0.12) |
| error | #D85A30 / #F0997B | #A32D2D / #F5C4B3 | #FAECE7 / rgba(216,90,48,0.12) |

---

## 5 — Componentes

### 5.1 Card

```
background: var(--color-card)
border: 0.5px solid var(--color-border)
border-radius: 14px
padding: 14px 16px
border-left: 3px solid [cor do módulo]
```

### 5.2 Module chip

```
font-size: 10px
padding: 2px 8px
border-radius: 999px
background: [cor módulo] a 15%
color: [cor módulo] a 100%
dot: 6px circle [cor módulo]
```

### 5.3 Stage badge

```
font-size: 11px
font-family: JetBrains Mono
color: [cor estágio]
format: "[geometria] [state]" ou "[geometria] [número]"
```

### 5.4 Botões

| Nível | Spec |
|-------|------|
| primary | bg-accent text-white rounded-xl px-5 py-2.5 text-sm font-medium |
| ghost | bg-transparent border border-accent/30 text-accent rounded-xl px-5 py-2.5 |
| subtle | bg-accent-bg text-accent-light rounded-xl px-5 py-2.5 |

### 5.5 Input (AtomInput)

```
background: var(--color-card)
border: 1px solid var(--color-border)
border-radius: 14px
padding: 12px 16px
font-size: 15px
focus: border-color var(--color-accent)
placeholder: var(--color-text-muted)
```

### 5.6 Section label

```
font-size: 11px
font-weight: 500
letter-spacing: 1.2px
text-transform: uppercase
color: var(--color-text-muted)
```

### 5.7 BottomNav

5 items fixos:

| Posição | Item | Ícone |
|---------|------|-------|
| 1 | Home | ⌂ |
| 2 | Search | ◇ |
| 3 (centro) | Capture | · (FAB accent) |
| 4 | Pipeline | ▥ |
| 5 | Raiz | ⊙ |

```
height: 56px + safe-area
background: var(--color-card)
border-top: 0.5px solid var(--color-border)
active: var(--color-accent)
inactive: var(--color-text-muted)
center FAB: 44px circle, bg-accent, geometria · em branco
```

### 5.8 Toast

```
position: top center
max-width: 90vw
padding: 12px 16px
border-radius: 12px
background: var(--color-card)
border-left: 3px solid [cor do nível: success/warning/error]
word-break: break-word
auto-dismiss: 4s (info), 6s (warning), persistent (error com ação)
```

---

## 6 — AI gradient

O gradiente do companion (FAB, SoulCard orb, onboarding):

```
--color-ai-purple: #AFA9EC
--color-ai-blue: #85B7EB
--color-ai-green: #5DCAA5
gradient: linear-gradient(135deg, ai-purple, ai-blue, ai-green)
```

---

## 7 — Mapa das 14 telas (status v1.1)

Status atual da exploração v0.1 (Sessão Arca 04, design book em `design/v0.1/index.html`):

| # | Tela | Status | Notas |
|---|------|--------|-------|
| 01 | Home (two-state) | ✓ executada | Aurora pendente + Aurora respondida com transição |
| 02 | Search | ✓ executada | Geometry symbols como signature em results |
| 03 | Pipeline | ◐ deltas | StageBar 7 stages ok. Falta module chip + side band cor de módulo |
| 04 | Raiz | ◐ deltas | Glifos custom aplicados. Bug "communicat" cortado pendente |
| 05 | Item Detail | ✓ executada | Module chip + meta com geometria stage |
| 06 | Calendar | ✓ executada | Mobile-first sem month grid. Side band 8px |
| 07 | Focus | ◐ deltas | Remover "92% FOCUS". Item precisa identidade Atom |
| 08 | Connectors | ✓ executada | Universal Mouths · 3/4 active |
| 09 | Email | ◐ deltas | AI pills cor de módulo + cards com side band |
| 10 | Projects | ◐ deltas | Top borders módulos certos. StageBar 7 segments |
| 11 | Pulso (ex-Analytics) | ✓ executada | Rearquitetura conceitual completa |
| 12 | Wrap | ◐ deltas | PT-BR. 7 steps Genesis Part 3.4. ritual_slot pill |
| 13 | Settings | ◐ deltas | PT-BR strings + footer "MindRoot v1.0" |
| 14 | Login | ✓ executada | Logo = glifo identity da Raiz |

**7 ✓ executadas / 7 ◐ deltas pendentes pro batch fix**

**Pre-login & utility (não exploradas no design book v0.1):** Auth, Landing, Onboarding (pre-login), Capture (FAB centro — ver §5.7 BottomNav), Library (via Search), Graph (via item). Permanecem no escopo V1 — exploração futura.

---

## 8 — Viewport

**Mínimo:** 360×800 (mobile-first)
**Breakpoints:**
- sm: 360px (default)
- md: 768px (tablet)
- lg: 1024px (desktop)

**Regra:** toda feature é desenhada primeiro pra 360px. Desktop é adaptação, não o contrário.

---

## 9 — 9 glifos custom da Raiz

Família visual única para os 9 domínios da Raiz. Stroke 1.5px, linecap round, linejoin round. ViewBox 24×24. Cor padrão `text-primary` (#d4d0cc). Substitui emojis genéricos de versões anteriores.

| Domínio | Glifo | Lógica |
|---------|-------|--------|
| identity | `<circle cx="12" cy="12" r="8"/><circle cx="12" cy="12" r="1.5" fill="currentColor"/>` | · dentro de ○ — você é o ponto contido em si mesmo |
| health | `<path d="M3 12 L8 12 L10 8 L12 16 L14 10 L16 12 L21 12"/>` | linha pulsada — batimento, vitalidade |
| finance | `<polygon points="12,3 21,10 17.5,20 6.5,20 3,10"/>` | ⬠ pentágono — fluxo distribuído |
| storage | `<rect x="4" y="4" width="16" height="16" rx="1.5"/><circle cx="12" cy="12" r="1.2" fill="currentColor"/>` | □ + · — recipiente com conteúdo |
| memories | `<circle r="9"/><circle r="6" opacity="0.7"/><circle r="3" opacity="0.45"/>` | ○○○ concêntricos — camadas temporais |
| time | `<circle cx="12" cy="12" r="8"/><line x1="4" y1="12" x2="20" y2="12"/><circle cx="12" cy="12" r="1.2" fill="currentColor"/>` | ○ bipartido — ciclo aurora/crepúsculo |
| communication | `<circle cx="6" cy="14" r="1.5" fill="currentColor"/><circle cx="18" cy="14" r="1.5" fill="currentColor"/><path d="M6 14 Q12 4 18 14"/>` | · ⌒ · — dois pontos conectados por arco |
| projects | `<polygon points="12,4 21,20 3,20"/><line x1="2" y1="22" x2="22" y2="22" stroke-width="2"/>` | △ + base reforçada — construção emergindo |
| documents | `<path d="M6 3 L15 3 L19 7 L19 21 L6 21 Z"/><path d="M15 3 L15 7 L19 7"/>` | □ com canto dobrado — folha formal |

Tamanhos canônicos: 16px (inline labels) · 24px (default) · 28px (cards de domínio) · 36px (showcase) · 48px (hero).

Reusable em qualquer ícone de domínio. Fora da Raiz, podem aparecer em Pipeline filters por domínio, Item Detail headers, Pulso section icons. **O logo do Login é o glifo `identity` reutilizado** — consistência visual emergente.

Glifos custom são V1-specific. Outro vertex (ex. Yugar Lab) pode escolher glifos próprios pros 9 domínios.

Reference visual: `design/v0.1/screens/05-raiz.png`

---

## 10 — Side band 8px (items) vs Top border 3px (containers)

Decisão de linguagem visual semântica. Diferenciação por formato:

**Side band 8px solid** — items individuais (instances)
- Faixa lateral esquerda, full-height do card
- Cor: módulo do item (`#8a9e7a` work, `#b8c4a8` body, etc)
- Border-radius left: igual ao card (12px). Right edge: straight, flush ao card body.
- Aplicado em: Calendar (events), Search (results), Wrap (decision cards), Pipeline (futuro), Email (futuro)
- Uso: identificação instantânea do módulo em scroll vertical

**Top border 3px solid** — containers (groups)
- Borda superior thin do card
- Cor: módulo do grupo
- Aplicado em: Projects (project cards)
- Uso: distinguir visualmente "este card agrupa items" de "este card é um item"

A regra é semântica: **se carrega outros, top border. Se é item folha, side band.**

Reference visual: `design/v0.1/screens/07-calendar.png` (side band) e `design/v0.1/screens/11-projects.png` (top border)

---

## 11 — Two-state Home pattern (aurora pendente / respondida)

A Home é uma só, com dois estados que dependem se o ritual aurora foi respondido no dia.

### Estado 1 — Aurora pendente (primeira abertura do dia)

Espaço de chegada. Campos vazios convidando ao check-in.
- Greeting "bom dia, alex" 32px lowercase
- Soul check-in (energia: alta/média/baixa + emotion input "uma palavra...")
- Intention input "hoje é dia de…"
- Capture hero (multi-line auto-grow)
- "ver hoje →" link sutil
- Audit adaptativo (só renderiza se houver pendências)

### Estado 2 — Aurora respondida (resto do dia)

Espaço ancorado. O que você disse de manhã passa a ser contexto persistente.
- Anchor header colapsado: "alex · alta · 'tô curioso, focado'" (uma linha)
- Intention hero: a frase da manhã vira heading 24px com aurora glow underline — read-only durante o dia (tap pra editar)
- Pulse line semana: "esta semana · aurora 4/5 · zênite 3/5 · crepúsculo 2/5" — info sem score
- Capture hero (constante o dia inteiro)
- "ver hoje →" link
- Audit adaptativo
- Aurora ambient dimmed (opacity 6% → 3%)
- Ritual pill atualiza: "· aurora" → "· zenite" → "· crepúsculo" conforme hora

### Transição

Quando user completa Estado 1 (envia capture com energia + emotion + intention preenchidos):
- Smooth 600ms com stagger
- Greeting collapse + scale down
- Soul fields fade out + collapse vertical space
- Intention reflows pra hero position
- Pulse line fade in
- Aurora ambient dim
- Ritual pill morph

Se user abre app já no Estado 2 (aurora já respondida hoje): renderiza Estado 2 direto com fade-up mount, sem transição.

### Princípio

A Home **não pede curadoria diária** (não tem foco do dia popular, não tem agora list, não tem schedule). O check-in matinal é a única responsabilidade do user. Resto do dia, a Home serve como ancoragem + captura. Manutenção zero.

Reference visual: `design/v0.1/screens/01-home-pendente.png` e `design/v0.1/screens/02-home-respondida.png`

---

## 12 — Pulse line vs Score (anti-gamification)

Padrão para feedback temporal sem judgment. Materializa o princípio "presença sobre produtividade" do Marco Zero v3.1.

### Não fazer

- ❌ "Productivity Score 87/100"
- ❌ "+18% vs last week"
- ❌ "92% Focus"
- ❌ "Inbox Zero" trophies
- ❌ Setas verde-up / vermelho-down
- ❌ Streak counters
- ❌ Comparações entre semanas

### Fazer

- ✅ Quantidades absolutas neutras: "35 items esta semana", "1h 24m hoje"
- ✅ Ratios sem percentual: "aurora 4/5", "zênite 3/5"
- ✅ Cores de ritual nos números: aurora #c4a882, zênite #8a8580, crepúsculo #7F77DD
- ✅ Distribuição por módulo (mapa, não ranking)
- ✅ Estado atual ("3 no inbox · 2 abaixo do piso") — informação, não alarme
- ✅ Linguagem informativa: "esta semana · onde sua atenção foi"

### Aplicação

- **Pulso** (tela inteira) — substitui Analytics
- **Home Estado 2** — pulse line discreta abaixo da intenção
- **Focus session** — TODAY (tempo) e SESSIONS (volume) ✓; FOCUS percentual ❌

Reference visual: `design/v0.1/screens/12-pulso.png`

---

## 13 — Referência canônica

| Artefato | Localização |
|----------|-------------|
| CSS tokens | mindroot-v2/src/index.css (@theme) |
| JS tokens | mindroot-v2/src/components/atoms/tokens.ts |
| Semente universal | atom-engine-core/law/atom-brand-identity.md |
| Wireframes | atom-engine-core/design/wireframes/ (11 HTML) |
| Figma tokens | figma.com/design/TPXSIl6s3owTq4yERPSrU0 |

**Se index.css e este documento divergirem, este documento ganha.**

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 09 Abr 2026 | Documento inaugural. Surfaces light/dark, DM Sans + JetBrains Mono, 8 componentes, 13 telas, BottomNav, AI gradient. Herda cores universais da semente. |
| 1.1 | 08 Mai 2026 | Sessão Arca 04 (design exploration Claude Design). 4 sections novas (§9 9 glifos custom da Raiz · §10 side band/top border dual semântico · §11 two-state Home aurora pendente/respondida · §12 pulse line vs score anti-gamification). Mapa §7 atualizado de 13 telas pra 14 com status v0.1 (7 ✓ executadas, 7 ◐ deltas pendentes). Pulso (ex-Analytics) com rearquitetura conceitual. Referência visual em `design/v0.1/index.html`. |

---

*Este é o fruto do V1. A semente vive em law/atom-brand-identity.md.*
