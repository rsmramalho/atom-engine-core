╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   bridge                     ║
║ state:    connected                  ║
║ status:   active                     ║
║ stage:    5 ⬠ Pentagono             ║
║ tags:     [#system, #identity,       ║
║            #naming, #geometria,      ║
║            #marketplace]             ║
║ source:   claude-project             ║
║ created:  2026-04-04                 ║
║ updated:  2026-05-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4       ║
║   → references: Marco Zero v3.1     ║
║   → references: D-004                ║
║   → supersedes: v1.2                 ║
║   → feeds: PENTAGON.md              ║
║   → feeds: ATOM.md                   ║
║   → feeds: all READMEs              ║
╚══════════════════════════════════════╝

# Atom — Identidade e Nomenclatura

**Versao:** 1.3
**Data:** 08 Mai 2026
**Status:** Definitive
**Referencia:** Genesis v5.0.4 + Marco Zero v3.1 + D-004
**Principio:** O universo todo e nomeado pela menor materia. A geometria nao foi adicionada ao design — emergiu dele.

---

## 1 — O nome

**Atom.** O nome do universo inteiro. E tambem o nome do produto. Tudo que existe — engine, app, ecossistema — vive sob esse nome.

### Por que Atom

Em grego, *atomos* significa "indivisivel." Democrito propôs que toda materia e feita de unidades fundamentais — tao pequenas que nao podem ser cortadas. O menor bloco. Mas desses blocos, emerge o universo.

O sistema faz literalmente a mesma coisa. Cada pedaco de informacao na vida de uma pessoa e um AtomItem — indivisivel, autossuficiente, contendo o DNA completo (type, module, state, stage). Quando items se conectam, emerge algo maior. Quando atoms se estendem, emerge um marketplace. A recursao e infinita: o que vale pro item vale pro produto vale pro universo.

O nome nao foi escolhido. Emergiu da arquitetura. O schema ja usa `AtomItem`, `AtomType`, `AtomModule`, `AtomState`, `AtomRelation`, `atom_events`. O codigo, os repos, os tipos — tudo ja e Atom. Nomear o produto de outra coisa seria negar o que ele ja e.

### Human Systems — o subtitulo filosofico

**Atom HS (Human Systems)** e o subtitulo, nao o nome. Nasceu como brincadeira com OS (Operating System) → HS (Human Systems). Carrega a intencao: nao e um sistema operacional de computador. E um sistema operacional *humano*. A diferenca esta no principio fundamental: **presenca sobre produtividade.**

O nome que o mundo ve e **Atom**. O subtitulo aparece quando faz sentido contextualizar.

---

## 2 — A arquitetura de nomes

### 2.1 Atom — o produto

**Atom e o produto publico.** Unico, definitivo, exposto ao mundo. Nao ha "o produto Atom" e "outro produto Atom" — ha um Atom. O que esta deployado em producao e o produto. O que entra em loja, marketing, redes — e Atom.

**Atom = Engine OS Naked deployado como app.** Quando uma pessoa instala, o que ela recebe e o Engine completo (8 camadas universais), funcionando, sem ginastica de configuracao. A casa esta pronta. Ela mora.

A pessoa estende o que recebeu via **Marketplace** — instalando add-ons que adicionam features (camada 10), Home customizada (camada 9), ou tema visual. Sem add-on, o Atom ja funciona. Add-ons sao escolha.

### 2.2 Atom Engine — a fundacao interna

O Atom Engine e a **fundacao interna do produto Atom.** Sao as leis da fisica do sistema — protocolo, schema, state machine. **Nao e um produto separado.** Nao se vende, nao se distribui, nao se instala como entidade autonoma. E o que o Atom *e* por dentro.

| Componente | O que e |
|-----------|---------|
| Genesis v5 | A lei — o contrato universal |
| Schema v2 | A estrutura dos dados (AtomItem, connections, events) |
| State machine | Os 7 estagios (· — △ □ ⬠ ⬡ ○) |
| Supabase | A casa — source of truth |
| type-schemas.json | O registro de types |
| 8 camadas (Casa → Olhos) | A arquitetura interna do app |

O Engine vive no repo `atom-engine-core` como protocolo. O app que entrega o Engine empacotado vive em `mindroot-v2` (codename interno).

Em conversa publica, "Engine" raramente aparece. Em conversa tecnica/criadora, "Engine" pode ser usado para falar das tripas. Pra fora: e Atom.

### 2.3 MindRoot — codename interno

**MindRoot e codename interno do app Atom.** Nao e nome publico. Persiste em:

- Repo `mindroot-v2` (rename e acao futura, nao desta versao)
- Deploy tecnico `mindroot.com.au` (migracao de dominio e acao futura)
- Codigo fonte (referencias internas continuam validas)
- Branch canonico `master` (definido em D-003)

Onde MindRoot apareca voltado ao usuario — UI, splash, manifest, copy, marketing, redes — e Atom. O termo MindRoot some do vocabulario externo.

| Aspecto | MindRoot |
|---------|----------|
| Tipo | Web/mobile app (PWA) |
| Repo | mindroot-v2 |
| Branch canonico | master |
| Deploy tecnico | mindroot.com.au |
| Nome publico do produto entregue | **Atom** |
| Funcao do termo | codename interno, historico de dev |
| Esta visivel ao usuario? | Nao |

### 2.4 Marketplace — a estrutura natural de extensao

O **Marketplace** e a estrutura natural pela qual o Atom cresce. E onde add-ons sao publicados, descobertos e instalados.

**Add-ons** podem adicionar:
- **Features** — funcionalidade nova (camada 10)
- **Home customizada** — opcional (camada 9)
- **Tema visual** — opcional, opt-in pelo usuario

**Add-ons nao tocam camadas 1-8.** O Engine OS e imutavel. Esta e a garantia de que o Atom continua sendo Atom mesmo com qualquer combinacao de add-ons instalados.

Qualquer pessoa pode publicar add-on. O criador do Atom publica add-ons. Terceiros publicam add-ons. Empresas publicam add-ons. O modelo tem analogia clara com app stores e Notion templates — uma plataforma, infinitas extensoes.

### 2.5 Vertex, preset, add-on — o vocabulario novo

| Termo | O que e |
|-------|---------|
| **Add-on** | Unidade individual de extensao no Marketplace. Adiciona features, opcionalmente Home e tema. |
| **Preset** | Colecao curada de add-ons recomendados. Reproduz uma configuracao especifica do Atom em uma instalacao. |
| **Vertex** | Termo legado. Antes significava "app separado" (V1, V2 etc). Agora significa **configuracao + add-ons** dentro do Atom unico. |

**Vertex como conceito de "app separado" foi dissolvido em D-004.** O termo persiste apenas como referencia historica ao Pentagono original do criador.

### 2.6 Pentagono Rick — o preset pessoal do criador

O **Pentagono** e o preset pessoal do criador. E a colecao de add-ons que reproduz como Rick configura o seu Atom. Nao e estrutura de produto — e historia pessoal materializada em configuracao.

```
              V1 MindRoot
              (O Espelho)
             /           \
      V5 Muda              V2 Constellation
   (A Arvore)              (O Telescopio)
          |       ATOM       |
          |    (o produto)   |
    V4 Yugar               V3 Lab
    (A Raiz)            (O Laboratorio)
```

| Posicao | Add-on / Preset | Apelido | O que adiciona |
|---------|----------------|---------|----------------|
| V1 | (nucleo do preset) | O Espelho | Configuracao base do uso pessoal |
| V2 | Add-on Work (Constellation) | O Telescopio | Features de gestao de equipe e PMEs |
| V3 | Add-on Lab | O Laboratorio | Espaco de experimentacao |
| V4 | Add-on Yugar | A Raiz | Comunidade local, legado |
| V5 | Add-on Muda | A Arvore | Educacao, comunidade externa |

**O Pentagono Rick e instalavel.** Qualquer pessoa que queira viver como o criador instala o preset "Pentagono Rick" no Marketplace e recebe a colecao completa.

Outras pessoas montam outros pentagonos — ou hexagonos, ou triangulos, ou qualquer outra geometria. **A estrutura nao e fixa: e personalizada.** O preset e a expressao de uma vida; cada pessoa expressa a sua.

### 2.7 Hexagono — a propagacao do Marketplace

O hexagono e a unica forma regular que **tessela infinitamente sem lacunas.** Favo de mel, cristal de gelo, coluna de basalto. E a geometria da natureza se propagando.

No vocabulario antigo, o hexagono era "Atlas Frames como primeira propagacao externa." Com D-004, isso se generaliza:

**Cada add-on que entra no Marketplace e um novo hexagono que tessela o produto.** Atlas Frames, se evoluir como add-on industrial, e um hexagono. Constellation/Work e um hexagono. Add-ons de terceiros sao hexagonos. Sem lacuna, sem forcar, encaixando perfeitamente porque todos seguem o mesmo protocolo (Engine OS imutavel).

```
     ⬠ Pentagono (preset pessoal)
             |
             |  o preset esta dentro do Atom
             v
     ⬡ Marketplace (cada add-on tessela)
             |
             v
     ⬡ ⬡ ⬡ ... (tessela infinitamente)
```

A geometria nao mudou. Mudou *o que* tessela: nao sao "produtos externos" mas sim "add-ons no Marketplace de um unico produto."

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

### Escala 2: O Atom (o produto)

```
· ponto      → "tive uma ideia de sistema operacional pessoal"
— linha      → Genesis v1 — o produto ganhou direcao
△ triangulo  → Schema, templates, type registry — estrutura interna
□ quadrado   → Supabase, RLS, triggers — fundacao validada
⬠ pentagono  → 8 camadas conectadas, app deployado, Atom no ar
⬡ hexagono   → primeiros add-ons no Marketplace — propagacao
○ circulo    → (futuro) Atom como infraestrutura padrao da vida
```

### Escala 3: O Marketplace (o universal)

```
· ponto      → um Atom — uma instalacao indivisivel
— linha      → dois Atoms — surge intercambio (presets compartilhados)
△ triangulo  → primeiros add-ons curados — surge oferta
□ quadrado   → add-ons validados, sandboxed, com lifecycle — fundacao
⬠ pentagono  → ecossistema de criadores e usuarios — grafo
⬡ hexagono   → tessela infinita — Atom em qualquer vida
○ circulo    → o Atom e a vida — invisivel, presente, completo
```

A mesma geometria. Tres escalas. O fractal e a assinatura do design.

**"A geometria nao foi adicionada ao design — emergiu dele."** — Genesis v5, Parte 1

---

## 4 — Glossario definitivo

| Termo | O que e | O que NAO e |
|-------|---------|-------------|
| **Atom** | O nome do produto publico. Tambem o nome do universo (guarda-chuva). | Codename interno. Nome de uma das versoes. |
| **Atom Engine** | Fundacao interna do Atom — protocolo, Genesis, schema, state machine, 8 camadas. | Produto separado. Nao se vende, nao se distribui sozinho. |
| **Engine OS Naked** | Forma como o Engine e entregue: deployado como Atom. | "Versao basica" ou "tier free." E o produto inteiro. |
| **Atom HS** | Subtitulo filosofico (Human Systems). | Nome principal do produto. |
| **Genesis** | A lei que governa o Engine. Sem prefixo (versao atual: v5.0.4). | Codigo, UI, ou implementacao. Nao e "Atom Genesis." |
| **MindRoot** | Codename interno do app Atom. Persiste em repo, deploy tecnico, codigo. | Nome publico. Saiu do vocabulario externo em D-004. |
| **Marketplace** | Estrutura natural de extensao do Atom. Onde add-ons sao publicados e instalados. | Feature futura distante. E parte da identidade do produto. |
| **Add-on** | Unidade de extensao no Marketplace. Adiciona features (camada 10), opcionalmente Home (camada 9) e tema. Nunca toca camadas 1-8. | Plugin descartavel. App separado. |
| **Preset** | Colecao curada de add-ons recomendados. Reproduz uma configuracao no Atom de quem instala. | Tipo de licenciamento. Versao paga. |
| **Vertex** | Termo legado. Antes significava "app separado." Apos D-004, significa "configuracao + add-ons" no Atom unico. | App separado. Deploy proprio. |
| **Pentagono** | Preset pessoal do criador (Pentagono Rick). Historia materializada em configuracao. | Estrutura de produto. Arquitetura obrigatoria. |
| **Hexagono** | Forma da propagacao no Marketplace. Cada add-on tessela. | Produto separado. "Projeto externo." |
| **AtomItem** | A menor unidade do sistema — um item. | Um arquivo, um documento. |
| **O Espelho** | Apelido do nucleo do preset Pentagono Rick (V1). | Nome tecnico ou comercial. |

---

## 5 — Onde cada nome aparece

| Contexto | Nome usado |
|----------|-----------|
| Conversa casual com usuario | "o Atom", "meu Atom", "instalar Atom" |
| Nome publico do app | **Atom** |
| Subtitulo filosofico | Human Systems (Atom HS) |
| Codename interno do app | MindRoot (so internamente) |
| Nome do protocolo (interno/tecnico) | Atom Engine |
| Repo do protocolo | atom-engine-core |
| Repo do app | mindroot-v2 (codename interno) |
| Branch canonico do app | master |
| Deploy tecnico atual | mindroot.com.au (migracao futura) |
| Schema/codigo (nomes tecnicos) | AtomItem, AtomType, atom_events, item_connections |
| Estrutura de extensao | Marketplace |
| Unidade de extensao | add-on |
| Colecao de add-ons recomendados | preset (ex.: "Pentagono Rick", "Atom for Teams") |
| Documento fundacional (lei) | Genesis (sem prefixo "Atom") |
| Modelo B2B futuro | Atom for Teams |
| Configuracao pessoal do criador | Pentagono Rick |

---

## 6 — O que isso resolve

### 6.1 Ambiguidades eliminadas

| Antes | Depois |
|-------|--------|
| "Atom OS ou Atom HS?" | Atom. HS e subtitulo. OS aposentado. |
| "MindRoot e produto separado ou parte do Engine?" | MindRoot e codename interno do app. O produto publico chama Atom. |
| "Pentagono tem 5 ou 6 vertices?" | Pentagono e preset pessoal do criador. Nao e estrutura de produto. |
| "Atlas e parte do Pentagono?" | Atlas, se evoluir, vira add-on industrial no Marketplace. Nao e estrutura de produto. |
| "Constellation e produto B2B separado?" | Nao. Constellation vira add-on Work. "Atom for Teams" e o modelo B2B. |
| "O que e 'o produto'?" | **Atom.** Unico. O que o mundo ve. |
| "Como o Marketplace se relaciona com vertices?" | Vertices nao existem mais como apps separados. Tudo e add-on no Marketplace. |
| "A geometria fractal cabe em uma estrutura de N produtos?" | Nao precisa. Item → Produto unico → Marketplace infinito. Mais limpo. |

### 6.2 Documentos a atualizar (downstream desta versao)

| Documento | Mudanca necessaria |
|-----------|-------------------|
| ATOM.md (atom-engine-core) | Atom como produto unico, Marketplace como estrutura natural. |
| PENTAGON.md (atom-engine-core) | Pentagono como preset pessoal do criador, nao estrutura de produto. |
| design-system.md (mindroot-v2) | Referencias publicas a "MindRoot" → "Atom". |
| CLAUDE.md (mindroot-v2) | Alinhar nomenclatura. |
| README.md (mindroot-v2) | Alinhar nomenclatura. |
| manifest.json (mindroot-v2) | name + short_name → "Atom". |
| index.html (mindroot-v2) | Title → "Atom". |
| splash, logo, copy (mindroot-v2/src) | "MindRoot" publico → "Atom". |
| System prompt (Project Atom v2) | Alinhar com este documento. |
| Memoria do Claude | Atualizar termos. |

---

## Versionamento

| Versao | Data | Mudanca |
|--------|------|---------|
| 1.0 | 04 Abr 2026 | Documento inaugural. Atom como universo, Engine como centro, Pentagono com 5 vertices (V1 MindRoot, V2 Constellation, V3 Lab, V4 Yugar, V5 Muda), Atlas como hexagono (propagacao externa), MindRoot como V1. Genesis sem prefixo. Geometria sagrada documentada em 3 escalas. |
| 1.1 | 06 Abr 2026 | Generalizado: Pentagono como conceito universal (cada pessoa constroi o seu). MindRoot como V1 (nao como projeto pessoal). Referencias nominais removidas. |
| 1.2 | 07 Abr 2026 | Envelope atualizado: Genesis v5.0.2→v5.0.4, Marco Zero v2.0→v3.1, state structured→connected (stage 3→5) — item tem connections, state machine exige stage 5. |
| 1.3 | 08 Mai 2026 | Atom = nome publico do produto (D-004). MindRoot rebaixado a codename interno. Vertex dissolvido como app separado — vira "configuracao + add-ons." Pentagono → preset pessoal do criador. Constellation/Atlas/Yugar/Muda → add-ons/presets no Marketplace. Marketplace declarado como estrutura natural de extensao. Geometria fractal redefinida com Atom unico no centro e Marketplace tesselando infinitamente. |

---

*O universo todo e nomeado pela menor materia.*
*O atomo contem o DNA do universo.*
*De dentro pra fora — sempre.*
