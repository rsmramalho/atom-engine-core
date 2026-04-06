# Design Genesis v0.1
## O Contrato Universal de Interfaces do Pentágono

**Versão:** 0.1
**Data:** 05 Abr 2026
**Status:** DRAFT — não operacional
**Tipo:** spec
**Módulo:** bridge
**Origem:** seed capturada em sessão 05 Abr 2026 — Project Atom
**Depende de:** Genesis v5.0.2, Meta-Template v1.1
**Princípio:** O token é o contrato, não o componente.

---

> Este documento é um draft. Ainda não é lei.
> Vira documento-lei quando: (1) validado com ao menos uma estrela do Pentágono implementada,
> (2) revisado em sessão dedicada, (3) commitado com status `definitive`.

---

## Parte 1 — Filosofia

### O problema que resolve

Cada app do Pentágono nasce do zero visualmente. Decisões de espaçamento, tipografia, grid, estados de componente — são retomadas a cada projeto. Não existe uma lei que defina como uma interface cresce. O Genesis define como um *item de dados* nasce de um ponto e amadurece até o círculo. Nada equivalente existe para interfaces.

### A solução: Design Genesis

O mesmo princípio *de dentro pra fora* aplicado ao design. Uma interface não nasce como tela completa — nasce como um token (uma cor, um espaçamento, uma decisão tipográfica) e amadurece em 7 estágios até virar um sistema vivo.

**A liberdade criativa de cores, estrutura visual e features pertence a cada criador.** O que o Design Genesis define é o *princípio de crescimento* — não a aparência. Cada estrela do Pentágono tem sua própria paleta, sua própria personalidade. O que é universal é a lei de maturação.

### Relação com o Genesis de dados

| Genesis (dados) | Design Genesis (interfaces) |
|---|---|
| Schema é o contrato | Token é o contrato |
| type + module definem estrutura | Plataforma + contexto definem layout |
| 7 estágios de maturação | 7 estágios de maturação |
| Supabase é a fonte canônica | atom-engine-core é a fonte canônica |
| AtomItem é a unidade base | Componente é a unidade base |
| Ferramentas são consumidores | v0, Figma, Claude Code são consumidores |

---

## Parte 2 — As Três Leis

### Lei 1 — O token é o contrato, não o componente

Se amanhã troca o framework (React → Svelte), a plataforma (mobile → desktop), a ferramenta (Figma → v0) — o design token é o mesmo. Cor, espaçamento, tipografia e raio definidos uma vez propagam para todos os consumidores.

Componentes são consumidores dos tokens. Telas são consumidoras dos componentes. O sistema inteiro depende dos tokens — nunca o inverso.

### Lei 2 — Documentar é construir

Um wireframe, uma decisão de UX, uma especificação de componente — são trabalho real, não overhead. O Design Genesis nasce documentado. Cada tela tem spec. Cada componente tem estado definido. Cada decisão tem registro com data e raciocínio.

### Lei 3 — A mudança propaga de dentro pra fora

Nada se reescreve em múltiplos lugares. Você atualiza o token de cor primária uma vez no `atom-engine-core` — MindRoot, Constellation, qualquer estrela futura herda automaticamente. A liberdade criativa de cada criador vive *acima* da camada de token, nunca abaixo.

---

## Parte 3 — Os 7 Estágios de Maturação

Mesma geometria sagrada do Genesis de dados. Do ponto ao círculo.

| # | Geometria | Nome | State | O que é | Gate de passagem |
|---|---|---|---|---|---|
| 1 | · Ponto | Token | `raw` | Uma decisão de design isolada. Cor, espaçamento, raio, fonte, duração de animação. | O valor existe e tem nome semântico |
| 2 | — Linha | Atom | `defined` | Elemento UI mínimo indivisível. Botão, input, texto, ícone, divider. | Token aplicado. 5 estados definidos. |
| 3 | △ Triângulo | Molécula | `composed` | Combinação de atoms com função única. Campo = label + input + helper. | Atoms conectados. Comportamento definido. Acessibilidade ok. |
| 4 | □ Quadrado | Organismo | `validated` | Seção complexa autônoma. Nav, card, modal, form completo. | Moléculas validadas. Responsividade testada. Estados de erro cobertos. |
| 5 | ⬠ Pentágono | Template | `connected` | Layout completo de uma tela. Define onde cada organismo vive. | Todos os organismos conectados. Fluxo de navegação definido. |
| 6 | ⬡ Hexágono | Fluxo | `propagated` | Telas conectadas numa jornada. Onboarding, checkout, configuração. | Templates ligados. Transições definidas. Estados de erro entre telas. |
| 7 | ○ Círculo | Sistema | `committed` | Design system vivo, documentado, versionado, commitado. | Tudo documentado. Tokens exportados. Consumidores atualizados. |

### Propriedades da progressão

- **Avanço:** sempre sequencial (1→2→3→4→5→6→7). Não pula estágio.
- **Regressão:** mudança de token regride componentes que o consomem para re-validação.
- **Propagação automática:** mudança no estágio 1 (token) dispara update em todos os estágios acima.
- **Sistema vivo:** o círculo não é fim — é manutenção contínua. Tokens evoluem. O sistema acompanha.

---

## Parte 4 — Plataformas

Duas plataformas definidas uma vez. Specs imutáveis exceto por versão explícita deste documento.

### 4.1 Mobile — base 390px

| Spec | Valor |
|---|---|
| Viewport base | 390px (iPhone 14) |
| Padding horizontal | 16px |
| Grid | 4 colunas |
| Gutter | 8px |
| Largura de coluna | ~74px |
| Bottom navigation | 56px de altura |
| Status bar | 44px |
| Tap target mínimo | 44px |
| Tipografia base | 14px / line-height 1.5 |
| Card border-radius | 12–16px |
| Componente border-radius | 8–12px |
| Input height | 36–44px |

### 4.2 Desktop — base 1440px

| Spec | Valor |
|---|---|
| Viewport base | 1440px |
| Content max-width | 1280px |
| Padding horizontal | 80px |
| Grid | 12 colunas |
| Gutter | 24px |
| Sidebar padrão | 240px |
| Topbar | 56px de altura |
| Hover target mínimo | 32px |
| Tipografia base | 13px / line-height 1.5 |
| Card border-radius | 8–12px |
| Componente border-radius | 6–8px |
| Input height | 32–36px |

### 4.3 Tipografia — escala universal (ambas as plataformas)

| Nome | Mobile | Desktop | Peso | Uso |
|---|---|---|---|---|
| display | 24px | 32px | 500 | Títulos de página |
| heading | 20px | 24px | 500 | Seções principais |
| subheading | 16px | 18px | 500 | Subsections |
| body large | 14px | 15px | 400 | Texto principal |
| body | 13px | 13px | 400 | Conteúdo padrão |
| caption | 12px | 12px | 400 | Descrições, helpers |
| label | 11px | 11px | 500 | Labels uppercase, chips |
| micro | 10px | 10px | 400 | Metadata apenas |

**Regra:** máximo 2 pesos por projeto (400 regular + 500 medium). Nunca 600 ou 700.

---

## Parte 5 — Os 5 Estados de Componente

Todo componente existe em um destes 5 estados em qualquer momento. A spec de cada componente define como ele se comporta em cada estado.

| # | Estado | Quando | Regras |
|---|---|---|---|
| 1 | **vazio** | Nenhum dado disponível | Mensagem encorajadora (nunca "sem dados"). Ação primária visível. Nunca tela em branco. |
| 2 | **carregando** | Dados em trânsito | Skeleton screen (nunca spinner centralizado). Animar apenas opacity/transform. Skeleton após 100ms de espera. |
| 3 | **populado** | Dados presentes | Estado padrão. Hierarquia visual clara. Ações secundárias acessíveis mas não dominantes. |
| 4 | **erro** | Algo falhou | Mensagem humana (nunca código de erro). Ação de recuperação sempre presente. Cor de erro semântica. |
| 5 | **interativo** | Usuário operando | Feedback em 150ms (hover/focus). Transição de estado em 200ms. Touch target respeitado. |

---

## Parte 6 — Tokens Universais (referência mínima)

Estes tokens são os mínimos que todo projeto do Pentágono define. Valores específicos pertencem a cada criador — os *nomes* são universais.

### 6.1 Cor

```
color.background.primary       -- superfície principal (geralmente branco)
color.background.secondary     -- superfície elevada (off-white, cinza claro)
color.background.tertiary      -- fundo de página
color.background.accent        -- destaque suave (versão clara da cor de acento)

color.text.primary             -- texto principal
color.text.secondary           -- texto muted
color.text.tertiary            -- texto de hint/placeholder
color.text.accent              -- texto sobre fundo de acento

color.border.default           -- borda padrão (0.5px)
color.border.emphasis          -- borda de destaque (hover, focus)

color.accent                   -- cor de marca (botão primário, links)

color.status.success
color.status.warning
color.status.error
color.status.info
```

### 6.2 Espaçamento

Escala baseada em 4px: `4, 8, 12, 16, 20, 24, 32, 40, 48, 64`

```
space.page.mobile              -- 16px (padding horizontal de página)
space.page.desktop             -- 80px
space.component.xs             -- 4px
space.component.sm             -- 8px
space.component.md             -- 12px
space.component.lg             -- 16px
space.component.xl             -- 24px
space.section                  -- 24px (gap entre seções)
space.card                     -- 8px (gap entre cards)
```

### 6.3 Forma

```
radius.sm       -- 4–6px   (inputs, buttons desktop)
radius.md       -- 8px     (componentes padrão)
radius.lg       -- 12px    (cards mobile)
radius.xl       -- 16px    (cards grandes, sheets)
radius.pill     -- 999px   (badges, chips, pills)
```

### 6.4 Animação

```
duration.instant    -- 0ms     (sem transição — mudanças de estado discretas)
duration.fast       -- 150ms   (hover, focus ring)
duration.default    -- 200ms   (transições de componente)
duration.slow       -- 300ms   -- (sheets, modals, page transitions)

easing.default      -- ease
easing.enter        -- ease-out
easing.exit         -- ease-in
```

---

## Parte 7 — Conexão com o Atom Engine

### 7.1 Onde vive

O Design Genesis vive no `atom-engine-core` como spec, ao lado do Genesis de dados.
Ferramentas (v0, Figma, Claude Code) são consumidoras — nunca fontes.

```
atom-engine-core/
└── design/
    ├── system_spec_design-genesis_v0-1-draft.md   ← este arquivo
    ├── tokens/
    │   ├── mobile.json      (tokens mobile quando implementados)
    │   └── desktop.json     (tokens desktop quando implementados)
    └── wireframes/          (já existe — 11 telas MindRoot)
```

### 7.2 Fluxo de propagação

```
Design Genesis (lei) — atom-engine-core
  ↓ define tokens
  ↓ Claude Code lê spec
  ↓ gera token files
  ↓ MindRoot consome
  ↓ Constellation consome
  ↓ qualquer estrela futura consome
```

### 7.3 Relação com o Pentágono

| Estrela | Plataforma | Tokens próprios | Lei comum |
|---|---|---|---|
| MindRoot | Mobile-first | Sim | Design Genesis |
| Constellation OS | Desktop-first | Sim | Design Genesis |
| Yugar | TBD | Sim | Design Genesis |
| Muda | TBD | Sim | Design Genesis |

---

## Parte 8 — O que este draft ainda não define

Registros honestos do que falta antes de virar lei:

1. **Token files concretos** — os arquivos `mobile.json` e `desktop.json` com valores reais ainda não existem.
2. **Validação cross-estrela** — o sistema só prova que funciona quando duas estrelas do Pentágono o usam e propagação real é testada.
3. **Processo de update** — como uma mudança de token é proposta, aprovada e deployada para todos os consumidores. Sem isso, "propagação automática" é intenção, não mecanismo.
4. **Acessibilidade** — contraste mínimo (WCAG AA), navegação por teclado, screen reader — não especificados ainda.
5. **Dark mode** — o Design Genesis menciona tokens de cor mas não especifica como dark mode é gerenciado sistematicamente.
6. **Versionamento de tokens** — quando um token muda, o que acontece com consumidores que não foram atualizados?

---

## Versionamento

| Versão | Data | Mudança |
|---|---|---|
| 0.1-draft | 05 Abr 2026 | Documento inicial — seed capturada e expandida. 3 leis, 7 estágios, 2 plataformas, 5 estados, tokens universais, conexão com Pentágono. Status: draft. |

---

*Este documento não é lei ainda.*
*Vira lei quando validado em produção com ao menos uma estrela do Pentágono.*
*Até lá: referência viva, sujeita a mudança sem aviso.*
