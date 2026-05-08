╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   bridge                     ║
║ state:    connected                  ║
║ status:   active                     ║
║ stage:    5 ⬠ Pentágono              ║
║ tags:     [#mod_bridge, #feature,    ║
║            #boca, #gmail,            ║
║            #organizacao]             ║
║ source:   claude-project             ║
║ created:  2026-05-06                 ║
║ updated:  2026-05-07                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4       ║
║   → references: Identidade v1.2     ║
║   → references: ATOM.md v1.4         ║
║   → references: PENTAGON.md v3.4    ║
║   → references: feature_conectores   ║
║   → references: feature_raiz         ║
║   → references: feature_triage       ║
║   → feeds: gmail-sync edge function  ║
╚══════════════════════════════════════╝

# Spec: Email Organization (Gmail Labels)
## A Boca Email do Engine OS

**Versão:** 1.2
**Data:** 07 Mai 2026
**Status:** Definitive Spec
**Evolução:** v1.0 (06 Mai) → v1.1 (07 Mai) → v1.2 (07 Mai, audit Genesis)
**Cross-check:** Genesis v5.0.4 §4.2 (AtomModule enum), §10 (tags semânticas), §5.1 (SQL enums) | Identidade v1.2 §2 (Pentágono + Hexágono) | ATOM.md v1.4 §A Árvore (camada 7 Bocas) | execução F2/F3 via Claude in Chrome
**Princípio:** Email é uma das 4 bocas universais do Engine OS (ATOM.md camada 7 — Netzach). Esta spec define como o Gmail é organizado *na origem*, espelhando a geometria interna do Atom, antes de virar AtomItem via `gmail-sync`. Se não está aqui (no escopo de email), não existe.

---

## Parte 1 — Filosofia

### 1.1 O problema que resolve

Email é a maior boca do Engine: volume contínuo, estrutura imposta pelo remetente, zero geometria nativa. Sem organização na origem, há duas opções ruins:
1. **Inbox zero brute-force.** O humano classifica 100% manualmente. Gera fricção, não escala.
2. **Sync direto pro MindRoot sem geometria.** Cada email vira AtomItem cru no inbox, sem module/vértice/estágio. O Triage retrabalha tudo.

### 1.2 A solução: espelho externo do schema interno

O Gmail vira espelho da geometria do Atom. Cada email já carrega seu module (Camada 1), seu vértice quando aplicável (Camada 2), seu estágio (Camada 3), e opcionalmente sua pessoa (Camada 4) — *antes* de virar AtomItem. Quando o `gmail-sync` puxa, o Triage consome a label, não inventa a classificação.

### 1.3 As 3 leis aplicadas a email

1. **O schema é o contrato, não o código.** Se amanhã troca Gmail por Fastmail, ProtonMail, ou IMAP cru — a taxonomia (módulos, vértices, estágios) é a mesma.
2. **Documentar é executar.** Cada label criada, cada filtro configurado, cada email classificado é trabalho real registrado.
3. **Nada se perde.** Email arquivado mantém sua label. Filtro removido não apaga emails históricos. UUID interno (Gmail message_id) é eterno.

### 1.4 Anterioridade

Esta spec é POSTERIOR ao Genesis (v5.0.4) e à Identidade (v1.2). Está sujeita ao pipeline (passou por inbox antes de chegar em `state: connected`) e ao envelope (quarta lei). Não é doc-lei.

---

## Parte 2 — As 4 Camadas de Classificação

### 2.1 Camada 1 — Módulo (8 universais)

Source of truth: **Genesis v5.0.4 §4.2** (TypeScript enum `AtomModule`) e **§5.1** (SQL `CREATE TYPE atom_module`).

```typescript
type AtomModule =
  | "work" | "body" | "mind" | "family"
  | "purpose" | "bridge" | "finance" | "social";
```

Mapeamento canônico Gmail label ↔ AtomModule:

| Gmail label | AtomModule | Escopo (esta spec) |
|-------------|------------|--------------------|
| `00.work` | `work` | Atlas Frames, clientes, faturamento, operação |
| `01.body` | `body` | Saúde, médicos, exames, exercício, nutrição |
| `02.mind` | `mind` | Cursos, leituras, newsletters, aprendizado |
| `03.family` | `family` | Família, casa, escola, parentes |
| `04.purpose` | `purpose` | Yugar, propósito, longo prazo, legado |
| `05.bridge` | `bridge` | Atom Engine, dev, infra, documentação cross-vértice |
| `06.finance` | `finance` | Bancos, impostos, investimentos, contadoria |
| `07.social` | `social` | Amigos, eventos, redes, lazer |

**Naming convention:** prefixo numérico `00-07` força ordem lexicográfica no sidebar do Gmail. O número não tem significado semântico — apenas ordenação visual.

**Regra de exclusividade:** todo email pertence a **exatamente um** módulo. Ambíguo entre dois → vai pro mais específico (ex: fatura de academia = `01.body`, não `06.finance`; cobrança Stripe da Atlas = `00.work`, não `06.finance`).

### 2.2 Camada 2 — Vértice/Projeto (Pentágono + Hexágono)

Source of truth: **Identidade v1.2 §2.2** (5 vertices internos + Engine no centro = Pentágono) e **§2.3** (Atlas como Hexágono externo).

Sub-labels dentro do módulo de origem:

| Gmail sub-label | Vértice | Geometria | Status PENTAGON |
|-----------------|---------|-----------|-----------------|
| `00.work/atlas-frames` | Atlas Frames | ⬡ Hexágono (propagação externa) | active |
| `04.purpose/yugar` | V4 Yugar Commons | ⬠ Pentágono | concept |
| `05.bridge/atom-engine` | Engine (centro) | · Centro | active |
| `05.bridge/mindroot` | V1 MindRoot | ⬠ Pentágono | active |
| `05.bridge/constellation` | V2 Constellation | ⬠ Pentágono | paused |
| `05.bridge/lab` | V3 Lab | ⬠ Pentágono | concept |
| `05.bridge/muda` | V5 Muda | ⬠ Pentágono | concept |

**Total:** 7 sub-labels = 1 hexágono + 1 centro + 5 vértices internos. Confere com Identidade §2.2 (6 peças do Pentágono + 1 hexágono externo).

**Regra dos galhos** (ATOM.md §⬠ Pentágono): vértice só ganha **filtro automático** quando tem flow ativo. Vértices `concept` ou `paused` ficam **com label criada mas sem filtro** — emails são classificados manualmente quando aparecem (raros, por definição).

### 2.3 Camada 3 — Estágio (subset de AtomState)

Source of truth: **Genesis v5.0.4 §2** (state machine de 7 estágios). Esta spec usa **subset de 4** dos 7 estágios — os relevantes pra ciclo de vida de email no Gmail. Estágios 3, 4 e 6 acontecem dentro do MindRoot, não no Gmail.

```typescript
// Subset usado nesta spec
type GmailStage = "inbox" | "classified" | "connected" | "committed";
```

| Gmail label | AtomState | Geometria | Significado no Gmail |
|-------------|-----------|-----------|----------------------|
| `@1-inbox` | `inbox` | · Ponto | Chegou agora, sem triagem. Equivale a `INBOX` nativa. |
| `@2-classified` | `classified` | — Linha | Module + tipo definidos. Sabe o que é, ainda não virou item. |
| `@5-connected` | `connected` | ⬠ Pentágono | Já virou AtomItem no MindRoot via `gmail-sync`. Conectado ao grafo. |
| `@7-committed` | `committed` | ○ Círculo | Resolvido. Pode arquivar. Memória, não ação pendente. |

**Naming convention:** prefixo `@` força ordenação no topo do sidebar (separa estágios de módulos visualmente). Número espelha `genesis_stage` (1, 2, 5, 7).

**Regra de irreversibilidade:** o estágio do email no Gmail nunca regride. Se um item commitado precisar voltar à ação, vira email novo no inbox (regra Genesis: "nada se perde, mas o UUID é eterno — versão nova é versão nova").

### 2.4 Camada 4 — Pessoas (`#who:`)

Source of truth: **Genesis v5.0.4 §10** (tag reservada `#who:*`) e **feature_conectores_v1-0.md §4** (API `who/X` deployed).

| Padrão | Exemplo |
|--------|---------|
| `who/[primeiro-nome-kebab]` | `who/joao-silva`, `who/maria` |

**Regra de criação:** só criar `who/X` quando há ≥3 threads com a pessoa OU quando ela é counterparty de algo crítico (advogado, contador, parceiro de negócio).

---

## Parte 3 — Motores de Automação

Espelha **Genesis v5.0.4 §3** (Motores de Automação).

### 3.1 Filter Engine (Camada 1 + 2 — automatic)

Filtros nativos do Gmail aplicam labels de módulo e vértice automaticamente quando email novo chega. Sem skip inbox, sem mark read, apenas label.

**3 faixas de aderência** (espelha auto-triage do Genesis §3.1):

| Aderência | Critério | Ação |
|-----------|----------|------|
| Domain match | Remetente bate com lista explícita | Auto-aplica label |
| Subject match | Subject contém keyword reservada | Auto-aplica label |
| Sem match | Nenhum filtro casa | Permanece sem label de módulo, exige classificação manual |

**Princípio:** classificar errado um email é incômodo recuperável (basta remover a label). Não classificar é débito acumulado. O Filter Engine é generoso — prefere falso positivo sobre falso negativo.

### 3.2 Manual Classification (Camada 3 — humano)

O humano aplica `@2-classified` quando lê e confirma a classificação automática (ou corrige). Atalho de teclado custom recomendado (F6 do roadmap §8).

`@7-committed` é aplicado manualmente ao arquivar o thread como resolvido.

### 3.3 gmail-sync Engine (Camada 3 — futuro)

Edge function (Supabase) que puxa emails com label `@2-classified` e ainda sem AtomItem, cria items, aplica `@5-connected` no Gmail. Depende de F5 do roadmap.

---

## Parte 4 — Schema das Labels

### 4.1 Hierarquia

```
Gmail Labels Tree
├── @1-inbox          (estágio)
├── @2-classified     (estágio)
├── @5-connected      (estágio)
├── @7-committed      (estágio)
├── 00.work           (módulo)
│   └── atlas-frames  (vértice — hexágono ⬡)
├── 01.body           (módulo)
├── 02.mind           (módulo)
├── 03.family         (módulo)
├── 04.purpose        (módulo)
│   └── yugar         (vértice V4)
├── 05.bridge         (módulo)
│   ├── atom-engine   (centro)
│   ├── constellation (vértice V2)
│   ├── lab           (vértice V3)
│   ├── mindroot      (vértice V1)
│   └── muda          (vértice V5)
├── 06.finance        (módulo)
└── 07.social         (módulo)
```

**Total:** 19 labels (8 módulos + 7 vértices + 4 estágios).

### 4.2 Estados de uma label

| Estado | Significado |
|--------|-------------|
| `created` | Label existe no Gmail, aparece no sidebar |
| `filtered` | Label tem ≥1 filtro automático aplicando ela |
| `active` | Label tem ≥1 email aplicado (visível no count) |

Vértices `paused/concept` ficam em `created` mas não em `filtered` (regra dos galhos §2.2).

### 4.3 Multiplicidade

| Camada | Min | Max | Notas |
|--------|-----|-----|-------|
| Estágio | 1 | 1 | Email tem exatamente 1 estágio (se tiver mais, último prevalece) |
| Módulo | 0 | 1 | Email pode estar sem módulo (no inbox). Quando tem, tem 1 só. |
| Vértice | 0 | 1 | Vértice é sub do módulo. Aplica vértice → módulo é implícito (Gmail não herda — aplicar ambos). |
| Pessoa | 0 | n | Email pode envolver múltiplas pessoas. Múltiplos `who/X` permitidos. |

---

## Parte 5 — Filtros Ativos (10)

Estado pós-execução em 07 Mai 2026 via Claude in Chrome (UI automation).

### 5.0 Considerações de sintaxe Gmail

A sintaxe de filtros do Gmail tem limites importantes que afetam esta spec:

- **Wildcards `*` no campo `from:` não funcionam.** `from:(*bank*)` falha. Solução: listar domínios concretos.
- **Operadores válidos:** `from:`, `to:`, `subject:`, `list:`, `has:attachment`, `OR`, `-` (negação), `"frase exata"`.
- **Case-insensitive** por default.
- **Filtros aplicam labels mas não regridem estágios.** Não há lógica condicional além de match/no-match.
- **Filtros aplicam top-down** mas não há prioridade explícita — cada filtro avalia independente.

### 5.1 Tabela canônica de filtros

| # | Search criteria (Gmail syntax) | Apply label | Camada |
|---|--------------------------------|-------------|--------|
| 1 | `from:atlasframes.com.au OR to:atlasframes.com.au` | `00.work/atlas-frames` | 2 |
| 2 | `from:(monday.com OR stripe.com) OR subject:(invoice OR fatura OR pedido OR order)` | `00.work` | 1 |
| 3 | `from:(strava.com OR myfitnesspal.com OR whoop.com OR oura.com OR medibank.com.au OR bupa.com.au OR ahm.com.au OR my.gov.au) OR subject:(workout OR training OR fitness OR consulta OR exame OR appointment OR prescription OR pathology)` | `01.body` | 1 |
| 4 | `from:(medium.com OR substack.com OR readwise.io OR kindle.com OR goodreads.com)` | `02.mind` | 1 |
| 5 | `subject:(yugar OR "mt samson" OR "mount samson" OR cabin OR property OR council OR realestate)` | `04.purpose/yugar` | 2 |
| 6 | `subject:("atom engine" OR genesis OR pentagon OR pentágono)` | `05.bridge/atom-engine` | 2 |
| 7 | `from:mindroot.com.au OR subject:(mindroot OR "mind root")` | `05.bridge/mindroot` | 2 |
| 8 | `from:(github.com OR vercel.com OR supabase.io OR supabase.com OR anthropic.com OR claude.ai OR openai.com OR notion.so OR figma.com OR linear.app OR cloudflare.com)` | `05.bridge` | 1 |
| 9 | `from:(paypal.com OR xero.com OR quickbooks.com OR ato.gov.au OR afterpay.com OR commbank.com.au OR nab.com.au OR anz.com.au OR westpac.com.au)` | `06.finance` | 1 |
| 10 | `from:(linkedin.com OR linkedinmail.com OR facebook.com OR facebookmail.com OR instagram.com OR x.com OR twitter.com OR reddit.com OR discord.com)` | `07.social` | 1 |

**Configuração comum a todos:** `Apply label: ✓`, `Skip Inbox: ✗`, `Mark as read: ✗`, `Star: ✗`, `Apply to matching conversations: ✗`. Apenas a label é aplicada — emails permanecem na INBOX nativa do Gmail pra triagem do humano.

### 5.2 Decisões de não-criação

| Filtro proposto na v1.0 | Decisão | Razão |
|-------------------------|---------|-------|
| `03.family` (keyword genérica) | **Não criado** | Keywords `family/familia/mãe/pai/filho/filha` são amplas demais; gera falso positivo em marketing. Aguarda popular com domínios/remetentes reais. |
| `05.bridge/constellation` | **Não criado** (label existe) | V2 está `paused` no PENTAGON; regra dos galhos. |
| `05.bridge/lab` | **Não criado** (label existe) | V3 `concept`. Regra dos galhos. |
| `05.bridge/muda` | **Não criado** (label existe) | V5 `concept`. Regra dos galhos. |
| Aurora Gate (v1.0 §5.4) | **Adiado** | Implementação via Inbox Pause add-on é mais robusta que filtro nativo. |

### 5.3 Estágio aplicado por humano ou edge function

| Estágio | Aplicador | Quando |
|---------|-----------|--------|
| `@1-inbox` | Default | Padrão da INBOX nativa do Gmail (não precisa de filtro) |
| `@2-classified` | Humano | Após ler e confirmar/corrigir module |
| `@5-connected` | `gmail-sync` (futuro) | Quando email vira AtomItem no MindRoot |
| `@7-committed` | Humano | Ao arquivar resolvido |

---

## Parte 6 — Operações

### 6.1 create_label

```
Gmail UI → Labels → Create new label → [name] → [optional: nest under]
```

Label não tem trigger automático. Existe, é selecionável em filtros, aparece no sidebar.

### 6.2 create_filter

```
Gmail UI → Search bar → tune icon (advanced search) →
  [fill criteria] → Create filter →
  ☑ Apply the label: [label] →
  ☐ Apply to matching conversations →
  Create filter
```

Critério vai pro campo `Has the words` (catch-all). URL hash atalho:
```
https://mail.google.com/mail/u/0/#create-filter/has=[ENCODED_QUERY]&sizeoperator=s_sl&sizeunit=s_smb
```

### 6.3 delete_filter

```
Settings → Filters and Blocked Addresses →
  ☑ [filter checkboxes] → Delete → OK
```

Deletar filtro **não remove labels existentes** dos emails históricos. Apenas para a aplicação automática a emails futuros.

### 6.4 Manutenção (rituais)

Espelha `feature_raiz_v1-0.md §4` (Rituais de manutenção).

| Cadência | Ritual | O que fazer |
|----------|--------|-------------|
| Semanal | Inbox zero | Tudo em INBOX deve ter pelo menos `@2-classified` ou voltar pra `@1-inbox` se incompleto. |
| Mensal | Review de módulo | Cada módulo tem volume razoável? Algum sumido (sinal de regressão de domínio no Raiz)? |
| Trimestral | Audit de filtros | Filtros ainda fazem sentido? Domínios novos? `who/X` ainda relevantes? Vértices `paused/concept` viraram `active`? |

---

## Parte 7 — Audit Queries (futuro)

Espelha **Genesis v5.0.4 §7** (Audit Queries SQL). Implementação depende de gmail-sync (F5).

### 7.1 Inbox stale

```sql
-- Emails com @1-inbox há mais de 7 dias (não classificados)
CREATE VIEW v_email_inbox_stale AS
SELECT i.id, i.title, i.created_at,
  EXTRACT(DAY FROM NOW() - i.created_at) AS days_in_inbox
FROM items i
WHERE i.source = 'gmail-sync'
  AND i.state = 'inbox'
  AND i.created_at < NOW() - INTERVAL '7 days';
```

### 7.2 Module unbalance

```sql
-- Distribuição de emails por módulo (sinal de boca disfuncional)
CREATE VIEW v_email_module_distribution AS
SELECT i.module, COUNT(*) AS email_count,
  AVG(EXTRACT(DAY FROM NOW() - i.created_at)) AS avg_age_days
FROM items i
WHERE i.source = 'gmail-sync'
  AND i.state != 'archived'
GROUP BY i.module;
```

### 7.3 Below floor

```sql
-- Emails que viraram items mas estão abaixo do piso do type
-- (reusa v_below_floor do Genesis §7)
SELECT * FROM v_below_floor
WHERE id IN (SELECT id FROM items WHERE source = 'gmail-sync');
```

---

## Parte 8 — Arquitetura

### 8.1 Source of truth

Espelha **Genesis v5.0.4 §8.1** mas ajustado pra escopo email:

| Camada | Sistema | Papel |
|--------|---------|-------|
| **Boca** | Gmail | Onde emails entram. Origem externa, classificação na fonte via labels. |
| **Triage automático** | Filtros do Gmail | Camada 1+2 aplicadas automaticamente |
| **Triage manual** | Humano (Gmail UI) | Camada 3 aplicada manualmente |
| **Casa** | Supabase (via gmail-sync) | Source of truth quando email vira AtomItem |
| **Porta da frente** | MindRoot | Visualização do email-como-item |

### 8.2 Flow de dados

```
[Email novo chega no Gmail]
  ↓
[Filtros do Gmail] → Aplicam labels Camada 1 (módulo) + Camada 2 (vértice)
  ↓
[INBOX nativa] → Humano vê email com label automática
  ↓
[Humano lê + confirma] → Aplica @2-classified (Camada 3)
  ↓
[gmail-sync edge function] → Puxa emails com @2-classified ainda sem item_id
  ↓
[Cria AtomItem no Supabase] → module + tags do Gmail viram fields
  ↓
[Aplica @5-connected no Gmail] → marca como sincronizado
  ↓
[MindRoot renderiza] → Email vira card no Pipeline / Email view
```

### 8.3 Separação de responsabilidades

| Ator | Papel | Nunca faz |
|------|-------|-----------|
| Humano | Lê email, confirma classificação, aplica @2-classified, decide @7-committed | Configurar filtros (uma vez sim, manutenção trimestral) |
| Filtros do Gmail | Auto-aplicam labels Camada 1+2 | Aplicar Camada 3 (estágios) |
| `gmail-sync` (futuro) | Puxa, cria AtomItem, aplica @5-connected | Decidir module (consome o que filtro aplicou) |
| MindRoot | Renderiza email-como-item | Configurar filtros do Gmail (UI vive no Gmail) |

---

## Parte 9 — Serialização (Gmail label → AtomItem)

Espelha **Genesis v5.0.4 §9** (Serialização por sistema). Define como uma label do Gmail vira fields no AtomItem schema.

### 9.1 Mapeamento canônico

```typescript
// Função pura: Gmail labels → AtomItem fields
function deserializeGmailLabels(labels: string[]): Partial<AtomItem> {
  const result: Partial<AtomItem> = { tags: [] };

  for (const label of labels) {
    // Camada 3 — Estágio
    if (label === "@1-inbox")     { result.state = "inbox";      result.genesis_stage = 1; }
    if (label === "@2-classified") { result.state = "classified"; result.genesis_stage = 2; }
    if (label === "@5-connected")  { result.state = "connected";  result.genesis_stage = 5; }
    if (label === "@7-committed")  { result.state = "committed";  result.genesis_stage = 7; }

    // Camada 1 — Módulo (extrai prefixo "00."-"07.")
    const moduleMatch = label.match(/^0[0-7]\.([\w-]+)$/);
    if (moduleMatch) {
      const moduleMap: Record<string, AtomModule> = {
        "work": "work", "body": "body", "mind": "mind", "family": "family",
        "purpose": "purpose", "bridge": "bridge", "finance": "finance", "social": "social"
      };
      result.module = moduleMap[moduleMatch[1]];
      result.tags.push(`#mod_${result.module}`);
    }

    // Camada 2 — Vértice (sub-label)
    const vertexMatch = label.match(/^0[0-7]\.\w+\/([\w-]+)$/);
    if (vertexMatch) {
      result.tags.push(`#project:${vertexMatch[1]}`);
    }

    // Camada 4 — Pessoa
    const whoMatch = label.match(/^who\/([\w-]+)$/);
    if (whoMatch) {
      result.tags.push(`#who:${whoMatch[1]}`);
    }
  }

  return result;
}
```

### 9.2 Exemplo de mapeamento

```
Gmail email "Reminder: Quarterly review with team"
labels: ["00.work/atlas-frames", "@2-classified", "who/maria"]

↓ deserializeGmailLabels()

AtomItem fields:
  module: "work"
  state: "classified"
  genesis_stage: 2
  tags: ["#mod_work", "#project:atlas-frames", "#who:maria"]
```

### 9.3 Reverso (AtomItem → Gmail labels)

```typescript
// Quando MindRoot atualiza um item, gmail-sync re-aplica labels no Gmail
function serializeToGmailLabels(item: AtomItem): string[] {
  const labels: string[] = [];

  // Estágio
  const stageLabel = { 1: "@1-inbox", 2: "@2-classified",
                       5: "@5-connected", 7: "@7-committed" }[item.genesis_stage];
  if (stageLabel) labels.push(stageLabel);

  // Módulo (sem vértice)
  if (item.module) {
    const prefix = { work: "00", body: "01", mind: "02", family: "03",
                     purpose: "04", bridge: "05", finance: "06", social: "07" }[item.module];
    labels.push(`${prefix}.${item.module}`);
  }

  // Vértice (extrai de #project:X)
  const projectTag = item.tags.find(t => t.startsWith("#project:"));
  if (projectTag && item.module) {
    const vertex = projectTag.replace("#project:", "");
    const prefix = { work: "00", purpose: "04", bridge: "05" }[item.module];
    if (prefix) labels.push(`${prefix}.${item.module}/${vertex}`);
  }

  // Pessoas
  const whoTags = item.tags.filter(t => t.startsWith("#who:"));
  for (const t of whoTags) labels.push(`who/${t.replace("#who:", "")}`);

  return labels;
}
```

---

## Parte 10 — Tags Semânticas Reservadas

Espelha **Genesis v5.0.4 §10**. Esta spec usa subset + adições próprias.

### 10.1 Tags do Genesis (consumidas)

| Prefixo | Exemplo | Origem na Gmail |
|---------|---------|-----------------|
| `#mod_*` | `#mod_bridge` | Aplicado a partir da label de módulo (Camada 1) |
| `#who:*` | `#who:maria` | Aplicado a partir de label `who/X` (Camada 4) |
| `#project:*` | `#project:atlas-frames` | Aplicado a partir de sub-label de vértice (Camada 2) |

### 10.2 Tags introduzidas por esta spec (escopo Gmail)

Nenhuma. Esta spec usa apenas tags reservadas do Genesis. Não introduz vocabulário novo — espelha o existente.

---

## Parte 11 — Exemplo: Do Email ao AtomItem

Um email real passando pelas 4 camadas em tempo real.

### 11.0 Contexto

Email da Anthropic chega na inbox sobre release de Claude Sonnet 4.6.

### 11.1 Camada 0 — Email cru entra

```
From: claude-team@anthropic.com
Subject: Claude Sonnet 4.6 is now available
Body: ...
labels: ["INBOX"]  // só Gmail nativo
```

### 11.2 Camada 1 — Filtro de módulo dispara

Filtro #8 (`from:(...anthropic.com...)`) casa.

```
labels: ["INBOX", "05.bridge"]
```

**Auto. Sem interrupção.**

### 11.3 Camada 2 — Sub-vértice opcional

Filtro #6 (`subject:("atom engine"...)`) NÃO casa (subject não menciona atom engine). Sub-vértice fica vazio. OK.

```
labels: ["INBOX", "05.bridge"]
```

### 11.4 Camada 3 — Humano lê, classifica

Humano abre, lê, confirma que é relevante. Aplica `@2-classified` via atalho de teclado custom.

```
labels: ["INBOX", "05.bridge", "@2-classified"]
```

### 11.5 gmail-sync entra (futuro)

Edge function `gmail-sync` puxa emails com label `@2-classified` ainda sem `gmail_message_id` em items.

```sql
INSERT INTO items (
  user_id, title, type, module, tags,
  state, genesis_stage, source, body
) VALUES (
  auth.uid(),
  'Claude Sonnet 4.6 is now available',
  'note',  -- triage decide tipo
  'bridge',
  ARRAY['#mod_bridge'],
  'classified',
  2,
  'gmail-sync',
  '{"gmail_message_id": "...", "from": "claude-team@anthropic.com"}'::jsonb
);
```

Edge function aplica `@5-connected` no Gmail.

```
labels: ["INBOX", "05.bridge", "@5-connected"]
```

### 11.6 MindRoot renderiza

Email aparece no Pipeline view, módulo `bridge`, estágio Linha (—), pronto pra avançar pro Triângulo (estrutura) via input do humano.

### 11.7 Humano arquiva

Após ler/processar no MindRoot, humano arquiva no Gmail aplicando `@7-committed`.

```
labels: ["05.bridge", "@7-committed"]  // Gmail removeu INBOX no archive
```

MindRoot detecta (via gmail-sync) e move item pro state `committed`. Memória, não ação pendente.

**Tempo total humano:** ~10 segundos (abrir email + atalho `@2-classified` + arquivar).

---

## Parte 12 — Fronteiras (esta spec vs. outras)

Espelha **Genesis v5.0.4 §12** (Fronteira Genesis vs Marco Zero).

| Assunto | Vive em | Motivo |
|---------|---------|--------|
| 4 camadas de classificação | Esta spec | É taxonomia de email |
| 19 labels (8 mod + 7 vert + 4 stage) | Esta spec | Nomes canônicos das labels |
| 10 filtros ativos (Gmail UI) | Esta spec | Search criteria + apply label |
| Sintaxe Gmail filter (limites de wildcards etc.) | Esta spec | Específico do Gmail |
| Enum AtomModule (8 valores) | Genesis §4.2 | É schema |
| Tags reservadas (`#mod_*`, `#who:*`, etc.) | Genesis §10 | É schema |
| 7 estágios state machine | Genesis §2 | É schema |
| `gmail-sync` edge function (implementação) | feature_conectores | É boca, não taxonomia |
| Triage AI confidence bands | feature_triage | É motor, não label |
| Aurora Gate (esconder antes de 08h) | Marco Zero (futuro) | É operacional, não taxonomia |
| Escopo de cada módulo (work=Atlas, body=health, etc.) | Esta spec §2.1 | É aplicação dos módulos ao escopo email |

---

## Parte 13 — Roadmap

| Fase | O que acontece | Status |
|------|----------------|--------|
| F1 | Reconectar Gmail no Cowork com permissões corretas | bloqueado por política Atlas |
| F2 | Criar 19 labels (8 módulos + 7 vértices + 4 estágios) | ✅ done 06 Mai 2026 (Claude in Chrome UI) |
| F3 | Configurar 10 filtros ativos da §5.1 | ✅ done 07 Mai 2026 (Claude in Chrome UI) |
| F4 | Aplicar labels ao histórico (one-time) | **pendente — escopo conservador apenas** (decisão Rick: não aplicar ao histórico, só novos emails) |
| F5 | `gmail-sync` (MindRoot) lê labels como input do Triage | depende do F2 Conectores no MindRoot |
| F6 | Atalhos de teclado custom no Gmail (mark as `@2-classified`) | F2 |
| F7 | Aurora Gate via Inbox Pause add-on (esconder email antes de 08h) | adiado pra após F5 |
| F8 | Audit Queries SQL implementadas (Parte 7) | depende F5 |

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 06 Mai 2026 | Documento inicial. Taxonomia de 4 camadas (módulo, vértice, estágio, pessoa) derivada de ATOM.md v1.4, PENTAGON.md v3.4, Identidade v1.2, Conectores v1.0, Raiz v1.0. Filtros heurísticos para o Gmail. F2 executada via Claude in Chrome após bloqueio de gmail.modify pela política corporativa Atlas. |
| 1.1 | 07 Mai 2026 | F3 executada (10 filtros ativos). Spec atualizada com sintaxe real de filtros do Gmail (wildcards no `from:` não funcionam — substituídos por listas concretas). Stripe.com movido de `06.finance` para `00.work` (é receita Atlas, não despesa). `01.body` virou híbrido fitness+médico (domínios AU concretos: Medibank, Bupa, AHM, MyGov). `04.purpose/yugar` absorveu `04.purpose` módulo-level (cabin/property/council/realestate). `05.bridge` módulo-level adicionado (github/vercel/supabase/anthropic/claude.ai/openai/notion/figma/linear/cloudflare). Filtros automáticos para `constellation/lab/muda` removidos por regra dos galhos do ATOM.md. Filtro `03.family` removido por keyword genérica demais. F4 marcada como conservadora (não aplicar ao histórico). |
| 1.2 | 07 Mai 2026 | **Audit Genesis pós-feedback Rick.** Re-estruturada em 13 partes espelhando arquitetura do Genesis v5.0.4. Adicionadas: Parte 4 (Schema das Labels) com hierarquia, estados e multiplicidade; Parte 7 (Audit Queries) em SQL; Parte 9 (Serialização) com função pura `deserializeGmailLabels()` + reverso; Parte 11 (Exemplo end-to-end completo); Parte 12 (Fronteiras explícitas vs Genesis/feature_conectores/Marco Zero). Tags do envelope alinhadas com Genesis §10 (`#mod_bridge` adicionada). Cross-check declarado no header. Zero mudanças nos filtros operacionais — só rigor estrutural. |

---

*Email é uma das 4 bocas universais do Engine OS.*
*A geometria do Atom não para na borda do MindRoot.*
*Se o email entra pelo mesmo lugar que tudo, ele segue a mesma geometria desde a origem.*
