# MindRoot — Design System (V1)

**Versão:** 1.0
**Data:** 09 Abr 2026
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

## 7 — Telas (13)

| Tela | BottomNav tab | Descrição |
|------|---------------|-----------|
| Home | Home | 4 blocos: Emotion → Action → Time → Audit |
| Search | Search | Full-text search + filtros (type, module, stage) |
| Pipeline | Pipeline | Stage bar + lista por estágio (kanban vertical) |
| Raiz | Raiz | 9 domínios × 7 estágios, inventory da vida |
| Capture | FAB centro | AtomInput expandido, companion contextual |
| Wrap | via Home | Stepper 7 passos, ritual de commit |
| Library | via Search | Browse por type, cards agrupados |
| Graph | via item | Connections visualizadas, nós + edges |
| Calendar | futuro | Eventos + items com due_date |
| Settings | via avatar | Conta, connectors, preferências |
| Auth | pre-login | Login/signup |
| Landing | pre-login | Página pública |
| Onboarding | first run | Raiz onboarding, 3 portas, companion |

---

## 8 — Viewport

**Mínimo:** 360×800 (mobile-first)
**Breakpoints:**
- sm: 360px (default)
- md: 768px (tablet)
- lg: 1024px (desktop)

**Regra:** toda feature é desenhada primeiro pra 360px. Desktop é adaptação, não o contrário.

---

## 9 — Referência canônica

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

---

*Este é o fruto do V1. A semente vive em law/atom-brand-identity.md.*
