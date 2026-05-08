# Atom — Brand Identity

**Versão:** 1.0
**Data:** 09 Abr 2026
**Status:** Definitive
**Princípio:** O átomo contém o DNA do universo. A identidade visual segue a mesma lei — cada vertex herda a semente e cultiva seu próprio fruto.

---

## 1 — O nome

**Atom.** O nome do universo. Tudo que existe — engine, produtos, ecossistema — vive sob esse nome.

**Human Systems.** Subtítulo filosófico. Não é o nome principal. Aparece quando faz sentido contextualizar: "Atom — Human Systems."

O mundo vê o nome do vertex (MindRoot, Constellation). O Atom aparece como fundação — "powered by Atom Engine" — ou em contexto técnico/institucional.

---

## 2 — Logo

### 2.1 Construção

O "o" de Atom é substituído pelo símbolo ⊙ — um círculo com ponto central.

- O **círculo** é o estágio 7 (completude)
- O **ponto** é o estágio 1 (potencial puro)
- O logo contém o início e o fim numa única forma

### 2.2 Tipografia do logo

DM Sans, weight 500. O símbolo ⊙ é SVG geométrico: `<circle>` stroke (anel) + `<circle>` fill (ponto central).

### 2.3 Variantes

| Variante | Quando usar |
|----------|-------------|
| **Dark** (texto #E0E0E8, stroke #7B6FE8) | Fundos escuros — padrão |
| **Light** (texto #1A1A2E, stroke #7B6FE8) | Fundos claros |
| **Símbolo isolado** (⊙ sem texto) | Favicon, ícone de app, badge |

### 2.4 Clear space

Mínimo 1× a altura do símbolo ⊙ em todas as direções. Nada invade esse espaço.

### 2.5 Nunca

- Distorcer ou rotacionar o logo
- Separar o símbolo ⊙ do texto em contexto de logo
- Usar cores que não sejam as deste documento
- Aplicar sombra, glow, gradiente, ou efeito 3D no logo

---

## 3 — Cores universais

Estas cores são a semente. Todo vertex do Pentágono herda sem modificação. Um item do módulo `work` é da mesma cor no MindRoot, no Constellation, e em qualquer vertex futuro.

### 3.1 Accent (purple)

A cor primária do Atom Engine. O purple é a assinatura.

| Token | Hex | Uso |
|-------|-----|-----|
| accent | #7B6FE8 | Primária — botões, links, foco |
| accent-light | #9B8FFF | Hover, destaque secundário |
| accent-dark | #5B4FC8 | Texto sobre fundo accent |
| accent-glow | rgba(123, 111, 232, 0.15) | Backgrounds sutis, pills |

### 3.2 Módulos (8)

Cada módulo do Genesis tem uma cor fixa. Aparece como borda lateral em cards, chips de filtro, indicadores de contexto.

| Módulo | Hex | Referência visual |
|--------|-----|-------------------|
| work | #4A90D9 | Azul — produção, ofício |
| body | #27AE60 | Verde — saúde, movimento |
| mind | #F2994A | Laranja — pensamento, aprendizado |
| family | #EB5757 | Vermelho — vínculos, cuidado |
| purpose | #9B51E0 | Roxo — direção, sentido |
| bridge | #2D9CDB | Ciano — conexão, transição |
| finance | #219653 | Verde escuro — dinheiro, recurso |
| social | #F2C94C | Amarelo — comunidade, presença |

### 3.3 Estágios Genesis (7)

Cada estágio da state machine tem uma cor. Stage bars, badges, e indicadores de maturidade usam estas cores.

| Estágio | Geometria | Hex |
|---------|-----------|-----|
| 1 | · Ponto | #6B7280 |
| 2 | — Linha | #8B5CF6 |
| 3 | △ Triângulo | #3B82F6 |
| 4 | □ Quadrado | #10B981 |
| 5 | ⬠ Pentágono | #F59E0B |
| 6 | ⬡ Hexágono | #EF4444 |
| 7 | ○ Círculo | #7B6FE8 |

**Nota:** estágio 7 usa a mesma cor do accent. A completude e a identidade se encontram.

### 3.4 Rituais (3)

Cada período do dia tem uma temperatura de cor.

| Ritual | Hex | Temperatura |
|--------|-----|-------------|
| aurora | #F0C674 | Quente — energia do amanhecer |
| zênite | #E8E0D4 | Neutro — foco do meio-dia |
| crepúsculo | #8A6E5A | Frio — recolhimento do anoitecer |

### 3.5 Regra de uso

- Cores de módulo e estágio **nunca mudam entre vertices**
- Cores de ritual **nunca mudam entre vertices**
- O accent purple **nunca muda entre vertices**
- Cada vertex pode criar cores adicionais (status, surfaces, secundárias) — mas as universais são intocáveis

---

## 4 — Superfícies

Toda interface Atom opera em 3 camadas de profundidade. Os valores hex são escolha de cada vertex — o padrão de 3 camadas é universal.

| Camada | Função | Exemplo |
|--------|--------|---------|
| bg | Fundo da página | A tela inteira |
| card | Cards e containers | Um item, uma seção |
| surface | Fundo secundário | Inputs, chips, overlays, modais |

### Regras

- **Dark mode obrigatório.** Toda cor de superfície tem variante escura. Light mode é opcional.
- As 3 camadas devem ter contraste suficiente entre si pra criar hierarquia visual sem bordas pesadas.
- Bordas são sutis (0.5px–1px, baixa opacidade). Nunca grossas.

---

## 5 — Tipografia

### Princípios universais (todo vertex herda)

- **Dois pesos:** regular (400) para body, medium (500) para headings. Nunca bold pesado (600+).
- **Uma fonte sans-serif** como primária. Qual fonte = escolha do vertex.
- **Uma fonte monospace** para código, labels técnicos, e metadata. Qual fonte = escolha do vertex.
- Escala mínima: body ≥ 14px, caption ≥ 11px. Abaixo de 11px não existe.

### Escala de referência (sugestão, não obrigatória)

| Nível | Tamanho | Peso | Uso |
|-------|---------|------|-----|
| display | 36px | 500 | Títulos de página, hero |
| heading | 24px | 500 | Títulos de seção |
| subheading | 18px | 500 | Subtítulos |
| body | 15px | 400 | Texto corrido |
| small | 13px | 400 | Texto secundário |
| caption | 11px | 400 | Metadata, timestamps |
| label | 10–11px | 500 | Section labels, tracking wide |

---

## 6 — Spacing

### Escala universal (base 4px)

Todo vertex usa múltiplos de 4px.

| Token | Valor |
|-------|-------|
| 4xs | 2px |
| 3xs | 4px |
| 2xs | 6px |
| xs | 8px |
| sm | 12px |
| md | 16px |
| lg | 24px |
| xl | 32px |
| 2xl | 48px |
| 3xl | 64px |

---

## 7 — Geometria sagrada

Os 7 estágios usam símbolos geométricos como identidade visual. Aparecem em badges, indicadores de progresso, e referências ao pipeline.

| Estágio | Símbolo | Nome |
|---------|---------|------|
| 1 | · | Ponto |
| 2 | — | Linha |
| 3 | △ | Triângulo |
| 4 | □ | Quadrado |
| 5 | ⬠ | Pentágono |
| 6 | ⬡ | Hexágono |
| 7 | ○ | Círculo |

Os símbolos são Unicode, não ícones customizados. Renderizam em qualquer sistema.

---

## 8 — Padrões de componente

Padrões de design — não implementações. Cada vertex implementa com sua tecnologia. O padrão é o contrato visual.

### 8.1 Item card

O bloco fundamental. Todo item do sistema aparece como card.

- Borda lateral (3px) na cor do módulo
- Título em peso 500
- Metadata abaixo: geometria do estágio + nome do type + nome do módulo
- Background: camada `card`
- Border-radius: escolha do vertex (sugestão: 8–14px)

### 8.2 Module chip

Identificador visual de módulo.

- Dot (6px, cor do módulo) + nome do módulo
- Background: cor do módulo a 15% opacidade
- Texto: cor do módulo a 100%
- Border-radius: pill (999px)

### 8.3 Stage badge

Identificador visual de estágio.

- Símbolo da geometria + nome do state (ou número)
- Cor de texto: cor do estágio
- Pode ser minimal (só símbolo) ou expandido (símbolo + label)

### 8.4 Botões (3 níveis)

| Nível | Visual | Quando |
|-------|--------|--------|
| primary | bg accent, texto branco | Ação principal (commit, salvar) |
| ghost | borda accent, bg transparente | Ação secundária (cancelar, voltar) |
| subtle | bg accent-glow, texto accent-light | Ação terciária (capturar, filtrar) |

### 8.5 Input

- Background: camada `surface`
- Borda sutil (1px, cor border)
- Focus: borda accent
- Placeholder: texto muted
- Border-radius: escolha do vertex

### 8.6 Toast / feedback

- Nunca modal blocking. Sempre toast (aparece e some).
- Texto nunca sai do container (max-width, word-break)
- 3 níveis: success (verde), warning (amarelo), error (vermelho)
- Posição: top center ou bottom center — escolha do vertex

---

## 9 — Semente vs fruto

Este documento é a **semente**. Define o que todo vertex herda sem modificação.

O **fruto** é o que cada vertex cultiva: a fonte específica, os valores hex das superfícies, os componentes implementados, os tokens CSS/Figma, o border-radius, a personalidade visual.

| Aspecto | Semente (universal) | Fruto (por vertex) |
|---------|--------------------|--------------------|
| Cores de módulo (8) | Fixas | — |
| Cores de estágio (7) | Fixas | — |
| Cores de ritual (3) | Fixas | — |
| Accent purple | Fixo | — |
| Superfícies | Padrão de 3 camadas | Valores hex específicos |
| Tipografia | 2 pesos, sans + mono | Qual fonte, qual escala |
| Spacing | Base 4px | — |
| Componentes | Padrão visual (§8) | Implementação tecnológica |
| Dark mode | Obrigatório | Light mode opcional |
| Mobile-first | Obrigatório | Breakpoints específicos |

Quando um vertex novo nasce, ele lê este documento e cria seu `[vertex]/design/design-system.md` com as escolhas específicas. As cores universais já estão definidas — o vertex só precisa escolher fonte, superfícies, e implementação.

---

## 10 — Referências

| Artefato | Onde vive |
|----------|----------|
| Logo SVG (dark + light + símbolo) | atom-brand-kit.html (Project Atom KB) |
| Figma tokens | figma.com/design/TPXSIl6s3owTq4yERPSrU0 |
| Identidade e nomenclatura | system_spec_atom-identidade_v1-2.md |
| Princípios de design (ATOM.md) | ATOM.md §Quadrado — Fundação 1 |
| Padrões de interface por camada | system_template_design-tree_v1-0.md |

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 09 Abr 2026 | Documento inaugural. Cores universais definidas (brand kit saturado = canônico). Logo, tipografia, spacing, padrões de componente, regra semente vs fruto. |

---

*A semente não muda entre estações. O fruto sim.*
*Este documento é a semente.*
