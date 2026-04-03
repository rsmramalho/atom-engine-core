---
title: "Yugar Vision Doc — A Propriedade como Organismo"
type: spec
module: purpose
state: classified
status: draft
genesis_stage: 2
tags: [yugar, infrastructure, corp-shield, ai-local, library, mindroot, muda, community, vision]
source: claude-project
created: 2026-04-02
updated: 2026-04-02
connections:
  - target: spec_atom-genesis-v5-schema-v2
    relation: references
  - target: spec_marco-zero_v2-0
    relation: references
  - target: project_mindroot
    relation: references
  - target: project_yugar
    relation: belongs_to
  - target: project_constellation-os
    relation: feeds
  - target: project_muda
    relation: feeds
---

# Yugar OS — Sistema Operacional da Propriedade

## De infraestrutura a organismo. Do digital ao chão. De dentro pra fora.

**Versão:** 0.1 (working doc)
**Data:** 02 Abr 2026
**Status:** Draft — consolidação do brainstorm de arquitetura completa
**Origem:** Sessão sobre soberania digital → "como seria uma infra com AI local, controlar o input e distribuir?"
**Princípio:** Corp como escudo. Supabase como casa. MindRoot como porta. A propriedade como organismo vivo.

---

## 1 — Visão

### 1.1 O que é

O Yugar OS é o sistema operacional do Yugar — 20.66ha em Mount Samson, QLD — que unifica infraestrutura digital, inteligência artificial, espaço físico e vida comunitária num único organismo coerente.

Não é smart home. Não é automação residencial. É uma propriedade que se auto-organiza com o Atom Engine como protocolo, o MindRoot como interface, a IA como co-gestora, e o espaço físico como plataforma de valor.

### 1.2 Relação com o Genesis

O Yugar OS é **consumidor** do Genesis, não parte dele. O Genesis define o schema universal (7 estágios, state machine, types, modules, pisos). O Yugar OS usa esse schema pra organizar tudo — de um email recebido até o nível do tanque de água. Se o Genesis mudar, o Yugar OS se adapta. Se o Yugar OS evoluir, o Genesis permanece intacto.

Mesma relação que o MindRoot tem com o Genesis: usa o contrato, não vive dentro dele.

### 1.3 O princípio fundamental

> "O plano é a junção de AI de forma positiva para gerar mudança e lembrarmos da nossa humanidade, enquanto nos adaptamos ao nosso novo lugar na hierarquia das espécies."

O Yugar OS é a materialização desse princípio. A tecnologia cuida da complexidade. O humano cuida da presença. A propriedade é o espaço onde os dois coexistem.

### 1.4 Filosofia de soberania

Três camadas de soberania, nenhuma negociável:

1. **Soberania de infraestrutura** — Corps como escudos descartáveis. Dados dormem em casa.
2. **Soberania de inteligência** — Nenhum motor de IA é insubstituível. Claude + local = resiliência.
3. **Soberania de atenção** — Feed curado, finito, sem algoritmo de engajamento. A mente é protegida.

---

## 2 — As 6 Camadas

O Yugar OS opera em 6 camadas concêntricas, do mundo externo ao chão da propriedade. Cada camada tem uma função, um princípio, e componentes substituíveis.

### Resumo

| # | Camada | Função | Princípio |
|---|--------|--------|-----------|
| 0 | Mundo externo | Origem de inputs | Não controlável |
| 1 | Corp Shield | Perímetro de segurança | Escudo descartável |
| 2 | Inteligência | Classificação e roteamento | Motor substituível |
| 3 | Casa (Supabase) | Source of truth | Uma fonte, múltiplas views |
| 4 | MindRoot | Interface contextual | Simplicidade como produto |
| 5 | Espaço físico | Rede, telas, sensores | Propriedade como plataforma |
| 6 | Vida | Horta, energia, comunidade | O sistema encontra o chão |

---

## 3 — Camada 1: Corp Shield

### 3.1 Conceito

As grandes corporações (Google, Cloudflare, etc.) cuidam do perímetro — spam, deliverability, segurança de transporte, DDoS, certificados SSL. Elas são boas nisso. Têm centenas de engenheiros fazendo isso 24/7.

O Yugar OS usa esse perímetro sem entregar o que importa: os dados. O dado passa pelo escudo mas dorme em casa (Supabase). O escudo é peça de reposição — se a corp fizer algo inaceitável, troca o escudo sem impacto interno.

### 3.2 Componentes

| Serviço | Corp atual | Função | Plano B |
|---------|-----------|--------|---------|
| Email pessoal | Gmail (r@ramalho.au) | Recebe/envia, filtra spam | Fastmail, Proton, Migadu |
| Email Atlas | Gmail (rick@atlasframes) | Operacional Atlas | Fastmail, Zoho |
| DNS + SSL | Cloudflare | Resolução, proteção, certs | Route53, deSEC |
| Auth | Google Auth (2FA) | Autenticação segura | Authelia (self-hosted) |
| Identidade | Domínio ramalho.au | Portabilidade total | Domínio é seu — nunca muda |

### 3.3 Fluxo de email (entrada)

```
Email chega no Gmail
  → IA local faz polling (a cada 5 min)
  → Classifica: task? recommendation? ruído?
  → Se relevante → INSERT no Supabase (AtomItem, estágio 1)
  → Inbox do MindRoot mostra
  → Rick decide no wrap
  → Gmail fica com a casca (arquivo de transporte)
```

### 3.4 Fluxo de email (saída)

```
Rick compõe no MindRoot (ou Claude)
  → Sistema envia via Gmail API
  → Email sai com @ramalho.au
  → Destinatário nunca sabe da infra por trás
```

### 3.5 Regra de ouro

**O domínio é seu. O escudo é alugado.** Se o Gmail morrer amanhã: muda o MX record do ramalho.au pro novo provider. Reconfigura o worker de polling. Zero dados perdidos. Zero impacto no Supabase.

---

## 4 — Camada 2: Inteligência (AI Resiliente)

### 4.1 Conceito

Dois motores de IA operando em paralelo com a mesma interface. Nenhum é insubstituível. O MindRoot fala com uma abstração — quem responde atrás pode ser Claude, Llama, Mistral, ou o que vier.

Lei 1 do Genesis: "O schema é o contrato, não o código." O motor de IA é consumidor do schema.

### 4.2 Divisão de responsabilidades

| Função | Motor primário (Claude) | Motor local (Ollama) |
|--------|------------------------|---------------------|
| Triage alta confiança (≥90%) | — | ✓ (custo zero, 24/7) |
| Triage ambígua (<90%) | ✓ | — |
| Sessões profundas | ✓ | — |
| Wrap + Soul Layer | ✓ (nuance emocional) | — |
| Polling de email | — | ✓ (cron, sempre rodando) |
| Resumo de artigos/RSS | — | ✓ (volume alto, custo zero) |
| Indexação e busca | — | ✓ |
| Voz → texto (Whisper) | — | ✓ (local, privado) |
| Desenvolvimento (Claude Code) | ✓ | — |
| Análise complexa | ✓ | — |

### 4.3 Fallback automático

```
MindRoot envia request
  → Tenta motor primário (Claude API)
  → Se timeout / erro / offline → fallback pro Ollama local
  → Se Ollama offline → queue local, processa quando voltar
  → Nenhum request se perde
```

### 4.4 Hardware da IA local

| Componente | Spec | Custo AUD |
|------------|------|-----------|
| Mac Mini M4 | 24GB unified memory | ~$1.000 |
| SSD externo | 1TB pra modelos | ~$100 |
| **Total** | | **~$1.100** |

Software (tudo grátis): Ollama + Llama 3.1 8B (triage) + Qwen 2.5 7B (resumos) + Whisper (voz).

Consumo: ~15W idle. ~$3-5/mês de eletricidade.

### 4.5 Abstração de interface

```typescript
interface AtomAI {
  classify(input: string): Promise<TriageResult>;
  summarize(content: string): Promise<string>;
  transcribe(audio: Blob): Promise<string>;
  chat(messages: Message[]): Promise<Response>;
}

// Implementações intercambiáveis:
class ClaudeProvider implements AtomAI { ... }
class OllamaProvider implements AtomAI { ... }

// Router decide qual usar:
class AIRouter implements AtomAI {
  classify(input) {
    if (confidence >= 0.90) return this.ollama.classify(input);
    return this.claude.classify(input);
  }
}
```

Desenvolvimento estimado: ~1 dia.

---

## 5 — Camada 3: A Casa (Source of Truth)

### 5.1 Conceito

Supabase é a casa. Onde tudo nasce, vive, matura, conecta, morre. Os 7 estágios do Genesis operam aqui. O schema v2 é o contrato. Nada é duplicado. Nada precisa de sync.

Definido na spec `genesis-v5-architecture_v0-1`. Esta seção apenas confirma que o Yugar OS consome a casa sem alterá-la.

### 5.2 O que vive no Supabase

- `items` — todo AtomItem (tasks, recipes, recommendations, wraps, sensores, manutenção, trocas)
- `item_connections` — grafo de relações tipadas
- `atom_events` — cascata de propagação
- `type_schemas` — templates por type
- RLS — permissões por user role (rick, family, visitor)

### 5.3 Novos types introduzidos pelo Yugar OS

| Type | Module | Piso | Uso |
|------|--------|------|-----|
| resource (existente) | mod-purpose | 2 | Sensores, equipamentos, espaços, ferramentas |
| task (existente) | mod-purpose | 3 | Manutenção, colheita, reparos |
| habit (existente) | mod-purpose | 3 | Irrigação diária, check de tanque, limpeza solar |
| recommendation (existente) | mod-body | 2 | Receitas da horta, filmes, conteúdo curado |
| project (existente) | mod-purpose | 5 | Construção de building, instalação de sistema |

Nenhum type novo é necessário. O Genesis já cobre todos os casos. Novos items usam types existentes com tags semânticas pra contexto (`#yugar`, `#commons`, `#farm`, `#energy`, `#maintenance`).

---

## 6 — Camada 4: MindRoot (Interface Contextual)

### 6.1 Conceito

Uma app. Views diferentes por building + usuário + hora do dia. O MindRoot detecta contexto e renderiza a interface certa sem configuração manual.

### 6.2 Detecção de contexto

| Sinal | Como detecta | O que muda |
|-------|-------------|------------|
| Building | Device ID (hostname do Raspberry Pi ou MAC address) | View default da tela |
| Usuário | PIN rápido, NFC tag, ou Bluetooth proximity | Nível de acesso (RLS) |
| Hora do dia | Relógio do sistema | Aurora / Zênite / Crepúsculo |
| Modo | Seleção manual ou inferência | Construir / Planejar / Operar / Captura |

### 6.3 Views por building

**Lab (privado — só Rick)**
- Aurora: "bom dia" + Soul check-in + foco do dia + inbox count
- Cockpit completo: tasks, wrap, audit, pipeline, graph
- Library Feed: artigos, podcasts, conteúdo curado
- Claude: acesso direto ao Project Atom

**Casa (família)**
- Meal plan da semana (receitas conectadas à horta)
- Chores do dia (quem faz o quê)
- Calendar da família (eventos, school, compromissos)
- Library: filmes e séries curados — feed finito, sem infinite scroll
- Captura rápida: botão grande pra família capturar ideias/pedidos

**Workshop (Rick + colaboradores)**
- Tasks ativas do projeto em foco
- Projetos Atlas Frames em execução
- Captura por voz (mãos sujas → botão físico + Whisper local)
- Ferramentas em uso / manutenção pendente

**Commons (público — visitantes)**
- Agenda de eventos e workshops
- Amenidades disponíveis (academia, cozinha, espaço de co-criação)
- Horários e regras do espaço
- Serviços dos profissionais residentes (PT, chef, permaculturista)
- Contato e localização
- **Zero dados privados. Nenhum. Jamais.**

### 6.4 Kiosk mode

Cada touchscreen roda MindRoot como PWA fullscreen:
- Sem barra de navegação, sem desktop, sem notificações do sistema
- Tela liga → MindRoot aparece → view contextual carrega
- Idle screen (quando ninguém interage): relógio + status do dia + geometria do Raiz
- Wake: toque na tela ou proximidade (sensor PIR opcional)
- Auto-update: PWA atualiza silenciosamente. Zero manutenção.

### 6.5 Permissões (RLS)

| Role | Acesso | Buildings |
|------|--------|-----------|
| `rick` | Tudo. Todos os modules, items, connections, wraps, soul | Todos |
| `family` | mod-family, mod-body (meal plan, chores, calendar, library) | Casa, Commons |
| `collaborator` | Tasks atribuídas, projetos compartilhados, captura | Workshop, Commons |
| `visitor` | Items com tag `#commons` apenas | Commons |

Implementação: Supabase RLS policies por role. Já suportado nativamente.

---

## 7 — Camada 5: Espaço Físico

### 7.1 Rede

| Segmento | Tecnologia | Distância | Custo AUD |
|----------|-----------|-----------|-----------|
| Lab → Switch central | Ethernet Cat6 | 0m (co-locado) | — |
| Switch → Casa | Ethernet Cat6 enterrado | ~20-50m | ~$80 |
| Switch → Workshop | Ethernet Cat6 enterrado | ~50-100m | ~$120 |
| Switch → Commons | PtP wireless (Ubiquiti) | ~100-300m | ~$200 |
| AP Wi-Fi por building | UniFi AP (3x) | Local | ~$450 |
| Switch central | UniFi 8-port PoE | Lab | ~$200 |
| **Total rede** | | | **~$1.050-1.500** |

**VLANs:**
- VLAN 1 (Management) — switch, APs, server. Isolada.
- VLAN 10 (Private) — Lab, Casa, Workshop. Acesso ao Supabase completo.
- VLAN 20 (Commons) — só internet + endpoint do MindRoot (role visitor). Sem acesso à rede interna.
- VLAN 30 (IoT) — sensores, cameras. Isolada. Comunica só com o server via API.

### 7.2 Hardware por building

| Building | Tela | Compute | Custo AUD |
|----------|------|---------|-----------|
| Lab | 27" touch (mesa) | Mac Mini M4 (é o server) | ~$600 (monitor) |
| Casa | 15" touch (parede cozinha) | Raspberry Pi 5 + case | ~$500 |
| Workshop | 15" touch (parede) | Raspberry Pi 5 + case | ~$400 |
| Commons | 21-27" touch (entrada) | Raspberry Pi 5 + case | ~$600 |
| **Total telas** | | | **~$2.100** |

**Raspberry Pi 5 config:**
- OS: Raspberry Pi OS Lite (64-bit)
- Browser: Chromium em kiosk mode
- Boot: auto-start MindRoot PWA
- Power: ~5W. Fanless. Silencioso.
- Manutenção: zero (auto-update via PWA + unattended-upgrades no OS)

### 7.3 Sensores (IoT — fase futura)

| Sensor | Função | Hardware | Custo AUD |
|--------|--------|----------|-----------|
| Tanque de água | Nível | Ultrasonic sensor + ESP32 | ~$30 |
| Consumo solar | Produção/consumo | Shelly EM | ~$50 |
| Irrigação | Flow + controle | Solenoid + flow sensor + ESP32 | ~$40 |
| Clima local | Temp, umidade, chuva | Weather station (Ecowitt) | ~$120 |
| Solo | Umidade do solo (horta) | Capacitive sensor + ESP32 | ~$20/cada |
| Presença | Wake de tela | PIR sensor | ~$10/building |

Dados de sensores entram como AtomItems type:resource com extensions JSONB pra readings. A IA local processa, detecta anomalias, gera tasks de manutenção.

### 7.4 Custo total de hardware

| Categoria | Custo AUD |
|-----------|-----------|
| Server (Mac Mini M4 24GB) | ~$1.100 |
| Rede (switch, APs, PtP, cabos) | ~$1.300 |
| Telas touch (4 buildings) | ~$2.100 |
| Sensores (fase 1) | ~$300 |
| Misc (suportes, cabos, crimps) | ~$300 |
| **Total hardware** | **~$5.100** |

### 7.5 Custo mensal recorrente

| Serviço | Custo AUD/mês |
|---------|---------------|
| Supabase Pro | ~$25 |
| Claude API (uso moderado) | ~$15-30 |
| Eletricidade (server + telas + rede) | ~$10 |
| Domínios (anualizado) | ~$5 |
| Cloudflare | $0 |
| Ollama / software local | $0 |
| **Total mensal** | **~$55-70** |

---

## 8 — Camada 6: A Vida

### 8.1 Conceito

A IA não só organiza dados. Ela co-gere a propriedade. Cada elemento físico do Yugar é um AtomItem com ciclo de vida, connections, e manutenção. O Genesis processa tudo — de um email do cliente até o nível do tanque de água.

### 8.2 Horta e pomar

**Input:** Clima (API BOM, grátis) + umidade do solo (sensor) + calendário subtropical QLD + histórico de plantio (AtomItems anteriores).

**O que a IA faz:**
- Sugere plantio sazonal: "Abril em QLD subtropical → plantar ervilha, alface, beterraba"
- Monitora maturação: "Tomate cherry plantado há 68 dias → pronto pra colher"
- Conecta com meal plan: "Colheita de manjericão → receita de pesto disponível"
- Gera tasks de cuidado: "Sem chuva há 5 dias, solo a 22% → irrigar zona 2"
- Registra histórico: cada plantio → AtomItem com connections pra colheita, receita, e próxima temporada

**Ciclo Genesis:** Semente plantada (·) → Planta classificada (—) → Cuidado estruturado (△) → Produção validada (□) → Receita conectada (⬠) → Refeição servida (○) → Seed pro próximo plantio (entropia → ·).

### 8.3 Energia e água

**Sensores:** Shelly EM (solar) + ultrasonic (tanque) + flow sensor (irrigação).

**O que a IA faz:**
- Dashboard no touchscreen da casa: produção solar hoje, consumo, balanço
- Alertas: "Tanque abaixo de 30% — sem previsão de chuva em 5 dias"
- Padrões: "Consumo de água subiu 40% essa semana — verificar vazamento?"
- Manutenção: "Painéis solares sem limpeza há 90 dias — agendar?"
- Otimização: "Irrigação automática às 5h quando solo < 35% e sem previsão de chuva"

### 8.4 Manutenção da propriedade

Cada building, cerca, ferramenta, equipamento é um AtomItem type:resource com extensions:

```json
{
  "category": "building",
  "location": "workshop",
  "last_maintenance": "2026-02-15",
  "maintenance_cycle_days": 90,
  "condition": "good"
}
```

**Audit automático no wrap:** "Motor da bomba: 87/90 dias desde última revisão. Cerca norte: pintura vence em 12 dias. Filtro de água: trocar."

Nada quebra por esquecimento. O sistema lembra. O humano decide quando agir.

### 8.5 IA como co-gestora diária

**Aurora (5h):**
"Bom dia. Previsão: sol forte, máx 32°C. Tanque em 68%. Colheita de tomate pronta — quer mover pro meal plan de hoje? Cerca norte vence em 5 dias."

**Zênite:**
"Email da Atlas — cliente pediu orçamento. Classifiquei como task urgente. Workshop: serra circular tem 3 meses sem revisão."

**Crepúsculo:**
"Wrap do dia: 4 tasks completadas, colheita registrada, consumo solar 14.2kWh (acima da média). Irrigação zona 2 executada às 5h. Como tá saindo?"

---

## 9 — Library Feed (Soberania de Atenção)

### 9.1 O problema

Algoritmos de engagement otimizam pra tempo de tela, não pra valor. Netflix mostra o que te mantém scrollando. YouTube recomenda o que te mantém assistindo. Spotify não curadoria — manipula. O Library Feed é o inverso.

### 9.2 Conceito

Um feed que só contém o que você escolheu seguir, curado pelo seu próprio sistema, sem algoritmo de engajamento. Finito. Quando acabou, acabou. Vai viver.

### 9.3 Fontes de ingestão

| Fonte | Método de captura | Custo |
|-------|------------------|-------|
| Blogs / sites | RSS (Miniflux self-hosted ou polling) | $0 |
| Newsletters | Alias de email (library@ramalho.au → Gmail → pipeline) | $0 |
| Podcasts | RSS nativo do podcast | $0 |
| YouTube (canais selecionados) | RSS do canal (cada canal tem feed RSS) | $0 |
| Filmes / séries | TMDB API + captura manual | $0 |
| Livros | Open Library API + captura manual | $0 |
| Recomendações de pessoas | Captura via MindRoot ("Flora recomendou X") | $0 |

### 9.4 Pipeline

```
Fontes externas (RSS, newsletters, APIs)
  → IA local (polling horário + resumo + classificação)
  → Supabase (AtomItems type:article / podcast / recommendation)
  → MindRoot — Library View
    → Filtro por módulo / pessoa / contexto / projeto ativo
    → "Flora recomendou" (#who:flora)
    → "Conecta com projeto X" (connection → projeto)
    → Feed finito. Sem infinite scroll.
    → Item consumido → wrap registra → seed ou archive
```

### 9.5 Regras de curadoria

- "Desse canal, quero tudo" → polling integral
- "Dessa newsletter, só o que menciona IA" → filtro por keyword (IA local)
- "Dessa pessoa, qualquer recomendação" → tag `#who:pessoa`, todas entram
- "Limite: 10 items por dia" → cap diário. Excedente vai pra fila, não pra tela

### 9.6 Library na cozinha

O touchscreen da cozinha mostra Library de filmes e séries. A família vê: "3 filmes novos essa semana." Cada um com nota de quem recomendou, gênero, e por que é relevante. Escolheu assistir? Registra. Assistiu? Rating. Não gostou? Archive. Adorou? Seed pra "mais do mesmo diretor."

O Netflix está a um click de distância. Mas o Library Feed está na parede da cozinha, curado por gente de confiança, sem manipulação. A escolha é do humano.

### 9.7 Desenvolvimento estimado

| Componente | Esforço |
|------------|---------|
| RSS polling worker (Edge Function ou cron) | 2-3 dias |
| Resumo + classificação via IA local | 2 dias |
| Library View no MindRoot | 1 semana |
| Regras de curadoria (filtros) | 3-4 dias |
| TMDB integration (filmes/séries) | 1-2 dias |
| **Total** | **~3 semanas** |

---

## 10 — Economia de Troca (Muda Viva)

### 10.1 Conceito

O Yugar não é uma fazenda com tecnologia. É uma **plataforma viva** onde espaço gera valor e valor circula sem depender só de dinheiro. Profissionais usam as amenidades em troca de serviço. Cada profissional traz seus clientes. Cada cliente é um potencial novo nó na rede.

### 10.2 Amenidades e trocas

| Amenidade | Profissional | Troca | Clientes trazidos |
|-----------|-------------|-------|-------------------|
| Academia | Personal Trainer | Treino pra Rick/família em troca de uso do espaço | PT atende clientes no Yugar |
| Cozinha comunitária | Chef / nutricionista | Aulas + meal planning em troca de uso | Alunos vêm pro Yugar |
| Workshop | Maker / artesão | Builds + manutenção em troca de ferramentas | Clientes buscam peças |
| Horta / pomar | Permaculturista | Cuidado em troca de parte da produção | Workshops pagos no Commons |
| Sala de sessões | Terapeuta / coach | Sessões em troca de uso do espaço | Clientes vêm pro ambiente |
| Espaço de co-criação | Freelancer / designer | Trabalho visual pros projetos em troca de uso | Networking orgânico |

### 10.3 O que o profissional ganha

- Espaço sem aluguel, sem overhead
- Internet, eletricidade, water — inclusos
- Scheduling via MindRoot (agenda no Commons)
- Visibilidade orgânica (clientes de outros profissionais cruzam)
- Comunidade — não é coworking isolado, é ecossistema

### 10.4 O que o Yugar ganha

- Serviços de qualidade sem custo financeiro direto
- Fluxo de pessoas que conhecem o espaço
- Validação do modelo (cada profissional é um case de Muda)
- Manutenção distribuída (o maker cuida do workshop, o permaculturista cuida da horta)
- Diversidade de competências no ecossistema

### 10.5 Rastreabilidade no Atom Engine

Cada troca é um AtomItem type:resource, module:mod-bridge:

```json
{
  "title": "Troca: PT João — academia",
  "type": "resource",
  "module": "mod-bridge",
  "tags": ["#yugar", "#commons", "#troca", "#who:joao"],
  "extensions": {
    "professional": "João Silva",
    "amenity": "academia",
    "exchange": "Treino Rick/família (ter+qui) ↔ uso academia (seg/qua/sex)",
    "clients_per_week": 12,
    "started": "2026-05-01",
    "review_cycle_days": 90
  }
}
```

Connections: troca → amenidade (academia), troca → profissional (João), troca → beneficiário (Rick), troca → projeto (Muda).

No wrap: "João treinou Rick terça e quinta. 12 clientes atendidos essa semana na academia." Audit trimestral: "Troca com João ativa há 90 dias. Review?"

### 10.6 Touchscreen do Commons

O visitante / cliente chega e vê:

```
╔═══════════════════════════════════════╗
║  YUGAR COMMONS                        ║
║                                       ║
║  Hoje                                 ║
║  09:00  Academia — João (PT)          ║
║  14:00  Workshop cerâmica — Ana       ║
║  16:00  Livre                         ║
║                                       ║
║  Amenidades                           ║
║  🏋 Academia    🍳 Cozinha             ║
║  🔧 Workshop    🌱 Horta              ║
║                                       ║
║  Próximo evento                       ║
║  Sáb 14h — Compostagem com Ana        ║
║                                       ║
║  Wi-Fi: yugar-commons / senha: [qr]   ║
╚═══════════════════════════════════════╝
```

Limpo. Sem app pra baixar. Sem cadastro. Chega, olha, entende.

### 10.7 Isso é Muda

Cada profissional que opera no Yugar é um micro-empreendedor sem o peso do overhead. O Yugar é a incubadora que não parece incubadora. Não tem edital, não tem pitch night, não tem demo day. Tem um espaço, um handshake, e um sistema que registra e cuida.

Quando a Constellation for ensinar outros proprietários a fazer o mesmo, a prova é: "vem no Yugar, vê com seus olhos."

---

## 11 — Build & Stay (Economia de Contribuição)

### 11.1 Conceito

O Build & Stay não é um programa de construção de cabanas. É uma **economia de contribuição universal** do ecossistema Yugar. Qualquer projeto na propriedade — cabana de Airbnb, shed da Atlas, cerca, cozinha comunitária, instalação solar, deck do Commons — aceita contribuição. Cada hora de trabalho gera pontos no mesmo pool. A pessoa se envolve no nível que quiser, com o que quiser, quando quiser.

Não é voluntariado. Não é mutirão. É um **modelo de equity baseado em contribuição** onde cada hora de trabalho gera participação real no que foi construído — e retorno proporcional em noites, serviços, ou receita.

### 11.2 O princípio

A propriedade tem projetos. Pessoas têm skills e tempo. O dinheiro é só uma das formas de troca — e frequentemente a menos eficiente. Um carpinteiro que cobra $60/h em Brisbane pode "investir" 40 horas no Yugar e receber algo que dinheiro não compra: pertencimento, noites no paraíso, fatia de receita, e uma comunidade que ele ajudou a construir com as próprias mãos.

O sistema registra tudo. A celebração é parte do processo. Churrasco e cerveja não são extras — são o tecido social que faz o modelo funcionar.

### 11.3 Projetos que aceitam contribuição

| Projeto | Tipo | Retorno pra contribuidor |
|---------|------|-------------------------|
| Cabana Airbnb | Construção + acabamento | Noites/ano + share da receita Airbnb |
| Shed Atlas Lab | Construção industrial | Noites/ano + crédito de serviço |
| Cozinha comunitária | Build + instalação | Noites/ano + uso do espaço |
| Deck / área social Commons | Construção + paisagismo | Noites/ano |
| Cerca / infraestrutura | Manutenção pesada | Noites/ano |
| Instalação solar / água | Elétrica + encanamento | Noites/ano + crédito de serviço |
| Horta / pomar | Permacultura + plantio | Noites/ano + parte da produção |
| Manutenção geral | Pintura, limpeza, reparos | Noites proporcionais |

Cada projeto é um AtomItem type:project no Supabase. Contribuições são AtomItems type:resource conectados ao projeto. O MindRoot mostra tudo: progresso, contribuidores, horas, pontos.

### 11.4 Como funciona na prática

**O carpinteiro** vem por 2 semanas. Trabalha na cabana de manhã, no shed da Atlas à tarde. 80 horas totais. Ganha pontos nos dois projetos. Sexta à noite: churrasco, cerveja, fogueira. Ele conhece o encanador, o permaculturista, o designer. Volta em outubro pra usar suas noites com a família.

**O encanador** vem pra um fim de semana. Instala toda a hidráulica da cozinha comunitária. 16 horas. Ganha noites e uso futuro da cozinha. No sábado à noite, já tá planejando voltar pra fazer a hidráulica da próxima cabana.

**A família sem trade skill** vem por uma semana. Pais pintam, limpam, ajudam no paisagismo. Filhos participam do que podem. Mãe cozinha pro grupo toda noite. Todo mundo ganha pontos. No fim do ano, a família tem um fim de semana no Yugar — num lugar que ajudaram a construir.

**O designer remoto** quer um lugar pra trabalhar por 2 semanas. Não tem skill de construção. Propõe: faz toda a identidade visual do Commons + materiais pro Airbnb em troca de estadia durante o período + noites futuras. Aceito. Contribuição registrada como "trade especializado" (design = skill de mercado).

**A pessoa que nunca imaginou** ter acesso a um lugar assim. Chega num sábado de build week aberta. Ajuda no que pode. Ganha suas primeiras noites. Volta. Se envolve mais. No fim do ano, tem uma semana inteira no paraíso — construída com as próprias mãos.

### 11.5 O pool universal de pontos

Todos os projetos alimentam o mesmo pool de pontos do contribuidor. Os pontos são a moeda interna do ecossistema Yugar.

**Pesos por tipo de contribuição:**

| Tipo | Peso por hora | Exemplo | Lógica |
|------|--------------|---------|--------|
| Trade especializado | 1.5x | Carpintaria, elétrica, encanamento, design, dev | Skill que custaria $50-80/h no mercado |
| Trade geral | 1.0x | Pintura, acabamento, instalação, jardinagem | Skill que custaria $30-50/h |
| Trabalho geral | 0.7x | Limpeza, paisagismo, carga, organização | Contribuição essencial, menor especialização |
| Suporte comunitário | 0.5x | Cozinhar pro grupo, logística, cuidar das crianças | Mantém o sistema funcionando |

**O que pontos geram:**

| Recompensa | Conversão | Exemplo |
|-----------|-----------|---------|
| Noites de estadia | ~4-5 pts = 1 noite | 60 pts (40h carpintaria) = ~14 noites/ano |
| Uso de amenidades | ~2 pts = 1 sessão | Uso da academia, cozinha, workshop |
| Share de receita | Proporcional ao total de pts no projeto | Cabana gera $30K/ano → distribuição por pts |
| Crédito de serviço | ~3 pts = 1h de serviço recebido | PT, chef, terapeuta do ecossistema |
| Produção da horta | ~1 pt = 1 cesta | Parte da colheita semanal |

A conversão exata é calibrada com a experiência. O sistema registra tudo — ajustar os rates é uma query no Supabase, não uma renegociação.

### 11.6 Equity por projeto gerador de receita

Projetos que geram receita (cabanas Airbnb, eventos pagos) têm pool de equity separado:

```
Cabana 02 — Receita Airbnb no ano: $30.000

  Yugar (terreno + gestão + materiais): 20% fixo → $6.000
  Pool contribuidores (80%): $24.000

    João (carpintaria, 60 pts)   → 24% → $5.760
    Maria (elétrica, 24 pts)     → 10% → $2.400
    Pedro (encanamento, 18 pts)  → 7%  → $1.680
    Ana (paisagismo, 20 pts)     → 8%  → $1.920
    Carlos (design, 30 pts)      → 12% → $2.880
    Grupo (96 pts total)         → 39% → $9.360
    Total: 248 pts = 100% do pool
```

**Quando uma cabana é vendida:** mesmo modelo, sobre o valor de venda. O carpinteiro que ajudou a construir recebe sua fatia. Transparente. Justo. Registrado desde o dia 1.

### 11.7 Noites como moeda

| Pontos acumulados | Noites/ano | Equivalente |
|-------------------|------------|-------------|
| 60+ pts | 14 noites | ~2 semanas |
| 30-59 pts | 7-13 noites | ~1-2 semanas |
| 15-29 pts | 3-6 noites | ~weekend a 1 semana |
| 5-14 pts | 1-2 noites | Weekend |

As noites são válidas em **qualquer cabana do Yugar**. Podem ser usadas pela família do contribuidor. Rollover: 50% do não-usado transfere pro ano seguinte (evita dívida de hospedagem impagável, mas não pune quem não pôde vir).

### 11.8 O ciclo

```
Projeto anunciado (Commons + rede de contribuidores)
  → Pessoas escolhem se envolver (skill, tempo, nível)
  → MindRoot agenda: quem vem, que skill traz, que fase
  → Build week: trabalho + celebração (churrasco + cerveja)
  → IA registra contribuições (horas × peso × skill)
  → AtomItems criados pra cada contribuição
  → Wrap semanal: progresso + contribuições + pontos
  → Projeto concluído → ativo (Airbnb, uso, etc.)
  → Receita flui → pool distribui
  → Contribuidores voltam como hóspedes / usuários
  → Ciclo Genesis: build (·) → obra (△□⬠) → pronto (○)
    → receita (entropia) → seed (novo projeto)
```

### 11.9 Rastreabilidade no Atom Engine

**O projeto:**

```json
{
  "title": "Shed Atlas Lab",
  "type": "project",
  "module": "mod-purpose",
  "tags": ["#yugar", "#build-and-stay", "#atlas", "#infrastructure"],
  "extensions": {
    "project_category": "infrastructure",
    "location": "zona industrial, lado oeste",
    "status": "em construção",
    "accepts_contributions": true,
    "revenue_generating": false,
    "total_hours": 156,
    "total_points": 218,
    "contributors_count": 9,
    "started": "2026-07-01",
    "target_completion": "2026-09-30"
  }
}
```

**O contribuidor (perfil único, persiste entre projetos):**

```json
{
  "title": "Contribuidor — João Silva",
  "type": "resource",
  "module": "mod-bridge",
  "tags": ["#yugar", "#contributor", "#who:joao"],
  "extensions": {
    "name": "João Silva",
    "skills": ["carpentry", "framing", "finishing"],
    "skill_tier": "trade_specialized",
    "total_points_lifetime": 142,
    "total_points_current_year": 60,
    "nights_earned_year": 14,
    "nights_used_year": 3,
    "nights_remaining": 11,
    "projects_contributed": ["cabana-02", "shed-atlas-lab"],
    "first_contribution": "2026-06-01",
    "member_since": "2026-06-01"
  }
}
```

**Cada contribuição (granular, conectada ao projeto E ao contribuidor):**

```json
{
  "title": "João — carpintaria — shed-atlas-lab — jul 2026",
  "type": "resource",
  "module": "mod-bridge",
  "tags": ["#yugar", "#build-and-stay", "#who:joao", "#skill:carpentry"],
  "extensions": {
    "contributor_id": "uuid-joao",
    "project_id": "uuid-shed-atlas",
    "skill_type": "trade_specialized",
    "hours": 24,
    "weight": 1.5,
    "points": 36,
    "period": "2026-07-05 — 2026-07-08",
    "notes": "Estrutura principal do shed + telhado"
  }
}
```

Connections: contribuição → projeto (contributed_to), contribuição → contribuidor (performed_by), contribuição → build-week (participated_in), contribuidor → cabana-02 (contributed_to), contribuidor → shed-atlas (contributed_to).

O grafo mostra tudo: quem contribuiu onde, quanto, quando. O MindRoot renderiza. O wrap registra. O audit verifica.

### 11.10 O aspecto legal (opções na Austrália)

| Fase | Estrutura | Quando |
|------|----------|--------|
| Fase 1 — Informal | Acordo simples entre partes. Pontos + noites como gentlemen's agreement. Registro no Atom Engine como evidência. | Primeiros 1-2 projetos, <15 contribuidores |
| Fase 2 — Cooperativa | Registrar sob *Cooperatives National Law (QLD)*. Membros, shares proporcionais, distribuição regulamentada. | 3+ projetos geradores de receita, modelo validado |
| Fase 3 — Unit Trust | Trust com units proporcionais ao pool de pontos. Flexível pra investimento externo. | Escala, múltiplas cabanas, investidores |

O Atom Engine registra tudo desde o dia 1. Cada hora, cada contribuição, cada noite usada. A transição de informal pra formal é smooth porque os dados já estão estruturados no Supabase.

### 11.11 O que isso significa

O Yugar deixa de ser uma propriedade de uma pessoa e vira um **organismo que pertence a todos que ajudaram a construí-lo**. Não no papel (o terreno é do Rick), mas na prática: quem contribuiu tem stake real, retorno real, e pertencimento real.

O carpinteiro volta com a família em dezembro e mostra pros filhos: "aquela parede ali, o pai construiu." O encanador traz os amigos: "a água quente que vocês tão usando, fui eu que instalei." A mãe que cozinhou durante a build week serve o jantar na cozinha que ela ajudou a viabilizar.

Isso não é transação. É pertencimento. E o sistema cuida de toda a complexidade pra que o humano só precise estar presente.

### 11.12 Build & Stay no MindRoot

**Dashboard geral (cockpit Rick):**
- Todos os projetos abertos pra contribuição
- Total de pontos distribuídos no ano
- Contribuidores ativos e engajamento
- Receita gerada vs distribuída
- Próximas build weeks

**View do contribuidor (acesso individual via app ou Commons):**
- Meus pontos (lifetime + ano corrente)
- Meus projetos (onde contribuí, quanto)
- Minhas noites (ganhas, usadas, disponíveis)
- Meu share de receita (projetos geradores)
- Próximas oportunidades de contribuição
- Calendário de disponibilidade das cabanas

**Commons touchscreen:**
- "3 projetos aceitando contribuição"
- "Próxima build week: 14-20 Jun — Cabana 03. Skills: acabamento, pintura, paisagismo"
- "47 pessoas já contribuíram pro Yugar. Quer participar?"
- Mural de contribuidores (opcional, se a comunidade quiser)

---

## 12 — Replicabilidade (O Pentágono Emerge)

### 12.1 Como os 5 projetos se conectam

| Projeto | Papel no Yugar OS |
|---------|-------------------|
| **Atom Engine** | Protocolo universal. O schema que tudo consome. |
| **MindRoot** | Produto. A interface que empacota a experiência. |
| **Constellation OS** | Consultoria. Ensina outros a replicar. |
| **Muda** | Incubadora. Os profissionais do Yugar são o primeiro cohort. |
| **Yugar** | Lab vivo. Prova que funciona. A demo que nenhum pitch substitui. |

### 12.2 O que é replicável

- O schema (Atom Engine) é protocolo aberto — qualquer propriedade pode usar
- O hardware é commodity (Raspberry Pi, Cat6, sensores ESP32)
- O software é uma instância do MindRoot + Supabase
- O modelo de troca é replicável em qualquer espaço com amenidades
- O Build & Stay é replicável em qualquer propriedade com espaço pra construir
- A economia de pontos funciona em qualquer escala (2 contribuidores ou 200)
- A metodologia de implementação é o serviço da Constellation

### 12.3 Template de replicação

Uma propriedade rural ou semi-rural quer o mesmo sistema:

1. Constellation faz assessment: quantos buildings, que amenidades, que necessidades
2. Instala Atom Server + rede + touchscreens
3. Configura MindRoot com views customizadas
4. Onboarding via Raiz: organiza a vida digital primeiro, depois expande pro físico
5. Conecta sensores relevantes (água, energia, solo)
6. Ativa economia de troca se houver amenidades
7. Ativa Build & Stay se houver terreno pra construção
8. Suporte contínuo via Constellation

Custo pra um cliente: hardware (~$5.000) + setup Constellation (~$2.000-3.000) + mensal (~$70 infra + retainer Constellation).

---

## 13 — Fases de Implementação

### 13.1 Princípio

De dentro pra fora. Geometria perfeita. Cada fase entrega valor sozinha.

### Fase 0 — Fundação digital (já feito)
- [x] Supabase deployed (3 tabelas, triggers, RLS, RPCs)
- [x] MindRoot em status de release
- [x] Genesis v5 + Marco Zero v2 documentados
- [x] Gmail operacional com domínio próprio
- [x] Cloudflare configurado

### Fase 1 — Corp Shield + AI abstraction (~2 semanas)
- [ ] Abstração de IA (interface Claude + Ollama)
- [ ] Instalar Ollama no hardware existente
- [ ] Email ingestion pipeline (Gmail → IA → Supabase)
- [ ] Testar triage local vs Claude em paralelo
- [ ] MindRoot: captura via email como fonte

### Fase 2 — Library Feed (~3 semanas)
- [ ] RSS polling worker
- [ ] Resumo + classificação via IA
- [ ] Library View no MindRoot
- [ ] TMDB integration (filmes/séries)
- [ ] Regras de curadoria

### Fase 3 — Rede física + touchscreens (~2 semanas install)
- [ ] Comprar hardware (Mac Mini, Pi5s, switch, APs, cabos)
- [ ] Instalar rede (Cat6 enterrado, PtP wireless)
- [ ] Configurar VLANs
- [ ] Setup Raspberry Pi em kiosk mode
- [ ] MindRoot: context views por building
- [ ] MindRoot: kiosk mode (PWA fullscreen)

### Fase 4 — Sensores + Life Layer (~3 semanas)
- [ ] Instalar sensores (água, solar, solo, clima)
- [ ] Pipeline IoT → Supabase (ESP32 → API → AtomItem)
- [ ] Dashboard de energia/água no MindRoot
- [ ] Manutenção como habits automáticos
- [ ] Horta: integração com calendário subtropical

### Fase 5 — Commons + Economia de Troca (~ongoing)
- [ ] Touchscreen do Commons configurado
- [ ] Agenda pública no MindRoot
- [ ] Primeiro profissional residente (PT na academia)
- [ ] Rastreabilidade de trocas como AtomItems
- [ ] Feedback loop: ajustar modelo baseado na experiência real

### Fase 6 — Build & Stay (~ongoing, após primeira cabana planejada)
- [ ] Definir estrutura legal (informal → cooperativa → trust)
- [ ] Criar projeto da primeira cabana no MindRoot
- [ ] Definir pesos de contribuição e tabela de noites
- [ ] Primeira build week → testar modelo com grupo pequeno
- [ ] Dashboard de equity no MindRoot
- [ ] View do contribuidor (horas, noites, share)
- [ ] Ativar cabana no Airbnb
- [ ] Primeira distribuição de pool
- [ ] Feedback loop: ajustar pesos e modelo

### Fase 7 — Consolidação + Constellation ready
- [ ] Documentar o setup completo como playbook
- [ ] Criar template de replicação
- [ ] Yugar como demo visitável
- [ ] Constellation oferece o serviço

---

## 14 — Decisões em Aberto

| # | Questão | Opções | Impacto |
|---|---------|--------|---------|
| 1 | Touchscreen da cozinha: tablet Android fixo ou Pi5 + tela? | A: Tablet (mais simples) / B: Pi5 (mais controle) | A = plug and play, B = uniformidade com outros buildings |
| 2 | Sensores IoT: protocolo direto HTTP ou MQTT broker? | A: ESP32 → HTTP → Supabase / B: ESP32 → MQTT → bridge → Supabase | A = mais simples, B = mais escalável |
| 3 | Commons: Wi-Fi aberto ou com captive portal? | A: Senha simples no QR / B: Captive portal com termos | A = zero fricção, B = mais controle |
| 4 | Library Feed: app separado ou view dentro do MindRoot? | A: Separado / B: View integrada | B = coerência, A = foco |
| 5 | Economia de troca: handshake informal ou contrato leve? | A: Registro no Atom + handshake / B: Template de acordo simples | A = mais leve, B = mais seguro |
| 6 | Captura por voz: Whisper local ou API? | A: Local (privado, grátis) / B: API (melhor accuracy) | A = soberania, B = qualidade |
| 7 | Ordem das fases 3 e 4: rede antes ou sensores antes? | A: Rede primeiro / B: Em paralelo | A = fundação sólida, B = mais rápido |
| 8 | Build & Stay: peso do Yugar no pool (terreno + gestão)? | A: 20% fixo / B: 15% + materiais separados / C: Variável por cabana | Impacta atratividade pra contribuidores |
| 9 | Build & Stay: noites acumulam entre anos? | A: Rollover 50% / B: Use or lose / C: Rollover total | A = equilibrado, B = simples, C = risco de dívida |
| 10 | Build & Stay: estrutura legal inicial? | A: Handshake + registro Atom / B: Acordo escrito simples / C: Cooperativa desde o início | A = mais ágil, C = mais seguro |
| 11 | Build & Stay: contribuidores podem transferir noites? | A: Só família direta / B: Qualquer pessoa / C: Não transferível | Impacta comunidade vs controle |

---

## 15 — Resumo Financeiro

### One-off (hardware)

| Item | Custo AUD |
|------|-----------|
| Atom Server (Mac Mini M4 24GB + SSD) | $1.100 |
| Rede (switch, APs, PtP, cabos, conduit) | $1.300 |
| Telas touch (4 buildings) | $2.100 |
| Sensores IoT (fase 1) | $300 |
| Miscellaneous | $300 |
| **Total** | **$5.100** |

### Mensal recorrente

| Item | Custo AUD/mês |
|------|---------------|
| Supabase Pro | $25 |
| Claude API | $15-30 |
| Eletricidade (infra) | $10 |
| Domínios (anualizado) | $5 |
| **Total** | **$55-70** |

### ROI qualitativo

- Tempo economizado em organização, lembretes, manutenção: inestimável
- Serviços recebidos via troca (PT, chef, manutenção): ~$500-1.000/mês em valor equivalente
- Validação do modelo Constellation + Muda: base do negócio futuro
- Qualidade de vida: soberania digital + atenção protegida + presença

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 0.1 | 2026-04-02 | Working doc — consolidação do brainstorm. 6 camadas, Corp Shield, AI resiliente, Library Feed, infra física, Life Layer, economia de troca, Build & Stay (economia de contribuição universal com equity, pontos, noites, e pool de receita), replicabilidade, 7 fases de implementação, custos |

---

*A ponte entre o digital e o físico não é tecnologia. É intenção.*
*O sistema cuida da complexidade. O humano cuida da presença.*
*A geometria é perfeita porque nasce de dentro pra fora.*
