# Atom — Design Tree
## O Molde das Interfaces

**Versão:** 1.0
**Data:** 07 Abr 2026
**Status:** Definitive
**Referência:** ATOM.md v1.3 + Genesis v5.0.4 + Meta-Template v1.2 + Identidade v1.2
**Princípio:** Se a geometria deste documento estiver perfeita, toda interface que nascer dele herda essa geometria. A Árvore da Vida não foi adicionada ao design — emergiu dele.

---

## 1 — O que é isto

Este documento define a **estrutura exata** que toda interface do Atom Engine segue. Não é exemplo — é contrato. Qualquer vertex do Pentágono que construir sua interface segue esta árvore, camada por camada, de dentro pra fora.

O Meta-Template é o molde dos types. Este documento é o molde das interfaces.

**Duas categorias de camadas:**
- **Engine (1-8):** universais — todo vertex herda sem modificar
- **Vertex (9-10):** específicas — cada vertex implementa do seu jeito

A diferença entre as duas categorias é o que muda: nas camadas Engine, o vertex herda padrões, componentes e comportamentos. Nas camadas Vertex, ele escolhe o que mostrar e como organizar.

**A receita:** pra construir a interface de qualquer vertex, percorra as 10 camadas em ordem. Cada camada define: o que ela precisa, quais padrões de UX, quais componentes, e o wireframe conceitual. Pule a camada 1 (sem UI). Comece pela 2. Termine na 10.

---

## 2 — A Árvore da Vida (Etz Chaim)

A progressão das 10 camadas segue as 10 sefirot da Cabala. Não é metáfora — é arquitetura. Cada camada depende das anteriores. A Porta não existe sem a Casa. Os Olhos não enxergam sem o Motor.

| # | Camada | Sefirah | Domínio | Escopo |
|---|--------|---------|---------|--------|
| 1 | Casa | Keter (coroa) | Dados | Engine |
| 2 | Porta | Chokmah (sabedoria) | Auth + entrada | Engine |
| 3 | Língua | Binah (entendimento) | Parsing + triage | Engine |
| 4 | Pilares | Chesed (bondade) | Emotion / Action / Time | Engine |
| 5 | Motor | Gevurah (força) | State machine + pipeline | Engine |
| 6 | Cara | Tiferet (beleza) | Design system + tokens | Engine |
| 7 | Bocas | Netzach (eternidade) | Connectors (4 universais) | Engine |
| 8 | Olhos | Hod (esplendor) | Views universais | Engine |
| 9 | Home | Yesod (fundação) | Dashboard do vertex | Vertex |
| 10 | Features | Malkuth (reino) | Módulos específicos | Vertex |

**Três escalas da mesma árvore:**
- **Item:** um AtomItem percorre 7 estágios (Genesis)
- **Interface:** uma tela percorre 10 camadas (este documento)
- **Ecossistema:** um vertex percorre 5 posições no Pentágono (Identidade)

---

## 3 — Princípio governante: Progressive Disclosure

Toda decisão de design segue uma regra:

**3 camadas de complexidade:**
- **Simples** — o que 80% dos usuários precisam. Visível por padrão.
- **Explora** — o que 15% descobrem. Revelado por interação (toque, scroll, swipe).
- **Power** — o que 5% usam. Escondido atrás de gesto ou atalho (CommandPalette, long-press).

Cada camada da árvore aplica esse princípio internamente. O AtomInput é simples (digita e envia). Os chips de sugestão são explora (aparecem depois da classificação). Os filtros avançados são power (CommandPalette).

**Regra:** se um componente só serve pra power users, ele não aparece na primeira interação. Nunca. Se ele for essencial, redesenhe até ficar simples.

---

## 4 — Camada 1: Casa (Keter)

### Domínio
Supabase — source of truth. Tabelas, RLS, triggers, RPCs, events.

### UI
Nenhuma. A Casa é invisível. O vertex nunca toca aqui diretamente.

### O que o vertex herda
- Schema pronto (items, item_connections, atom_events)
- RPCs prontas (morph, decay, propagate, commit)
- Triggers prontos (sync_genesis_stage, check_orphan_downgrade)
- Audit views prontas (v_orphan_items, v_below_floor, v_inbox_stale)

### Regra
Se o vertex precisa de uma tabela extra (ex: `user_connectors`), ela vive no schema do vertex, não no Engine. O Engine é imutável.

---

## 5 — Camada 2: Porta (Chokmah)

### Domínio
Auth + entrada. A primeira coisa que a pessoa vê. Login, onboarding, primeiro contato.

### Padrões de UX obrigatórios

**5.1 Login**
- Auth via email + OAuth (Google mínimo)
- Tela única: logo + campo email + botão OAuth
- Sem formulário de cadastro separado — login e signup são o mesmo flow
- Após auth: redireciona pra Home (camada 9) se já tem dados, ou Onboarding se é primeira vez

**5.2 Onboarding (Raiz)**
- Baseado nos 9 domínios do Raiz: identity, health, finance, storage, memories, time, communication, projects, documents
- Formato: cards empilhados, um domínio por card
- Cada card pergunta: "o que você tem nesse domínio?" com exemplos
- O usuário pode pular qualquer domínio
- Resultado: items no inbox (estágio 1) prontos pro pipeline
- Onboarding não é one-time — Raiz é feature permanente acessível sempre

**5.3 Empty states**
- Toda tela que pode estar vazia tem um empty state com:
  - Ilustração mínima (geometria do estágio correspondente)
  - Frase curta explicando o que apareceria aqui
  - Um CTA ("capturar primeiro item", "conectar email", etc.)
- Empty state é a melhor documentação do sistema — trata como conteúdo, não como placeholder

### Componentes

| Componente | Padrão |
|------------|--------|
| Login card | Centralizado, bg-card, logo acima, campo email + botão OAuth |
| Onboarding card | Full-width, ícone do domínio + título + exemplos + input |
| Empty state | Centralizado vertical, geometria + texto + CTA |

### Wireframe conceitual

```
┌─────────────────────────────┐
│                             │
│         [Logo]              │
│                             │
│   ┌───────────────────┐     │
│   │ email@exemplo.com │     │
│   └───────────────────┘     │
│                             │
│   [ Entrar com Google ]     │
│                             │
└─────────────────────────────┘

        ↓ primeira vez ↓

┌─────────────────────────────┐
│  · identity                 │
│  "Quem é você?"             │
│  nome, idade, profissão     │
│  [campo] [campo] [campo]    │
│                    [pular]  │
├─────────────────────────────┤
│  · health                   │
│  "Como cuida do corpo?"     │
│  ...                        │
└─────────────────────────────┘
```

---

## 6 — Camada 3: Língua (Binah)

### Domínio
Parsing + triage. O sistema entende o que a pessoa disse. Captura → classificação → confirmação.

### Padrões de UX obrigatórios

**6.1 AtomInput — o campo de captura**
- Sempre acessível (Home no mínimo, idealmente global)
- Placeholder contextual: muda por período (aurora: "bom dia, como você tá?", zênite: "o que tá na cabeça?", crepúsculo: "como foi o dia?")
- Enter envia. Sem botão obrigatório (mas pode ter ícone de envio)
- Texto vai pro inbox (estágio 1) imediatamente
- Nenhum campo extra na captura — só o texto. Classificação vem depois.

**6.2 Auto-triage — as 3 faixas**

| Faixa | Confiança | UX | Animação |
|-------|-----------|-----|----------|
| Alta | ≥90% passivo / ≥95% acionável | Auto-classifica silencioso | Micro-animação ·→—→△ (~1s) |
| Média | 60-89% / 60-94% | Chip inline abaixo do input | Toque confirma, X rejeita |
| Baixa | <60% | Fica no inbox | Sem animação — badge "inbox" |

**6.3 Triage em batch**
- Tela dedicada acessível da Home (badge com count no inbox)
- Lista de items no inbox com sugestão de type/module
- Swipe right = aceitar sugestão
- Swipe left = descartar (volta pro inbox pra triagem manual)
- Tap = abrir e editar classificação
- Princípio: resolver 10 items em 30 segundos

### Componentes

| Componente | Padrão |
|------------|--------|
| AtomInput | Full-width, bg-card, border sutil, placeholder contextual, icon send |
| Suggestion chip | Inline abaixo do input, bg-surface, type icon + module cor + "confirma?" |
| Triage card | List item com geometria + cor + sugestão + swipe actions |
| Stage animation | Morph suave entre geometrias (·→— fade, —→△ morph) |
| Inbox badge | Número no ícone, cor de alerta se >7 dias (stale) |

### Wireframe conceitual

```
┌─────────────────────────────┐
│ ┌─────────────────────┐     │
│ │ o que tá na cabeça? │ [>] │
│ └─────────────────────┘     │
│                             │
│  sugestão: task · work (87%)│
│  [✓ confirma]    [✗ não]    │
│                             │
│  ─────────────────────────  │
│                             │
│  ·  "comprar leite"    →swp │
│  ·  "ideia do app"     →swp │
│  ·  "ramen do centro"  →swp │
│     inbox (3) · 2 stale     │
└─────────────────────────────┘
```

---

## 7 — Camada 4: Pilares (Chesed)

### Domínio
Os 3 pilares do Atom: Emotion, Action, Time. Todo vertex implementa os três. Muda o conteúdo, nunca a estrutura.

### Padrões de UX obrigatórios

**7.1 Pilar Emotion — Soul Layer**

| Momento | Trigger | UI |
|---------|---------|-----|
| Aurora | "bom dia" ou abertura do app pela manhã | Card com campo texto livre + chips de emoção + escala de energia (high/med/low) |
| Task significativa | Conclusão de milestone ou decisão difícil | Prompt inline: "como foi?" + campo texto livre |
| Crepúsculo | Wrap (passo Soul) | Mesmo card do aurora + shift visual (aurora→crepúsculo) |

**Regras do Soul:**
- Nunca forçar. Se a pessoa pula, ok. O sistema não insiste.
- Linguagem livre. "Meio bosta" é válido. Os chips são sugestão, não limite.
- Shift visual: barra gradiente mostrando emoção aurora (quente) → emoção crepúsculo (fria) com arco conectando.
- Padrões ao longo do tempo: analytics (camada 10), nunca julgamentos.

**7.2 Pilar Action — Items + Pipeline**

O pilar action é o mais denso. Ele se manifesta em várias camadas acima (Motor, Olhos), mas o padrão base é:

- Item card: título + chip type + cor module + geometria stage
- Borda lateral = cor do módulo (8 cores fixas)
- Geometria no canto = estágio atual (· — △ □ ⬠ ⬡ ○)
- Below floor = badge ou borda de alerta sutil
- Tap = expandir detalhes

**7.3 Pilar Time — Ritual Slots**

| Slot | Horário | Cor | Tom da UI |
|------|---------|-----|-----------|
| Aurora | 05h-08h | Quente (amber/gold) | Silencioso, foco, deep work |
| Zênite | 08h-17h | Neutro (default) | Operacional, ativo |
| Crepúsculo | 17h+ | Frio (purple/indigo) | Fechamento, reflexão |

**Regra:** o tom visual da interface muda por período. Não é dark/light — é a temperatura. Aurora: acentos quentes. Crepúsculo: acentos frios. A pessoa sente o período sem olhar a hora.

### Componentes

| Componente | Padrão |
|------------|--------|
| Soul card | bg-card, campo texto livre, chips de emoção sugerida, escala de energia (3 pills) |
| Shift bar | Barra horizontal, gradiente aurora→crepúsculo, duas emoções nos extremos, arco conectando |
| Item card | bg-card, borda lateral (cor módulo), geometria (stage), título, chip type |
| Period indicator | Sutil no header — ícone ou cor que muda por período |

### Wireframe conceitual

```
┌─────────────────────────────┐
│  ☀ aurora                   │
│                             │
│  como você tá chegando?     │
│  ┌─────────────────────┐    │
│  │ [texto livre]        │    │
│  └─────────────────────┘    │
│  [calmo] [focado] [ansioso] │
│  energia: [●○○] low        │
│                             │
│  intenção do dia:           │
│  ┌─────────────────────┐    │
│  │ "fechar a spec"      │    │
│  └─────────────────────┘    │
└─────────────────────────────┘

┌─────────────────────────────┐
│ ┃work  △ task               │
│ ┃      "fechar spec cockpit"│
│ ┃      #project:mindroot    │
│ └───────────────────────────│
│ ┃body  □ habit              │
│ ┃      "treino calistenia"  │
│ ┃      streak: 12 dias      │
│ └───────────────────────────│
└─────────────────────────────┘
```

---

## 8 — Camada 5: Motor (Gevurah)

### Domínio
FSM + state machine. Os 7 estágios como pipeline visual. Onde a geometria sagrada ganha vida na tela.

### Padrões de UX obrigatórios

**8.1 Pipeline view**
- Visualização dos 7 estágios como colunas ou faixas horizontais
- Cada estágio: geometria + cor + contagem de items
- Items fluem da esquerda (inbox) pra direita (committed)
- Drag-and-drop entre estágios (com validação — não pula estágio)

**8.2 Stage bar**
- Barra horizontal compacta mostrando distribuição de items por estágio
- 7 segmentos coloridos, largura proporcional à quantidade
- Aparece no dashboard (camada 9) como resumo visual rápido

**8.3 Transições visuais**
- Avanço: geometria morphs suavemente pra próxima forma (· fade→—, — morph→△)
- Regressão: geometria volta com animação reversa + subtle shake
- Morph (mutação de type): flash + re-classificação visual
- Decay (entropia): fade out gradual + seed aparece no inbox
- Born committed (wrap/session-log): aparece direto no ○ com animação de materialização

**8.4 Floor alerts**
- Item abaixo do piso mínimo: borda pontilhada ou badge "abaixo do piso"
- Não é bloqueio — é nudge visual
- Tooltip explica: "esse type precisa de pelo menos estágio X"

**8.5 Connections prompt**
- No estágio 4 (validado): o sistema pergunta "isso se conecta com algo?"
- UI: search inline com autocomplete de items existentes + seletor de relação
- Resposta "não" é válida — o item pode ficar no estágio 4 até o wrap

### Componentes

| Componente | Padrão |
|------------|--------|
| Pipeline view | 7 colunas/faixas, scrollável horizontal, items como cards dentro |
| Stage bar | Barra segmentada, 7 cores, proporcional, compacta (24px altura) |
| Stage geometry | SVG animado: ·—△□⬠⬡○, transição morph entre formas |
| Floor alert | Borda pontilhada + tooltip com explicação |
| Connection prompt | Card com search + seletor de relação (belongs_to, feeds, blocks...) |

### Wireframe conceitual

```
stage bar:
[··|——|△△△|□□|⬠|·|○○○○○]
 3   2   5   2  1 0   8

pipeline view:
┌───┬───┬───┬───┬───┬───┬───┐
│ · │ — │ △ │ □ │ ⬠ │ ⬡ │ ○ │
│   │   │   │   │   │   │   │
│ 3 │ 2 │ 5 │ 2 │ 1 │ 0 │ 8 │
│   │   │   │   │   │   │   │
│itm│itm│itm│itm│itm│   │itm│
│itm│itm│itm│itm│   │   │itm│
│itm│   │itm│   │   │   │itm│
└───┴───┴───┴───┴───┴───┴───┘

connection prompt (estágio 4):
┌─────────────────────────────┐
│ isso se conecta com algo?   │
│ ┌─────────────────────┐     │
│ │ buscar item...       │     │
│ └─────────────────────┘     │
│ relação: [belongs_to ▼]     │
│ [conectar]        [não]     │
└─────────────────────────────┘
```

---

## 9 — Camada 6: Cara (Tiferet)

### Domínio
Design system. A identidade visual do vertex. Separada em semente (universal) e fruto (específico).

### Padrões universais (semente — todo vertex herda)

**9.1 Cores de módulo (8 — fixas)**

| Módulo | Uso |
|--------|-----|
| work | Borda lateral de cards, chip de módulo, filtro |
| body | Idem |
| mind | Idem |
| family | Idem |
| purpose | Idem |
| bridge | Idem |
| finance | Idem |
| social | Idem |

Cores de módulo nunca mudam entre vertices. Um item `work` tem a mesma cor no MindRoot e no Constellation.

**9.2 Cores de estágio (7 — fixas)**
Cada estágio tem uma cor progressiva. Usada no stage bar, pipeline, geometrias.

**9.3 Cores de ritual (3 — fixas)**
Aurora (quente), zênite (neutro), crepúsculo (frio). Usadas no tom da interface e nos period indicators.

**9.4 Superfícies (3 camadas — fixas)**
- `bg` — fundo da página
- `card` — cards e containers
- `surface` — fundo secundário (inputs, chips, overlays)

**9.5 Princípios visuais (fixos)**
- Dark mode obrigatório
- Mobile-first (360×800 mínimo)
- Dois pesos tipográficos: regular (body) e medium (heading). Nunca 600+.
- Cantos arredondados em containers. Border sutil (0.5px).
- Espaçamento consistente. Escala de spacing definida pelo vertex.

### Padrões específicos (fruto — cada vertex define)

O vertex cria seu `design-system.md` definindo:
- Fonte (família, pesos, escala)
- Hex values de cada token (superfícies, texto, accent, status)
- Componentes (card, chip, input, button, section label) com classes/tokens
- Spacing scale (xs/sm/md/lg/xl)
- Border radius default
- Qualquer token adicional

**Referência:** ATOM.md §Quadrado Fundação 1.

### Regra
Pra criar o design system de um vertex novo: copie o `design-system.md` de um vertex existente, mude os frutos (fonte, hex, componentes), mantenha as sementes (módulos, estágios, rituais, superfícies, princípios).

---

## 10 — Camada 7: Bocas (Netzach)

### Domínio
4 connectors universais. As bocas do sistema operacional. Por onde a vida entra no sistema.

### As 4 bocas

| Boca | O que faz | Pilar |
|------|-----------|-------|
| Captura manual | Humano digita no AtomInput → inbox | Action |
| Email | Gmail sync → emails viram items | Action |
| Calendar | Google Calendar sync → eventos viram items | Time |
| Agent | Filesystem scan → arquivos classificados viram items | Action |

### Padrões de UX obrigatórios

**10.1 Painel de conectores**
- Tela acessível de Settings ou menu
- Lista de conectores disponíveis com status visual:
  - ● Conectado (verde)
  - ○ Desconectado (cinza)
  - ⚠ Erro (amber)
- Cada conector: ícone + nome + status + botão conectar/desconectar
- OAuth flow inline (não redireciona pra outra aba se possível)

**10.2 Inbox unificado**
- Tudo que entra por qualquer boca vai pro mesmo inbox
- Tag de origem visível: `#source:gmail`, `#source:calendar`, `#source:agent`, `#source:manual`
- A pessoa não precisa saber por qual boca entrou — o item é um item

**10.3 Sync indicators**
- Último sync: timestamp discreto no painel
- Sync em andamento: spinner sutil no ícone do conector
- Falha de sync: toast com erro legível + retry automático 1x

### Componentes

| Componente | Padrão |
|------------|--------|
| Connector card | bg-card, ícone + nome + status pill + botão ação |
| Status pill | ● Conectado (verde), ○ Desconectado (cinza), ⚠ Erro (amber) |
| Sync indicator | Timestamp discreto + spinner + toast de erro |
| Source tag | Chip small no item card indicando origem |

### Wireframe conceitual

```
┌─────────────────────────────┐
│  conectores                 │
│                             │
│  ┌───────────────────────┐  │
│  │ 📧 Gmail      ● ativo │  │
│  │ último sync: 08:30    │  │
│  └───────────────────────┘  │
│  ┌───────────────────────┐  │
│  │ 📅 Calendar   ● ativo │  │
│  │ último sync: 08:30    │  │
│  └───────────────────────┘  │
│  ┌───────────────────────┐  │
│  │ 📁 Agent      ○ off   │  │
│  │ [conectar]            │  │
│  └───────────────────────┘  │
│  ┌───────────────────────┐  │
│  │ ✏️ Manual      ● ativo │  │
│  │ sempre disponível     │  │
│  └───────────────────────┘  │
└─────────────────────────────┘
```

---

## 11 — Camada 8: Olhos (Hod)

### Domínio
Views universais. As maneiras de olhar pros items. Cada view é um padrão reutilizável que todo vertex herda.

### As views

| View | O que mostra | Padrão |
|------|-------------|--------|
| Library | Items organizados por type | Grid/lista com filtro por type, agrupado |
| Search | Busca + filtros | Barra de texto + filtros progressivos (CommandPalette) |
| Pipeline | Items por estágio | 7 colunas/faixas (ver camada 5) |
| Graph | Connections entre items | Nós + edges, zoom/pan, filtro por módulo |
| Projects | Items agrupados por project | Cards de projeto com progress, items filhos |
| Calendar view | Items com due_date/recurrence | Calendário mensal/semanal com items como eventos |
| Email view | Items vindos do Gmail | Lista estilo inbox com sender, subject, classificação |

### Padrões de UX por view

**11.1 Library**
- Agrupado por type (seções colapsáveis)
- Filtro por módulo (chips horizontais, scrolláveis)
- Cada item: card compacto com título + type chip + module cor
- Tap = expandir detalhes
- Camada simples: lista por type. Camada explora: filtros de módulo. Camada power: search dentro de library.

**11.2 Search**
- Barra simples no topo — digita e encontra
- CommandPalette (Cmd+K ou gesto): revela filtros avançados
- Prefixos: `state:`, `stage:`, `type:`, `mod:`, `tag:`, `#who:`
- Resultados: lista de items com highlight no match
- Camada simples: texto livre. Camada explora: prefixos. Camada power: composição de filtros.

**11.3 Graph**
- Nós = items (forma = stage, cor = module)
- Edges = connections (tipo de relação como label ou cor)
- Zoom/pan com pinch
- Filtro por módulo (mostrar/esconder módulos)
- Tap no nó = expandir detalhes
- Camada simples: grafo completo. Camada explora: filtros. Camada power: navegação por edge type.

**11.4 Projects**
- Cards de projeto com:
  - Título + status (active/paused/completed)
  - Progress bar (auto ou manual)
  - Contagem de items filhos por estágio
  - Stage bar mini
- Tap = abre lista de items do projeto
- Items filhos herdam as regras de item card (camada 4)

**11.5 Calendar view**
- Mensal como default, semanal como alternativa
- Items com due_date aparecem no dia correspondente
- Items com recurrence aparecem em todos os dias da regra
- Ritual slots visíveis como blocos coloridos (aurora/zênite/crepúsculo)
- Camada simples: mensal. Camada explora: semanal. Camada power: filtro por módulo/type.

### Componentes

| Componente | Padrão |
|------------|--------|
| View header | Título da view + ícone + filtro pills |
| Filter chips | Horizontais, scrolláveis, seleção múltipla |
| Graph node | Círculo/forma com cor module, tamanho proporcional a connections |
| Graph edge | Linha entre nós, cor/dash por relation type |
| Project card | bg-card, título + status pill + progress bar + stage bar mini |
| Calendar cell | Dia do mês, items como chips compactos dentro |

---

## 12 — Camada 9: Home (Yesod) — VERTEX

### Domínio
A home page do vertex. O dashboard. Onde tudo converge. **Cada vertex define o que mostrar.**

### Padrão universal (estrutura)
A Home sempre segue a mesma sequência vertical:
1. **Emotion** — soul check-in (se aurora) ou shift visual (se crepúsculo)
2. **Action** — captura (AtomInput) + items do dia
3. **Time** — contexto temporal (wrap pendente, próximos eventos, ritual slot)
4. **Audit** — saúde do sistema (inbox count, below floor, stale)

A ordem pode variar por vertex, mas os 4 blocos existem.

### Implementação por vertex (exemplos)

**MindRoot (V1 — indivíduo):**
| Bloco | Conteúdo |
|-------|----------|
| Emotion | Soul card (aurora/crepúsculo). Saudação contextual. |
| Action | AtomInput + items recentes + sugestões de triage |
| Time | Stage bar + wrap reminder (17h) + próximos eventos |
| Audit | Inbox count + below floor + stale items |

**Constellation (V2 — empresa):**
| Bloco | Conteúdo |
|-------|----------|
| Emotion | Health score da empresa (NPS, engagement, cultura) |
| Action | Diagnóstico ativo + actions pendentes |
| Time | Timeline do projeto + milestones |
| Audit | Gaps identificados + progresso do diagnóstico |

### Regra
O tom visual da Home muda por período (camada 4, seção 7.3). Aurora: quente, silencioso. Zênite: neutro, operacional. Crepúsculo: frio, reflexivo. A pessoa sente o período sem olhar a hora.

### Wireframe conceitual (genérico)

```
┌─────────────────────────────┐
│  [period icon] saudação     │
│                             │
│  ┌─ EMOTION ──────────────┐ │
│  │ [soul check-in card]   │ │
│  └────────────────────────┘ │
│                             │
│  ┌─ ACTION ───────────────┐ │
│  │ [AtomInput]            │ │
│  │ [items do dia]         │ │
│  │ [sugestões triage]     │ │
│  └────────────────────────┘ │
│                             │
│  ┌─ TIME ─────────────────┐ │
│  │ [stage bar]            │ │
│  │ [próximos eventos]     │ │
│  │ [wrap reminder]        │ │
│  └────────────────────────┘ │
│                             │
│  ┌─ AUDIT ────────────────┐ │
│  │ inbox: 3 · floor: 1   │ │
│  │ stale: 2 (>7d)        │ │
│  └────────────────────────┘ │
│                             │
│ [Home] [Search] [Cal] [Mail]│
└─────────────────────────────┘
```

---

## 13 — Camada 10: Features (Malkuth) — VERTEX

### Domínio
Módulos específicos do vertex. O que diferencia um vertex do outro. Features que vivem só naquele contexto.

### Padrão universal
Toda feature do vertex:
- É acessível da Home ou do BottomNav
- Segue o design system do vertex (camada 6)
- Consome items do Engine (não cria schema paralelo)
- Tem empty state (camada 2)
- Respeita progressive disclosure (camada 3, princípio governante)

### Features por vertex (exemplos)

**MindRoot (V1):**
| Feature | O que faz |
|---------|-----------|
| Raiz | Inventário dos 9 domínios. Onboarding + feature permanente. |
| Wrap stepper | 7 passos do ritual de commit. Animação geométrica no final. |
| Companion | AI contextual. Conversa com base nos items. (Futuro — UI oculta, código preservado.) |
| Analytics | 3 tabs: pipeline health, soul patterns, connection graph. |

**Constellation (V2):**
| Feature | O que faz |
|---------|-----------|
| Factory | Configurador de OS pra clientes. Seleciona módulos, bocas, views. |
| Diagnóstico wizard | Questionário estruturado → gaps → plano de ação. |
| Client portal | Dashboard por cliente com progresso e health score. |
| Report generator | PDF/DOCX com ATOM ENVELOPE, exportável. |

### Regra
Feature nova nasce como spec (type: spec, module: work) no atom-engine-core, com connection ao pilar de origem. Sem spec, sem feature. Sem connection ao pilar, sem contexto.

---

## 14 — Navigation (BottomNav)

O BottomNav é o frame que conecta as camadas 8-10 na experiência real.

### Padrão universal
- Máximo 4-5 items no BottomNav
- Home é sempre o primeiro
- Os outros slots são as views mais usadas do vertex

### Implementação por vertex

**MindRoot:** Home | Search | Calendar | Analytics (4 slots)
**Constellation:** Home | Clients | Diagnóstico | Reports (4 slots)

### Regra
- Nenhuma view entra no BottomNav até o pilar de origem estar verificado end-to-end
- Library, Graph, Settings, Raiz → acessíveis via menu, não via BottomNav
- Wrap → botão flutuante ou acesso via Home, não via BottomNav

---

## 15 — Wrap (ritual transversal)

O wrap não pertence a uma camada — ele corta todas. É o ritual de commit que fecha o dia.

### Padrão universal

**Stepper de 7 passos** (espelha os 7 estágios):

| Passo | Conteúdo | Obrigatório? |
|-------|----------|-------------|
| 1. Created | Items criados na sessão | Auto-preenchido |
| 2. Items | Modificados + decididos | Auto-preenchido |
| 3. Connections | Connections criadas | Auto-preenchido |
| 4. Seeds | Entropia — items inativos | Só se houver |
| 5. Soul | Emoção crepúsculo + shift | Opcional |
| 6. Audit | Inbox count, floor, orphans, stale | Automático |
| 7. Commit | Confirma + NEXT obrigatório | Obrigatório |

**Animação de commit:**
As 7 geometrias aparecem uma a uma: · → — → △ → □ → ⬠ → ⬡ → ○. Cada forma com timing escalonado e spring animation. Quando o ○ aparece, "wrap completo" faz fade in.

### Wireframe conceitual (passo 7)

```
┌─────────────────────────────┐
│                             │
│    ·                        │
│    · —                      │
│    · — △                    │
│    · — △ □                  │
│    · — △ □ ⬠                │
│    · — △ □ ⬠ ⬡              │
│    · — △ □ ⬠ ⬡ ○            │
│                             │
│       wrap completo ○       │
│                             │
│  NEXT:                      │
│  ┌─────────────────────┐    │
│  │ [próximo passo]      │    │
│  └─────────────────────┘    │
│                             │
│  [commitar]                 │
└─────────────────────────────┘
```

---

## 16 — Error handling (transversal)

Erros não pertencem a uma camada — aparecem em todas.

### Padrão universal

| Situação | UX |
|----------|-----|
| Triage falha | Item fica no inbox. Toast: "classificação indisponível." Non-blocking. |
| Supabase falha | Toast com erro legível. Retry 1x. Se falha: toast persistente. |
| Captura falha | NUNCA perder texto. Salvar local. Retry quando online. |
| Wrap falha | NUNCA perder wrap. Salvar draft. Retry. |
| Edge function falha | Fallback manual. Toast: "modo offline." |
| Conector falha | Status ⚠ no painel. Toast com erro + botão retry. |

### Regras de toast
- Texto nunca sai do container
- Max-width definido
- Word-break ativo
- Padding consistente
- Ação inline (retry, dismiss) quando aplicável

---

## 17 — Checklist de validação

Antes de um vertex ir pro ar, toda camada passa por esta checklist.

### Camadas Engine (2-8)
- [ ] Login funciona (email + OAuth)?
- [ ] Onboarding percorre os 9 domínios?
- [ ] Empty states existem em todas as telas vazias?
- [ ] AtomInput captura e envia pro inbox?
- [ ] Auto-triage classifica com 3 faixas visuais?
- [ ] Soul check-in funciona na aurora e no crepúsculo?
- [ ] Item cards mostram type + module + stage corretamente?
- [ ] Tom da interface muda por período (aurora/zênite/crepúsculo)?
- [ ] Pipeline view mostra 7 estágios com contagem?
- [ ] Stage bar renderiza corretamente?
- [ ] Transições visuais entre estágios funcionam?
- [ ] Floor alerts aparecem em items abaixo do piso?
- [ ] Design system tem dark mode funcional?
- [ ] Cores de módulo e estágio estão corretas?
- [ ] Painel de conectores mostra status?
- [ ] Views universais (library, search, graph) funcionam?
- [ ] Wrap stepper percorre 7 passos?
- [ ] Animação de commit funciona?
- [ ] Toasts de erro aparecem sem overflow?

### Camadas Vertex (9-10)
- [ ] Home tem os 4 blocos (Emotion, Action, Time, Audit)?
- [ ] Tom visual muda por período?
- [ ] BottomNav tem ≤5 slots?
- [ ] Cada feature tem spec com connection ao pilar?
- [ ] Cada feature tem empty state?
- [ ] Progressive disclosure aplicado (simples→explora→power)?

### Cross-check
- [ ] Sobrepondo este vertex com qualquer outro, as ÚNICAS diferenças são: camadas 9-10, hex values, fonte, features?
- [ ] O design-system.md do vertex existe e está completo?
- [ ] Mobile testado em 360×800?

---

## 18 — Protocolo de criação de vertex novo

Quando um novo vertex do Pentágono começa:

1. **Crie a pasta** no atom-engine-core: `[vertex]/`
2. **Copie o design-system.md** de um vertex existente → ajuste frutos
3. **Percorra as 10 camadas** deste documento, de cima pra baixo
4. **Para cada camada Engine (2-8):** herde os componentes, ajuste o conteúdo
5. **Para as camadas Vertex (9-10):** defina a Home e as features
6. **Rode a checklist** (seção 17)
7. **Commite o roadmap** seguindo o PHI template v3.0

### Regra
O vertex novo não reinventa nenhuma camada Engine. Ele herda. Se precisa mudar algo na camada Engine, é porque o Engine precisa evoluir — e a mudança vai pro Genesis, não pro vertex.

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 07 Abr 2026 | Documento inaugural. 10 camadas mapeadas às sefirot. Padrões de UX, componentes e wireframes conceituais por camada. Progressive disclosure como princípio governante. Wrap como ritual transversal. Checklist de validação. Protocolo de criação de vertex. |

---

*A Árvore da Vida não foi adicionada ao design — emergiu dele.*
*Cada camada contém todas as anteriores.*
*De dentro pra fora. Das raízes à copa.*
