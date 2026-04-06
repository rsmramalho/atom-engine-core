# MindRoot — Design System (V1)

**Versão:** 1.0
**Data:** 06 Abr 2026
**Status:** active
**Princípio:** Herda os princípios universais do ATOM.md. Define as escolhas visuais do V1.

---

## Tipografia

**Fonte:** DM Sans
**Pesos:** 400 (body) e 500 (heading). Nunca 600+.
**Escala:** body 14px (0.875rem), heading 16px (1rem), section label 11px.

---

## Cores

### Superfícies (light/dark)

| Token | Light | Dark |
|-------|-------|------|
| bg | #FDFCF9 | #18171a |
| card | #FFFFFF | #201e24 |
| surface | #F5F3EE | #1c1a22 |
| border | #E8E4DC | #2e2a34 |

### Texto (light/dark)

| Token | Light | Dark |
|-------|-------|------|
| text | #3D3A36 | #d4d0cc |
| text-muted | #706B66 | #8a8580 |
| text-heading | #2A2724 | #f0ece6 |

### Accent (purple)

| Token | Light | Dark |
|-------|-------|------|
| accent | #534AB7 | #7F77DD |
| accent-light | #7F77DD | #AFA9EC |
| accent-bg | #EEEDFE | rgba(83,74,183,0.15) |

### Módulos (8 — herdados do Genesis, mesmos em light e dark)

| Módulo | Cor |
|--------|-----|
| work | #8a9e7a |
| body | #b8c4a8 |
| mind | #a89478 |
| family | #d4856a |
| purpose | #c4a882 |
| bridge | #8a8a8a |
| finance | #7a9e8a |
| social | #9e7a8a |

### Estágios (7 — herdados do Genesis)

| Estágio | Cor |
|---------|-----|
| 1 · Ponto | #6b6b6b |
| 2 — Linha | #8a9e7a |
| 3 △ Triângulo | #7a8fb8 |
| 4 □ Quadrado | #c4a882 |
| 5 ⬠ Pentágono | #b8896a |
| 6 ⬡ Hexágono | #9e7ab8 |
| 7 ○ Círculo | #d4b872 |

### Rituais (3 — herdados do Genesis)

| Ritual | Cor |
|--------|-----|
| aurora | #f0c674 |
| zênite | #e8e0d4 |
| crepúsculo | #8a6e5a |

### Status

| Status | Cor | Text | Bg |
|--------|-----|------|----|
| success | #1D9E75 | #3B6D11 | #EAF3DE |
| warning | #EF9F27 | #854F0B | #FAEEDA |
| error | #D85A30 | #A32D2D | #FAECE7 |

---

## Componentes

| Componente | Spec |
|------------|------|
| Card | bg-card border border-border rounded-[14px] p-3.5 |
| Chip/pill | text-[10px] px-2 py-0.5 rounded-lg |
| Input | border border-border rounded-xl px-4 py-3 text-sm bg-card |
| Button primary | bg-accent text-white rounded-xl px-5 py-2.5 text-sm |
| Section label | text-[11px] font-medium tracking-[1.2px] uppercase text-text-muted |

---

## Spacing

| Token | Valor |
|-------|-------|
| xs | 0.25rem (4px) |
| sm | 0.5rem (8px) |
| md | 1rem (16px) |
| lg | 1.5rem (24px) |
| xl | 2rem (32px) |
| 2xl | 3rem (48px) |

---

## Referência canônica

- CSS: `src/index.css` (@theme)
- JS: `src/components/atoms/tokens.ts`
- Se divergirem, este documento ganha.

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 06 Abr 2026 | Extraído do ATOM.md §Quadrado. Cores, tipografia, componentes, spacing do V1 MindRoot. |
