---
title: "Genesis v5 — Revisão Arquitetural"
type: spec
module: bridge
state: classified
status: draft
genesis_stage: 2
tags: [atom-engine, genesis-v5, architecture, migration, raiz]
source: claude-project
created: 2026-04-01
updated: 2026-04-01
connections:
  - target: spec_atom-genesis-v4-2-schema-v2
    relation: derives
  - target: spec_marco-zero_v1-3
    relation: references
  - target: template_meta-template_v1-0
    relation: references
---

# Genesis v5 — Revisão Arquitetural
## De ponte para destino. De arquivos para dados. De dentro pra fora.

**Versão:** 0.1 (working doc)
**Data:** 01 Abr 2026
**Status:** Draft — consolidação de decisões da sessão 01 Abr 2026
**Origem:** Sessão de revisão arquitetural → "o Drive é mesmo o melhor lugar pra morar?"
**Princípio:** Uma fonte de verdade, múltiplas visualizações. Nada mais.

---

## 1 — O problema

O Genesis v4.2 foi desenhado com o Drive como source of truth na fase de ponte. Essa fase cumpriu seu papel: provou que o schema funciona, que a convenção de nomes escala, que o ATOM ENVELOPE é legível, que os templates geram items válidos. A ponte levou o sistema até aqui.

Mas a ponte virou armadilha. Os sintomas concretos:

**Duplicação estrutural.** Cada item vive em até 3 lugares: row no Supabase, Google Doc com ATOM ENVELOPE, .md mirror pro Obsidian. A pergunta "qual é a versão real?" se tornou frequente e corrosiva.

**Inteligência fora de casa.** O Drive é um filesystem. Ele não sabe o que é um estágio, um piso, uma connection, um downgrade. Toda a inteligência do Genesis (FSM, triggers, audits, pisos) precisa ser aplicada externamente — por scripts, por Claude, por chamadas MCP frágeis. O banco de dados faz tudo isso nativamente.

**Fricção de operação.** Criar um item = criar Google Doc + criar .md mirror + garantir naming + garantir pasta certa + garantir ATOM ENVELOPE atualizado. Uma operação conceitual vira 5 operações mecânicas.

**Mismatch de paradigma.** O Atom Engine é um sistema de dados estruturados com relações tipadas. O Drive é um sistema de documentos em pastas. Forçar dados a viver dentro de documentos cria gambiarras — o ATOM ENVELOPE é literalmente uma simulação de campos de banco de dados dentro de um Google Doc.

O Genesis v4.2 já previa isso. Parte 8.1 define duas fases:
- **Agora (ponte):** Drive como source of truth
- **Destino:** Supabase como source of truth, Drive como consumidor

A intuição do criador confirmou: a ponte já foi cruzada. É hora de chegar no destino.

---

## 2 — A arquitetura destino

### 2.1 Princípio central

**Uma fonte de verdade (Supabase), múltiplas visualizações (MindRoot, Drive, Obsidian, CLI).**

Nada é duplicado. Nada precisa de sync. Cada visualização é gerada sob demanda a partir da mesma fonte.

### 2.2 Nova hierarquia

| Camada | Sistema | Papel | Analogia |
|--------|---------|-------|----------|
| **Casa** | Supabase | Source of truth. Onde o item nasce, vive, matura, conecta, morre. | O banco de dados é o esqueleto |
| **Porta da frente** | MindRoot | Interface primária. Onde o usuário interage, captura, visualiza, decide. | O app é a porta |
| **Impressora** | Google Drive | Export sob demanda. Gera docs quando faz sentido (compartilhar, arquivar, ler offline). | O Drive é a impressora |
| **Raio-x** | Obsidian | Visualização de grafo sob demanda. Gerado a partir do Supabase, não mantido em sync. | O Obsidian é o raio-x |
| **Conversa** | Claude Project | Interface do criador. Planejamento, análise, sessões profundas. | O chat é a conversa |

### 2.3 O que muda concretamente

| Operação | Antes (v4.2) | Depois (v5) |
|----------|-------------|-------------|
| Criar item | Claude Code → Google Doc + .md mirror | API call → INSERT no Supabase |
| Ler item | Abrir Google Doc ou .md | MindRoot renderiza do Supabase |
| Buscar items | Navegar pastas no Drive | Query SQL + UI de busca no MindRoot |
| Connections | Texto no ATOM ENVELOPE + `[[wikilinks]]` | Rows na tabela `item_connections` |
| Audit | Claude lê docs e reporta | Views SQL rodam automaticamente |
| Wrap | Bloco de texto no Google Doc | Dados estruturados no body JSONB, renderizados como card interativo |
| Graph View | Obsidian lendo .md mirrors | MindRoot renderizando `item_connections` (ou Obsidian export sob demanda) |
| Compartilhar | Copiar link do Google Doc | "Export to Drive" gera doc com ATOM ENVELOPE |

### 2.4 O que NÃO muda

- **O schema.** AtomItem, 7 estágios, state machine, pisos, types, modules, extensions, enums — tudo permanece idêntico. O Genesis v5 não é uma revisão do schema. É uma revisão de onde o schema vive.
- **A filosofia.** Maturação permissiva, entropia como reciclagem, inbox obrigatório, documentar é executar — tudo permanece.
- **A captura.** O usuário continua despejando. O sistema continua organizando.
- **As 3 leis.** "O schema é o contrato, não o código" — agora mais verdadeiro do que nunca. Mudou onde mora, o contrato é o mesmo.
- **As 3 tabelas Supabase.** `items`, `item_connections`, `atom_events` — já deployed, já com triggers e RLS.

---

## 3 — Os 6 pontos de revisão

### 3.1 Google Drive → Export sob demanda

**Status atual:** Source of truth com ATOM ENVELOPE + naming convention + folder structure.
**Status novo:** Destino de exportação. "Print to Drive."

**O que permanece:**
- Estrutura de pastas (mod-work/, mod-body/, system/) como destino de exports
- ATOM ENVELOPE como formato de exportação — continua existindo, só não é a fonte
- Convenção de nomes para docs exportados

**O que morre:**
- Drive como lugar onde items "moram"
- .md mirrors (substituídos por export sob demanda pro Obsidian)
- Obrigatoriedade de criar Google Doc pra todo item
- Sync manual ou por script entre Drive e Supabase

**Feature no MindRoot:** botão "Export to Drive" em qualquer item no estágio 3+. Gera Google Doc com ATOM ENVELOPE na pasta correta. Opcional, não obrigatório.

### 3.2 Obsidian → Export sob demanda

**Status atual:** Graph View lendo .md mirrors no Drive.
**Status novo:** Graph View gerado a partir do Supabase quando o usuário quiser.

**Mecânica:** um comando (script ou botão no MindRoot) gera vault inteiro a partir do Supabase. YAML frontmatter + `[[wikilinks]]` — formato idêntico ao atual. Mas gerado, não mantido. Sem sync contínuo, sem conflito, sem "qual versão é a real."

**Feature no MindRoot:** o próprio MindRoot renderiza o grafo nativamente a partir de `item_connections`. Obsidian vira opcional para quem gosta da ferramenta, não parte da arquitetura.

### 3.3 Wrap → Dados estruturados

**Status atual:** Bloco de texto formatado (Genesis Part 3.4), commitado como Google Doc.
**Status novo:** AtomItem type=wrap com body JSONB estruturado.

**Estrutura do body:**

```json
{
  "created": [
    { "item_id": "uuid", "type": "task", "title": "...", "genesis_stage": 3, "destination": "mod-work/" }
  ],
  "modified": [
    { "item_id": "uuid", "field": "status", "from": "active", "to": "completed" }
  ],
  "decided": [
    "Decisão em linguagem natural"
  ],
  "connections": [
    { "source_id": "uuid", "target_id": "uuid", "relation": "belongs_to" }
  ],
  "seeds": [
    { "title": "seed extraída", "status": "approved | rejected", "new_item_id": "uuid | null" }
  ],
  "soul": {
    "aurora": { "emotion": "ansioso", "energy": "high" },
    "intention": "fechar a spec do cockpit",
    "tasks": [
      { "item_id": "uuid", "emotion_after": "aliviado" }
    ],
    "crepusculo": { "emotion": "satisfeito", "energy": "low" },
    "shift": "ansioso → satisfeito"
  },
  "audit": {
    "inbox_count": 3,
    "below_floor": [],
    "orphans": [],
    "stale_count": 0
  },
  "next": [
    "próximo passo concreto"
  ]
}
```

**Renderização:** MindRoot mostra o wrap como card interativo — clica num item do CREATED e vai direto pra ele. Timeline visual do dia. Soul como gráfico emocional. O formato texto do Genesis v4.2 continua disponível como template de exportação.

### 3.4 Convenção de nomes → Display format

**Status atual:** Regra estrutural (`mod-body_recipe_carbonara-classica` é como o item se chama e como o arquivo se chama).
**Status novo:** Formato de display e de exportação.

No Supabase, o item tem `type=recipe`, `module=body`, `title="Carbonara Clássica"` como campos separados. A naming convention se aplica quando:
- Item é exportado pro Drive (nome do Google Doc)
- Item é exportado pro Obsidian (nome do .md file)
- Item é referenciado em contexto técnico (logs, commits, CLI)

Dentro do MindRoot, o usuário vê "Carbonara Clássica" com um chip de type e cor de module. Não vê `mod-body_recipe_carbonara-classica`.

### 3.5 Templates → Type schemas no banco

**Status atual:** 14+ templates como Google Docs em `system/templates/`.
**Status novo:** Configuração no Supabase.

**Opção A — Tabela `type_schemas`:**

```sql
CREATE TABLE type_schemas (
  type atom_type PRIMARY KEY,
  floor_stage SMALLINT NOT NULL,
  default_module atom_module,
  body_schema JSONB,         -- campos específicos do type
  extensions TEXT[],          -- quais extensions o type usa
  usage_notes TEXT,           -- orientações pro agente/UI
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

O MindRoot e o triage engine consultam essa tabela diretamente. Sem parsing de documento. Sem risco de desalinhamento.

**Opção B — JSON config no repo:** `type-schemas.json` no GitHub, carregado pelo MindRoot no build. Mais simples, menos dinâmico.

**Decisão:** pode começar com B e migrar pra A quando fizer sentido. O importante é sair de documentos no Drive.

Os templates existentes no Drive viram referência histórica — o conteúdo migra pro schema centralizado.

### 3.6 Claude Project → Interface do criador (não do usuário)

**Status atual:** Interface primária pra tudo — captura, análise, wrap, audit, sessões.
**Status novo:** Interface do criador e de sessões profundas.

O Claude Project continua sendo onde Rick planeja, analisa, faz wraps, tem sessões estratégicas. Mas o MindRoot absorve as funções operacionais:
- Captura rápida → input field no MindRoot
- Triage → engine automático no MindRoot
- Wrap → flow guiado no MindRoot
- Audit → dashboard automático no MindRoot
- Graph View → visualização nativa no MindRoot

O Claude Project vira o "escritório" — trabalho profundo, decisões complexas, análise. O MindRoot vira o "cockpit" — operação diária, captura, visualização.

Para o usuário externo, o Claude Project não existe. Tudo acontece no MindRoot.

---

## 4 — Raiz: O Genesis aplicado à vida

### 4.1 O que é

Todo mundo tem gavetas. Gavetas digitais, gavetas físicas, gavetas mentais. Fotos espalhadas por 3 contas. Exames médicos em PDFs que ninguém sabe onde salvou. Documentos do carro numa pasta chamada "misc". Seis emails, quatro drives, e a sensação constante de que algo importante está se perdendo em algum lugar.

O Raiz é o Genesis aplicado à vida inteira — não só à produtividade. É o primeiro contato de qualquer pessoa com o Atom Engine. Não é "aqui tá o app, se vira." É o sistema perguntando: quem é você? Como é sua rotina? O que importa pra você? E a partir dessas respostas, o sistema se constrói de dentro pra fora.

**O que NÃO é:** um sistema novo, schema novo, types novos, ou tabelas novas.
**O que É:** um padrão de uso do Atom Engine. 9 domínios × 7 estágios Genesis, com alma.

### 4.2 Os 9 domínios da vida

| # | Domínio | Módulo Atom | O que vive aqui |
|---|---------|-------------|-----------------|
| 1 | **Identidade e acesso** | bridge | Contas de email, logins, senhas, 2FA, recovery |
| 2 | **Documentos e papéis** | bridge + contexto | Passaporte, contratos, seguros, certidões, vistos, tax |
| 3 | **Saúde e corpo** | body | Exames, vacinas, receitas médicas, plano de saúde, médicos |
| 4 | **Finanças** | finance | Bancos, subscriptions, impostos, super, investimentos |
| 5 | **Arquivos e storage** | bridge | Drives, clouds, HDs, pastas locais, estrutura de pastas |
| 6 | **Memórias** | family + mind | Fotos, vídeos, mensagens importantes, diários |
| 7 | **Tempo e calendário** | bridge | Calendários, rituais, blocos, compromissos recorrentes |
| 8 | **Comunicação e conexões** | social + bridge | Email, WhatsApp, redes sociais, contatos, newsletters |
| 9 | **Projetos e compromissos** | work + contexto | Tudo que está aberto: projetos profissionais, pessoais, side projects |

**Princípio:** módulo segue o significado, não o formato. Exame médico = body. Contrato de trabalho = work. Passaporte = bridge. A tag `#domain:*` cria a lente cross-type.

### 4.3 Os 7 estágios por domínio (Genesis puro)

Cada domínio progride independentemente pelos 7 estágios. Você pode estar no ○ em comunicação e no · em finanças.

| # | Geo | Nome | O que acontece | Gate |
|---|-----|------|----------------|------|
| 1 | · | Ver | Inventário: listar o que existe, sem mover nada | Inventário completo |
| 2 | — | Decidir | Classificar: manter / redirecionar / arquivar / eliminar | Decisões tomadas |
| 3 | △ | Desenhar | Blueprint: definir onde cada coisa vai morar | Blueprint aprovado |
| 4 | □ | Montar | Fundação: configurar a estrutura (pastas, redirects, 2FA) | Fundação operacional |
| 5 | ⬠ | Migrar | Conexão: mover tudo pro lugar certo, uma gaveta por vez | Migração completa |
| 6 | ⬡ | Ritualizar | Ativação: criar hábitos e rituais que mantêm a geometria | Rotina testada 1 semana |
| 7 | ○ | Viver | Completude: a geometria respira. Modo manutenção | Review periódico ativo |

### 4.4 Matriz completa (domínios × estágios)

| Domínio | · Ver | — Decidir | △ Desenhar | □ Montar | ⬠ Migrar | ⬡ Ritualizar | ○ Viver |
|---------|-------|-----------|------------|----------|----------|--------------|---------|
| Identidade | Listar contas | Manter/eliminar | 2 identidades | Redirects, 2FA | Migrar logins | Review trimestral | Zero dispersão |
| Documentos | Onde estão? | Digital/físico/ambos | Pasta por tipo | Digitalizar base | Tudo no lugar | Check vencimentos | Achar em 30s |
| Saúde | Exames, médicos | O que guardar | Pasta saúde | Digitalizar exames | Histórico completo | Lembretes anuais | Histórico na mão |
| Finanças | Contas, subs | Cancelar/manter | Categorias claras | Consolidar bancos | Tudo rastreável | Review mensal | Clareza total |
| Arquivos | Drives, clouds | Consolidar onde | Estrutura pastas | Drive principal | Migrar tudo | Inbox → organiza | 1 lugar só |
| Memórias | Onde tão fotos | 1 biblioteca | Backup definido | Transferir fotos | Álbuns organizados | Backup automático | Nada se perde |
| Tempo | Calendários ativos | Consolidar onde | Camadas por cor | Timezone, imports | Tudo num sistema | Blocos + rituais | Dias com forma |
| Comunicação | Canais ativos | Simplificar | Regras por canal | Filtros, labels | Redirects ativos | Batches 2x/dia | Sem ruído |
| Projetos | Listar tudo aberto | Ativo/pausado/matar | Prioridades claras | Backlog limpo | Tudo rastreável | Weekly review | Foco sem culpa |

### 4.5 Integração com Atom Engine (zero schema novo)

**Items da vida real → types existentes:**

| Item da vida real | Type Atom | Lógica |
|-------------------|-----------|--------|
| Conta de email | `resource` | Recurso externo inventariado |
| Drive / cloud storage | `resource` | Recurso externo inventariado |
| App / serviço com login | `resource` | Netflix, Monday, banco — tudo é resource com tags |
| Exame médico (PDF) | `doc` | Documento estático. mod-body |
| Passaporte / certidão | `doc` | Documento vital. mod-bridge. Tag: #vital-doc |
| Contrato / escritura | `doc` | Documento legal. Módulo varia |
| Subscription | `resource` | Recurso com extension Operations (custo, vencimento) |
| Plano de organização | `project` | O Raiz do usuário é um project com milestones por domínio |
| Ritual de manutenção | `ritual` | Review semanal, mensal, trimestral. Extension Recurrence |
| Hábito de proteção | `habit` | "Inbox zero sexta". Extension Recurrence |
| Milestone de domínio | `checkpoint` | "Identidade chegou no ○" |

**Tags semânticas novas** (seguem o padrão Genesis Part 10):

`#raiz` — todos os items do framework
`#domain:identity` `#domain:documents` `#domain:health` `#domain:finance` `#domain:storage` `#domain:memories` `#domain:time` `#domain:communication` `#domain:projects`
`#vital-doc` — documento vital (passaporte, certidão)
`#account:active` `#account:redirect` `#account:archive` `#account:eliminate`

**O Raiz como project Atom:**

```
type: project
module: bridge
title: "Raiz — Organização da vida"
tags: [#raiz, #milestone]
body: { operations: { progress_mode: milestone } }
Milestones: 9 checkpoints (1 por domínio)
Progress: auto (média dos milestones)
```

### 4.6 Alma do processo

**7 princípios de gentileza:**

1. **Você não está atrasado.** O caos não é culpa sua. A vida foi acontecendo e ninguém ensinou a organizar.
2. **Uma gaveta por vez.** Escolha um domínio, avance um estágio, e pare quando quiser. O progresso fica salvo.
3. **Ver não é fazer.** O primeiro passo é só olhar. Não mova nada, não delete nada, não julgue.
4. **O passado é precioso.** Fotos antigas, emails de quem já se foi — nada é lixo até você decidir que é.
5. **Parar é válido.** Se ficou pesado, para. A geometria espera.
6. **Celebrar o pequeno.** Cada domínio que encontra seu lugar é uma vitória real.
7. **Imperfeito e vivo > perfeito e morto.** A geometria não precisa ser impecável. Precisa ser sustentável.

**Sinais emocionais que o sistema escuta:**

| Sinal | Exemplos | Resposta do sistema |
|-------|----------|---------------------|
| Hesitação | "acho que...", "não lembro" | Normaliza. "Normal não saber." |
| Vergonha | "é muita bagunça" | Acolhe. "Não é falha, é acúmulo." |
| Overwhelm | "é demais" | Pausa. "Quer parar aqui? Tá salvo." |
| Resistência | "deixa pra depois" | Respeita. "Tá ok. Quando estiver pronto." |
| Apego | "tem coisa importante aí" | Valida. "Nada é lixo até você decidir." |
| Alívio | "ufa, pelo menos sei o que tem" | Celebra. "Isso é progresso real." |

### 4.7 Protocolo de sessão

**Primeiro contato:** o sistema nunca começa com formulário. Começa com escuta.
1. Acolher — normalizar o caos.
2. Despejo livre — a pessoa fala, o sistema captura.
3. Espelhar — o sistema mostra de volta o que capturou.
4. Panorama — mapa visual do que existe.

**3 portas de entrada:**

| Porta | Como funciona | Pra quem |
|-------|---------------|----------|
| "Quero começar pelo mais fácil" | Comunicação ou tempo — quick win | Quem precisa de momentum |
| "Quero resolver o que mais me incomoda" | O que dói — alivia rápido | Quem sabe onde dói |
| "Não sei, me guia" | Identidade — de dentro pra fora. Porta padrão | Quem tá perdido |

**Formatos de sessão:**

| Formato | Duração | O que acontece | Quando usar |
|---------|---------|----------------|-------------|
| Micro | 5-10 min | Um domínio, só inventário | Primeiro contato, dia corrido |
| Padrão | 15-30 min | Inventário + decisões, ou avançar estágio | Sessão regular |
| Deep | 1-2h | Migração real. Pausas a cada 30 min | Quando o blueprint tá pronto |

**Soul checkpoints:**

| Momento | O que acontece |
|---------|----------------|
| Início | "Como tá sendo pensar em organizar isso tudo?" (opcional) |
| Achado | "Encontramos fotos no drive antigo. Quer dar uma olhada?" |
| Decisão | "Deletar é soltar. Pode arquivar e decidir depois." |
| Vitória | "Comunicação chegou no ○. Isso é real." |
| Pausa | "Ficou pesado? Tá salvo. Volta quando quiser." |

### 4.8 Anti-entropia (manutenção)

Organizar uma vez é projeto. Manter organizado é sistema.

| Frequência | Ritual | O que verifica |
|------------|--------|----------------|
| Semanal | Inbox zero | Captura da semana classificada e guardada |
| Mensal | Review suave | Subscription nova? Conta nova? Documento vencendo? |
| Trimestral | Audit completo | A geometria inteira revisitada. O que regrediu? O que cresceu? |

**Regressão automática:** se um domínio regride (ex: inbox lotou, fotos novas sem backup), o sistema detecta e convida gentilmente: "seu domínio de memórias voltou pro △. Quer uma sessão pra atualizar?"

### 4.9 Na arquitetura v5

1. Usuário abre o MindRoot pela primeira vez
2. Onboarding = Raiz: "Vamos organizar sua vida, uma gaveta por vez"
3. Escolhe porta de entrada (fácil / o que incomoda / me guia)
4. Começa pelo inventário (estágio 1 · Ver) do domínio escolhido
5. Cada item inventariado → INSERT no Supabase (resource, doc, habit, ritual...)
6. Progresso por domínio = query: `genesis_stage` médio dos items com tag `#domain:*`
7. Dashboard mostra matriz visual: 9 domínios × 7 geometrias
8. Wraps de sessão seguem o formato JSONB estruturado (seção 3.3)

**Zero Drive envolvido.** Tudo no Supabase. Tudo no MindRoot. Drive só se quiser exportar.

O Raiz não é só onboarding — é feature permanente. O dashboard de "saúde da vida" mostra onde cada domínio está, qual regrediu, qual precisa de atenção. É o Genesis aplicado à vida — e é isso que diferencia o Atom Engine de todo outro app de organização.

*A raiz cresce de dentro pra fora. A geometria perfeita não é rígida — é viva. Respira com você.*

---

## 5 — Plano de transição

### 5.1 Princípio

Não é big bang. É migração progressiva. O Drive continua funcionando enquanto o MindRoot absorve as funções. Quando o MindRoot faz tudo que o Drive fazia, o Drive vira opcional.

### 5.2 Fases

**Fase 0 — Fundação (já feito)**
- [x] 3 tabelas Supabase deployed (items, item_connections, atom_events)
- [x] Triggers e RLS ativos
- [x] RPCs (morph, decay, propagate, commit)
- [x] Audit views (órfãos, below_floor, stale)
- [x] MindRoot data layer alinhado com Schema v2
- [x] 14 templates commitados no Drive

**Fase 1 — MindRoot como porta da frente**
- [ ] Captura: input field → INSERT no Supabase (bypass Drive)
- [ ] Visualização: cards renderizados do Supabase
- [ ] Triage: auto-classify com UI de confirmação
- [ ] Pipeline: stepper visual dos 7 estágios
- [ ] Graph: visualização nativa de connections

**Fase 2 — Wrap e Audit no MindRoot**
- [ ] Wrap: flow guiado que gera body JSONB estruturado
- [ ] Audit: dashboard automático (inbox, pisos, órfãos, stale)
- [ ] Soul: registro emocional integrado no wrap flow
- [ ] Timeline: histórico de wraps como timeline navegável

**Fase 3 — Raiz como onboarding**
- [ ] Onboarding flow: primeiro contato → portas de entrada → inventário
- [ ] Dashboard de domínios: matriz visual 9 × 7
- [ ] Session protocol: micro / padrão / deep
- [ ] Soul checkpoints integrados
- [ ] Rituais de manutenção como habits automáticos

**Fase 4 — Drive e Obsidian como exports**
- [ ] "Export to Drive": botão que gera Google Doc com ATOM ENVELOPE
- [ ] "Export to Obsidian": gera vault completo ou parcial
- [ ] Type schemas migrados de docs no Drive pra Supabase ou JSON config
- [ ] Templates no Drive viram referência histórica
- [ ] Naming convention aplicada automaticamente nos exports

**Fase 5 — Desacoplamento completo**
- [ ] Drive é opcional (tudo funciona sem ele)
- [ ] Obsidian é opcional (grafo nativo no MindRoot)
- [ ] Claude Project continua como interface do criador (não operacional)
- [ ] MindRoot é o cockpit completo: captura, triage, pipeline, wrap, audit, raiz, graph

### 5.3 O que acontece com o conteúdo existente no Drive

Os items que já existem no Drive (templates, docs-lei, specs) podem ser:
1. **Migrados** para o Supabase como items reais (INSERT com todos os campos do ATOM ENVELOPE)
2. **Referenciados** como docs-lei na Knowledge base (Genesis, Marco Zero, Meta-Template continuam no Project Atom)
3. **Preservados** no Drive como arquivo histórico (nada se perde)

A migração pode ser feita por um script que lê o ATOM ENVELOPE de cada doc e faz INSERT no Supabase. Os docs-lei são exceção — vivem no Project Atom como Knowledge base e no GitHub como arquivos versionados.

---

## 6 — Impacto nos documentos-lei

### Genesis v4.2 → v5

O Genesis precisa de atualização na Parte 8 (Arquitetura de Sistemas):
- Source of truth = Supabase (não mais "fase de ponte")
- Drive = consumidor/export (não mais "fase atual")
- Serialização: Supabase é a representação canônica. Drive e Obsidian são exports.
- Convenção de nomes permanece, com escopo redefinido (export, não identidade)

O resto do Genesis (Parts 1-7, 9-12) permanece intacto.

### Marco Zero v1.3 → v2

O Marco Zero precisa refletir:
- Seção 7 (Atom Drive): Drive como export, não como mapa do sistema
- Seção 2 (Ritual): wrap via MindRoot, não via Claude Code → Drive
- Seção 3 (Apps): MindRoot como "sempre aberto" principal
- Nova seção: Raiz como framework de organização da vida

### Meta-Template v1.0

O Meta-Template define formatos de serialização (ATOM ENVELOPE, YAML). Esses formatos permanecem válidos como formatos de export. O Meta-Template ganha uma nota: "estes formatos são de serialização/export — a fonte canônica é o Supabase."

---

## 7 — O que isso significa pro usuário externo

O usuário externo nunca viu e nunca verá:
- Google Drive
- Obsidian
- Claude Project
- Pastas, mirrors, envelopes
- Naming conventions
- Triggers SQL
- RPCs

O que ele vê:
- MindRoot: app limpo com captura, visualização, pipeline, wraps, graph
- Raiz: onboarding gentil que organiza a vida de dentro pra fora
- Soul: registro emocional integrado, sem pressão
- Geometrias: feedback visual de progresso (·  — △ □ ⬠ ⬡ ○)

Toda a complexidade é infraestrutura. O produto é simplicidade.

---

## 8 — Decisões em aberto

| # | Questão | Opções | Impacto |
|---|---------|--------|---------|
| 1 | Type schemas: tabela SQL ou JSON config? | A: `type_schemas` table / B: JSON no repo | A = dinâmico, B = simples |
| 2 | Export to Drive: automático no wrap ou manual? | A: todo wrap gera doc / B: botão "export" | A = mais completo, B = mais limpo |
| 3 | Obsidian: manter como opção ou remover da spec? | A: export sob demanda / B: descontinuar | A = mais flexível, B = mais simples |
| 4 | Migração de items existentes: script ou manual? | A: script de migração / B: recriar no MindRoot | A = mais rápido, B = mais limpo |
| 5 | Timeline do Genesis v5: incremental ou spec completa primeiro? | A: implementar enquanto documenta / B: spec → code | A = momentum, B = clareza |

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 0.1 | 2026-04-01 | Working doc — consolidação da sessão de revisão arquitetural. Drive → export, Supabase → casa, Raiz → onboarding, 6 pontos de revisão, plano de transição em 5 fases |

---

*A ponte foi cruzada. O destino era o banco de dados desde o início.*
*Uma fonte de verdade. Múltiplas visualizações. Nada mais.*
