╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   bridge                     ║
║ state:    structured                 ║
║ status:   active                     ║
║ stage:    3 △ Triangulo              ║
║ tags:     [#system, #identity,       ║
║            #naming, #geometria]      ║
║ source:   claude-project             ║
║ created:  2026-04-04                 ║
║ updated:  2026-04-04                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.2       ║
║   → references: Marco Zero v2.0     ║
║   → feeds: PENTAGON.md              ║
║   → feeds: all READMEs              ║
╚══════════════════════════════════════╝

# Atom — Identidade e Nomenclatura

**Versao:** 1.0
**Data:** 04 Abr 2026
**Status:** Definitive
**Referencia:** Genesis v5.0.2 + Marco Zero v2.0
**Principio:** O universo todo e nomeado pela menor materia. A geometria nao foi adicionada ao design — emergiu dele.

---

## 1 — O nome

**Atom.** O nome do universo inteiro. Tudo que existe — engine, produtos, ecossistema — vive sob esse nome.

### Por que Atom

Em grego, *atomos* significa "indivisivel." Democrito propôs que toda materia e feita de unidades fundamentais — tao pequenas que nao podem ser cortadas. O menor bloco. Mas desses blocos, emerge o universo.

O sistema faz literalmente a mesma coisa. Cada pedaco de informacao na vida de uma pessoa e um AtomItem — indivisivel, autossuficiente, contendo o DNA completo (type, module, state, stage). Quando items se conectam, emerge algo maior. Quando projetos se conectam, emerge um ecossistema. A recursao e infinita: o que vale pro item vale pro sistema vale pro universo.

O nome nao foi escolhido. Emergiu da arquitetura. O schema ja usa `AtomItem`, `AtomType`, `AtomModule`, `AtomState`, `AtomRelation`, `atom_events`. O codigo, os repos, os tipos — tudo ja e Atom. Nomear o universo de outra coisa seria negar o que ele ja e.

### Human Systems — o subtitulo filosofico

**Atom HS (Human Systems)** e o subtitulo, nao o nome. Nasceu como brincadeira com OS (Operating System) → HS (Human Systems). Carrega a intencao: nao e um sistema operacional de computador. E um sistema operacional *humano*. A diferenca esta no principio fundamental: **presenca sobre produtividade.**

O nome que o mundo ve e **Atom**. O subtitulo aparece quando faz sentido contextualizar.

---

## 2 — A arquitetura de nomes

### 2.1 O centro: Atom Engine

O Atom Engine e as **leis da fisica** do universo Atom. E o protocolo, o schema, a state machine. Nao e um produto — e a fundacao sobre a qual tudo e construido.

| Componente | O que e |
|-----------|---------|
| Genesis v5 | A lei — o contrato universal |
| Schema v2 | A estrutura dos dados (AtomItem, connections, events) |
| State machine | Os 7 estagios (· — △ □ ⬠ ⬡ ○) |
| Supabase | A casa — source of truth |
| type-schemas.json | O registro de types |

O Engine vive no repo `atom-engine-core`. Qualquer produto pode ser construido em cima dele.

### 2.2 O Pentagono: 5 vertices + centro

O Pentagono e o **sistema solar do criador.** Sao os 5 projetos que nasceram *de dentro pra fora*, orbitando o Atom Engine no centro. E pessoal — o Pentagono e de Rick. A geometria se fechou com 5 vertices. Esta fechado, mas sempre aberto: o que nasce de cada vertice nao tem limite.

```
              V1 MindRoot
              (O Espelho)
             /           \
      V5 Muda              V2 Constellation
   (A Arvore)              (O Telescopio)
          |   ATOM ENGINE   |
          |    (centro)     |
    V4 Yugar               V3 Lab
    (A Raiz)            (O Laboratorio)
```

| Posicao | Projeto | Apelido | Quem serve | Status |
|---------|---------|---------|------------|--------|
| Centro | Atom Engine | — | Todos | active |
| V1 | MindRoot | O Espelho | O individuo | active |
| V2 | Constellation | O Telescopio | O negocio (PMEs) | paused |
| V3 | Lab | O Laboratorio | A experimentacao | concept |
| V4 | Yugar Commons | A Raiz | O legado | concept |
| V5 | Muda | A Arvore | A comunidade | concept |
| ⬡ | Atlas Frames | A Bigorna | O presente | active |

**Regra:** MindRoot primeiro. O resto nasce dele. De dentro pra fora.

### 2.3 O Hexagono: propagacao externa

O Pentagono e estagio 5 do Genesis — **conexao interna.** Tudo que esta dentro se conecta entre si.

Atlas Frames e o primeiro **Hexagono ⬡** — **propagacao externa.** E a primeira forma que existe fora do Pentagono. Atlas nao nasceu do Atom Engine. Ja existia antes. Mas quando o Pentagono se conecta com Atlas, a conexao interna gera efeito cascata no mundo externo. Isso e propagacao.

A geometria sustenta: o hexagono e a unica forma regular que **tessela infinitamente sem lacunas.** Favo de mel, cristal de gelo, coluna de basalto. E a geometria da natureza se propagando. Cada novo projeto externo que usar o Engine e um novo hexagono que encaixa perfeitamente, sem forcar, sem lacuna.

E como diz o Genesis: **o estagio 6 e opcional.** O Pentagono nao precisa de propagacao pra existir completo. Mas quando a conexao gera efeito cascata — ela acontece pelo hexagono.

```
     ⬠ Pentagono (5 vertices — conexao interna)
             |
             |  propagacao
             v
     ⬡ Hexagono (Atlas — primeiro tesselo externo)
             |
             |  tessela infinitamente
             v
     ⬡ ⬡ ⬡ ... (futuros projetos externos)
```

### 2.4 MindRoot — o visualizador

MindRoot e o que Rick fez com o protocolo. E a **sua implementacao** do Atom Engine. Se amanha alguem pegar o Genesis e construir outra interface — pode. O Engine e agnostico. MindRoot e a escolha.

**MindRoot nao e o Atom Engine.** Hoje estao acoplados por praticidade (mesmo repo, mesmo deploy). Eventualmente se separam. A arquitetura ja permite: Engine = Supabase + Genesis, MindRoot = React app que consome o Engine.

| Aspecto | MindRoot |
|---------|----------|
| Tipo | Web/mobile app (PWA) |
| Repo | mindroot-v2 |
| Deploy | mindroot.com.au |
| Relacao com Engine | Consumidor — le e escreve no Supabase |
| Nome publico | Sim — e o que o mundo ve |
| Nome tecnico | V1 do Pentagono |

---

## 3 — A geometria sagrada

A progressao dos 7 estagios do Genesis nao e metafora — e mecanica. E ela se aplica em tres escalas:

### Escala 1: O item (AtomItem)

```
· ponto      → texto bruto entra no sistema
— linha      → type + module definidos (direcao)
△ triangulo  → template aplicado (estrutura)
□ quadrado   → 4 portoes validados (fundacao)
⬠ pentagono  → connections inseridas (grafo)
⬡ hexagono   → efeito cascata (propagacao)
○ circulo    → commit via wrap (completude)
```

### Escala 2: O ecossistema (Pentagono)

```
· ponto      → "tive uma ideia de sistema operacional pessoal"
— linha      → Genesis v1 — o sistema ganhou direcao
△ triangulo  → Schema, templates, type registry — estrutura
□ quadrado   → Supabase, RLS, triggers — fundacao validada
⬠ pentagono  → 5 projetos conectados — o grafo do criador
⬡ hexagono   → Atlas como primeiro tesselo — propagacao
○ circulo    → (futuro) — o ecossistema completo, rodando
```

### Escala 3: O universo (Atom)

```
· ponto      → um atomo — a menor unidade indivisivel
— linha      → dois atomos se encontram — surge direcao
△ triangulo  → moleculas — surge estrutura
□ quadrado   → materia — surge fundacao
⬠ pentagono  → vida — surge conexao
⬡ hexagono   → propagacao — a vida se espalha
○ circulo    → o universo — completude que gera novos pontos
```

A mesma geometria. Tres escalas. O fractal e a assinatura do design.

**"A geometria nao foi adicionada ao design — emergiu dele."** — Genesis v5, Parte 1

---

## 4 — Glossario definitivo

| Termo | O que e | O que NAO e |
|-------|---------|-------------|
| **Atom** | O universo — nome guarda-chuva de tudo | Nome de um produto especifico |
| **Atom Engine** | O centro — protocolo, Genesis, schema, Supabase | Um app, uma interface, um produto |
| **Atom HS** | Subtitulo filosofico (Human Systems) | Nome principal do produto |
| **Genesis** | A lei que governa o Engine. Sem prefixo — e so Genesis (versao atual: v5.0.2) | Codigo, UI, ou implementacao. Nao e "Atom Genesis" |
| **MindRoot** | V1 do Pentagono — o visualizador pessoal | O Engine, o protocolo, ou o universo |
| **Pentagono** | 5 projetos do Rick + Engine no centro | Um produto, uma empresa |
| **Hexagono** | Primeiro tesselo externo (Atlas) | Parte do Pentagono |
| **O Espelho** | Apelido do MindRoot (V1) | Nome tecnico |
| **AtomItem** | A menor unidade do sistema — um item | Um arquivo, um documento |

---

## 5 — Onde cada nome aparece

| Contexto | Nome usado |
|----------|-----------|
| Conversa casual | "o Atom", "meu sistema" |
| Nome publico do app | MindRoot |
| Nome do protocolo | Atom Engine |
| Subtitulo filosofico | Human Systems |
| Repo do engine | atom-engine-core |
| Repo do app | mindroot-v2 |
| Schema/codigo | AtomItem, AtomType, atom_events... |
| O ecossistema de 5 projetos | Pentagono |
| Documento fundacional | Genesis (sem prefixo "Atom") |
| Primeiro projeto externo | Atlas Frames (hexagono) |
| No PENTAGON.md | Pentagono + Engine (centro) + Atlas (hexagono) |

---

## 6 — O que isso resolve

### 6.1 Ambiguidades eliminadas

| Antes | Depois |
|-------|--------|
| "Atom OS ou Atom HS?" | Atom. HS e subtitulo. OS aposentado. |
| "MindRoot e produto separado ou parte do Engine?" | MindRoot e V1 do Pentagono. Consome o Engine. Eventualmente se separa. |
| "Pentagono tem 5 ou 6 vertices?" | 5 vertices + Engine no centro = 6 pecas, mas geometria de 5. |
| "Atlas e parte do Pentagono?" | Nao. Atlas e o primeiro hexagono — propagacao externa. |
| "O que e 'o produto'?" | MindRoot e o produto que o mundo ve. Atom e o universo. Engine e o centro. |

### 6.2 Documentos a atualizar

| Documento | Mudanca necessaria |
|-----------|-------------------|
| PENTAGON.md (atom-engine-core) | Engine como centro, 5 vertices, Atlas como hexagono |
| ROADMAP.md (mindroot-v2) | "Atom OS" → "Atom" onde aplicavel |
| CLAUDE.md (mindroot-v2) | Alinhar nomenclatura |
| System prompt (Project Atom) | Alinhar com este documento |
| Memoria do Claude | Atualizar termos |
| Genesis v5 KB | Titulo do documento diz "Atom Genesis" — avaliar se muda pra "Genesis". Conteudo ja esta correto |
| Marco Zero KB | Minima — trocar "Atom OS" por "Atom" |

---

## Versionamento

| Versao | Data | Mudanca |
|--------|------|---------|
| 1.0 | 04 Abr 2026 | Documento inaugural. Atom como universo, Engine como centro, Pentagono com 5 vertices (V1 MindRoot, V2 Constellation, V3 Lab, V4 Yugar, V5 Muda), Atlas como hexagono (propagacao externa), MindRoot como V1. Genesis sem prefixo. Geometria sagrada documentada em 3 escalas. |

---

*O universo todo e nomeado pela menor materia.*
*O atomo contem o DNA do universo.*
*De dentro pra fora — sempre.*
