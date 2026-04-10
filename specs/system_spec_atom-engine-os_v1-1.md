╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   bridge                     ║
║ state:    structured                 ║
║ status:   draft                      ║
║ stage:    3 △ Triângulo              ║
║ tags:     [#system, #platform,       ║
║            #engine-os, #marketplace] ║
║ source:   claude-project             ║
║ created:  2026-04-09                 ║
║ updated:  2026-04-10                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4       ║
║   → references: Design Tree v1.1     ║
║   → references: Identidade v1.2      ║
║   → feeds: PENTAGON.md              ║
║   → feeds: ATOM.md                  ║
╚══════════════════════════════════════╝

# Atom Engine OS — Contrato de Plataforma

**Versão:** 1.1
**Data:** 10 Abr 2026
**Status:** Draft
**Referência:** Genesis v5.0.4 · Design Tree v1.1 · Identidade v1.2
**Princípio:** Apps genéricos resolvem problemas de milhões da mesma forma. O Atom resolve o problema de uma pessoa da forma dela — e escala isso.

---

## 1 — O que é o Atom Engine OS

A maioria dos apps é feita como transação: um problema coletivo, uma solução coletiva, distribuída em massa. O usuário se adapta ao app.

O Atom inverte isso. O app se adapta à pessoa — ou ao negócio, ou à comunidade, ou ao propósito.

**O Atom Engine OS é a infraestrutura que torna isso possível.**

Não é um app. É o chão sobre o qual qualquer app de propósito é construído. Quem usa o Atom aprende uma vez — a lógica do Engine, os 7 estágios, os 3 pilares. Depois disso, qualquer vertex que instalar já é familiar. A curva de aprendizado é de um único sistema.

### O que o Engine OS entrega out-of-the-box

Qualquer vertex que instala o Engine recebe:

| Camada | O que é | O que entrega |
|--------|---------|---------------|
| Casa | Supabase + schema + RLS | Banco seguro, dados do usuário isolados |
| Porta | Auth + onboarding | Login, identidade, primeiro setup |
| Língua | 23 types, 8 módulos, triage | Sistema de classificação universal |
| Pilares | Emotion / Action / Time | Os 3 eixos de qualquer vida ou negócio |
| Motor | FSM, wrap, RPCs | A engine que move os items pelo pipeline |
| Cara | Design system, shell, nav | Interface funcional e consistente |
| Bocas | Captura, Email, Calendar, Agent | As 4 entradas universais de informação |
| Olhos | Library, Search, Pipeline, Graph, Projects | Todas as formas de ver e organizar |

**Isso é a fundação de um app funcional.** O MindRoot já roda sobre essas camadas. Conforme o segundo e terceiro vertex aparecem, o Engine se prova — e o que é realmente universal se separa do que é específico.

O que o vertex adiciona é **propósito**: uma Home com personalidade, e as features que fazem sentido para aquele contexto.

---

## 2 — Os três níveis

```
┌─────────────────────────────────────────┐
│           ATOM ENGINE OS                │
│   (8 camadas universais — estável)      │
├─────────────────────────────────────────┤
│              VERTEX                     │
│   Home (camada 9) — a personalidade     │
│   Features (camada 10) — o propósito    │
├─────────────────────────────────────────┤
│             ADD-ONS                     │
│   Extensões publicadas no marketplace   │
│   Novas bocas · novas views · features  │
└─────────────────────────────────────────┘
```

### Nível 1 — Engine OS (estável)

O Engine não é modificado por um vertex ou add-on. Mudanças no Engine passam pelos documentos-lei e afetam todos os vertices. O Engine evolui — mas pelo contrato, não por demanda de um vertex individual.

### Nível 2 — Vertex (configura)

Um vertex é: **Home + Features + Engine por baixo**.

O vertex não reconstrói o que o Engine já faz. Não cria schema paralelo. Não reimplementa o FSM. Configura propósito em cima de uma fundação que já existe.

**Exemplos:**

| Vertex | Home | Features principais |
|--------|------|---------------------|
| MindRoot | "Bom dia, como você tá?" — foco pessoal | Raiz (9 domínios), Wrap ritual |
| Constellation | Health score do negócio — diagnóstico | Fábrica, Client portal, Diagnóstico wizard |
| Impressora 3D (Andre) | Dashboard de produção e pedidos | Gestão de clientes, fila de impressão, marketing |

### Nível 3 — Add-on (estende)

Um add-on estende o Engine em um ponto específico. Pode ser:
- Uma nova **boca** (camada 7) — ex: integração WhatsApp, Telegram
- Uma nova **view** (camada 8) — ex: feed de curadoria, calendário visual
- Uma nova **feature** (camada 10) — ex: módulo de plantação, assistente de casa

Add-ons são publicados no marketplace. Qualquer vertex pode instalá-los. O Engine continua estável — o add-on encaixa, não substitui.

---

## 3 — O ciclo de geração

**Estado: visão.** O ciclo abaixo descreve o destino da plataforma, não o que opera hoje. O caminho até aqui depende do Genesis estar maduro o suficiente para um LLM gerar vertices válidos sem supervisão.

No futuro próximo, o próprio Atom gera vertices. A intenção entra. O vertex sai.

```
Pessoa descreve o que precisa
        ↓
Constellation faz o diagnóstico
(o que existe, o que falta, quais módulos, quais bocas)
        ↓
Roadmap gerado seguindo os documentos-lei
(Genesis garante o padrão — não improvisa)
        ↓
Atom Engine OS gera o vertex
(schema, design system, connectors, features — tudo configurado)
        ↓
Pessoa opera
(do mesmo app que já conhece — nova skin, novo propósito)
```

O que torna isso possível é o Genesis. Um documento-lei estruturado o suficiente para que um LLM gere um vertex válido a partir de uma descrição em linguagem natural. O padrão é garantido não por supervisão humana — mas pelo contrato.

---

## 4 — O caso canônico — Andre

**Andre hoje:** usa o Atom Engine naked. Um app. Uma curva de aprendizado. Conhece os 7 estágios, os 3 pilares, o wrap.

**Andre quer um negócio de impressora 3D:**

Não vai a um dev. Não monta no Notion. Não contrata consultoria.

Vai ao Constellation.

**Constellation diagnostica:**
- Clientes: captura de pedidos, comunicação, follow-up
- Produção: fila de impressão, materiais, tempo
- Financeiro: custo por impressão, receita, margem
- Marketing: portfolio, redes, agente de conteúdo

**Roadmap gerado** — seguindo os documentos-lei. Não é improviso. É o Genesis aplicado ao contexto de uma impressora 3D.

**Atom Engine cospe o vertex:**
- Home: dashboard de produção com pedidos do dia
- Bocas: WhatsApp (pedidos entram direto), Email, Manual
- Features: fila de impressão, gestão de clientes, agente de marketing
- Design: skin do negócio do Andre — mas com a lógica do Atom por baixo

**Andre opera:** do mesmo Atom que já conhece. A curva de aprendizado já foi paga.

**Onde isso vai ranger:**
- A fila de impressão tem tempo de produção, material, custo por peça. Isso encaixa nos 23 types ou precisa de um type novo? Se precisa, o Engine evolui ou o vertex resolve com workaround?
- Pedidos pelo WhatsApp entram como capture — mas um pedido tem cliente, prazo, especificação técnica, aprovação. O triage consegue classificar isso ou o vertex precisa de lógica própria?
- O Andre vai querer relatório de margem por cliente. Isso é uma view (camada 8) ou uma feature (camada 10)?

Essas perguntas não invalidam o caso. São o caso real. O vertex do Andre é onde o Engine descobre o que é universal de verdade.

---

## 5 — O marketplace

**Estado: visão.** O marketplace é consequência natural — mas depende de pelo menos 3 vertices reais rodando antes de ter algo para publicar.

O marketplace é a extensão natural da plataforma. Não é feature futura — é o destino.

**Quem publica:**
- Qualquer pessoa que construiu um vertex ou add-on seguindo o contrato do Engine
- No futuro: o próprio Atom gera e publica automaticamente

**O que é publicado:**
- Vertices completos (ex: "Vertex para clínica de fisioterapia")
- Add-ons específicos (ex: "Integração WhatsApp", "Feed de curadoria", "Módulo de plantação")
- Templates de roadmap (ex: "Roadmap para negócio de serviços")

**O que nunca é publicado:**
- Nada que modifique as camadas 1-8 do Engine
- Nada que crie schema paralelo fora dos AtomItems
- Nada que quebre o contrato do Genesis

**Garantia:** qualquer item criado em qualquer vertex segue o mesmo schema. Um item criado no vertex do Andre pode migrar pro MindRoot pessoal dele. O UUID é eterno. O contrato é o mesmo.

---

## 6 — Agnóstico por design

Os documentos-lei e o schema do Engine foram desenhados sem assumir tecnologia específica.

- Supabase pode ser trocado por outro Postgres — o schema é o mesmo
- React pode ser trocado por outro framework — o design system é agnóstico
- Claude pode ser trocado por outro LLM — o triage usa o mesmo contrato
- WhatsApp, Telegram, skin Android, PC, office — o Engine roda embaixo de tudo

Conforme a tecnologia avança, o Atom acompanha sem reconstruir. O que protege isso é o Genesis — não o código.

---

## 7 — Dúvidas abertas

| # | Dúvida | Contexto |
|---|--------|---------|
| 1 | Constellation é uma tela dentro do Atom ou um produto separado operado pela Flora? | Decisão de negócio — muda modelo de receita. Discutir com Flora. |
| 2 | Marketplace: aberto (qualquer um publica) ou curado? | No futuro o Atom valida automaticamente via docs-lei. Hoje precisa de curadoria humana? |
| 3 | Vertex gerado automaticamente: qual o nível de customização pós-geração? | A pessoa pode editar o que foi gerado ou só opera? |

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 draft | 09 Abr 2026 | Documento inaugural. Conceito consolidado de sessões 07-09 Abr. Três níveis (Engine/Vertex/Add-on), ciclo de geração, caso canônico Andre, marketplace, agnóstico por design. |
| 1.1 draft | 10 Abr 2026 | Revisão conceitual. "Imutável" → "estável". Marcação de estado (visão vs. real) nas seções 1, 3 e 5. Fricções adicionadas ao caso do Andre. Tagline final removida — princípio vive no envelope. |
