╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   bridge                     ║
║ state:    connected                  ║
║ status:   active                     ║
║ stage:    5 ⬠ Pentágono              ║
║ tags:     [#feature, #boca,          ║
║            #gmail, #organizacao]     ║
║ source:   claude-project             ║
║ created:  2026-05-06                 ║
║ updated:  2026-05-07                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: ATOM.md              ║
║   → references: PENTAGON.md          ║
║   → references: feature_conectores   ║
║   → references: feature_raiz         ║
║   → references: feature_triage       ║
║   → references: v1-0 (esta versão)   ║
║   → feeds: gmail-sync edge function  ║
╚══════════════════════════════════════╝

# Spec: Email Organization (Gmail Labels)

**Versão:** 1.1
**Data:** 07 Mai 2026
**Status:** active
**Princípio:** "Se existe no digital, tem como entrar." Email é uma das 4 bocas universais do Engine OS (camada 7 — Netzach). Esta spec define como o Gmail é organizado *na origem*, espelhando a geometria do Atom, antes de virar AtomItem via `gmail-sync`.

---

## 1. Identidade

Taxonomia de labels do Gmail — espelho externo da geometria interna do Atom. Cada email no Gmail já carrega seu module, seu vértice e seu estágio antes de virar item.

---

## 2. Propósito

O Raiz mapeia "o que existe". Os Conectores trazem "o que existe" pra dentro. Esta spec resolve a etapa intermediária: organizar o que ainda *está fora* (no Gmail) usando exatamente a mesma geometria que vai governar quando estiver *dentro* (no MindRoot). O resultado: zero impedância entre as duas camadas. Quando o `gmail-sync` finalmente puxar um email, ele já vem rotulado com module/vértice/estágio — o Triage consome a label, não inventa a classificação.

**Não é:** automação genérica de inbox zero. Não é Sanebox. Não é regra de prioridade. É o **Genesis aplicado ao Gmail**.

---

## 3. Estrutura — 4 camadas

### Camada 1 — Módulo (8 universais)

Mapeia 1:1 com os 8 módulos do Genesis. Cada label leva o prefixo numérico para ordem lexicográfica no Gmail.

| Label | Módulo | Cobertura |
|-------|--------|-----------|
| `00.work` | work | Atlas Frames, clientes, faturamento, operação |
| `01.body` | body | Saúde, médicos, exames, exercício, nutrição |
| `02.mind` | mind | Cursos, leituras, newsletters, aprendizado |
| `03.family` | family | Família, casa, escola, parentes |
| `04.purpose` | purpose | Yugar, propósito, longo prazo, legado |
| `05.bridge` | bridge | Atom Engine, dev, infra, documentação cross-vértice |
| `06.finance` | finance | Bancos, impostos, investimentos, contadoria |
| `07.social` | social | Amigos, eventos, redes, lazer |

**Regra:** todo email pertence a exatamente um módulo. Se ambíguo entre dois → vai pro mais específico (ex: fatura de academia = `01.body`, não `06.finance`).

### Camada 2 — Vértice/Projeto (Pentágono + Hexágono)

Sub-labels dentro do módulo de origem, refletindo PENTAGON.md.

| Label | Vértice | Status no Pentágono |
|-------|---------|---------------------|
| `00.work/atlas-frames` | ⬡ Atlas | active (Monday.com) |
| `04.purpose/yugar` | V4 Yugar | concept (vision doc existe) |
| `05.bridge/atom-engine` | centro | active (este repo) |
| `05.bridge/mindroot` | V1 MindRoot | active (mindroot.com.au) |
| `05.bridge/constellation` | V2 | paused — label criada, sem filtro automático |
| `05.bridge/lab` | V3 | concept — label criada, sem filtro automático |
| `05.bridge/muda` | V5 | concept — label criada, sem filtro automático |

**Regra dos galhos (do ATOM.md):** vértice só ganha **filtro automático** quando tem flow ativo. `lab/muda/constellation` ficam **com label criada mas sem filtro** até serem reativados — emails relevantes pra esses vértices são classificados manualmente quando aparecem (raros, por definição).

### Camada 3 — Estágio (state machine do Genesis)

Espelha os 7 estágios do Genesis, mas só os 4 relevantes pro Gmail (1, 2, 5, 7). Estágios 3-4 e 6 acontecem dentro do MindRoot.

| Label | Estágio | Geometria | Significado no Gmail |
|-------|---------|-----------|----------------------|
| `@1-inbox` | inbox | · Ponto | Chegou agora, sem triagem. Equivale a `INBOX` do Gmail. |
| `@2-classified` | classified | — Linha | Module + tipo definidos. Sabe o que é, ainda não virou item. |
| `@5-connected` | connected | ⬠ Pentágono | Já virou AtomItem no MindRoot via `gmail-sync`. Conectado ao grafo. |
| `@7-committed` | committed | ○ Círculo | Resolvido. Pode arquivar. Memória, não ação pendente. |

**Regra:** o estágio do email no Gmail nunca regride. Se um item commitado precisar voltar à ação, vira item novo no inbox (Genesis: "nada se perde, mas o UUID é eterno — versão nova é versão nova").

### Camada 4 — Pessoas (`#who:`)

Conforme `feature_conectores_v1-0.md` §4 (API deployed) já prevê tag `#who:`. No Gmail isso vira sub-label criada sob demanda.

| Padrão | Exemplo |
|--------|---------|
| `who/[primeiro-nome-kebab]` | `who/joao-silva`, `who/maria` |

**Regra:** só criar `who/X` quando há ≥3 threads com a pessoa OU quando ela é counterparty de algo crítico (advogado, contador, parceiro de negócio).

---

## 4. Total de labels iniciais

- **Camada 1:** 8 labels de módulo
- **Camada 2:** 7 labels de vértice (sub-labels)
- **Camada 3:** 4 labels de estágio
- **Camada 4:** 0 inicialmente (criadas sob demanda)

**Total:** 19 labels na primeira execução.

---

## 5. Filtros do Gmail (executados)

Como a conta corporativa Atlas bloqueia escopo `gmail.modify` via API externa, a classificação acontece via **filtros nativos do Gmail** (Settings → Filters and Blocked Addresses → Create new filter), executados via Claude in Chrome (UI automation).

### 5.0 Considerações de sintaxe

A sintaxe de filtros do Gmail tem limites importantes que afetam esta spec:

- **Wildcards `*` no campo `from:` não funcionam.** `from:(*bank*)` falha. Solução: listar domínios concretos.
- **Operadores válidos:** `from:`, `to:`, `subject:`, `list:`, `has:attachment`, `OR`, `-` (negação), `"frase exata"`.
- **Filtros aplicam labels mas não regridem estágios.** Não há lógica condicional além de match/no-match.

### 5.1 Filtros ativos (10 — pós-execução)

Estado pós-execução em 07 Mai 2026:

| # | Search criteria | Apply label | Origem |
|---|-----------------|-------------|--------|
| 1 | `from:atlasframes.com.au OR to:atlasframes.com.au` | `00.work/atlas-frames` | v1.0 §5.2 |
| 2 | `from:(monday.com OR stripe.com) OR subject:(invoice OR fatura OR pedido OR order)` | `00.work` | v1.0 §5.1 |
| 3 | `from:(strava.com OR myfitnesspal.com OR whoop.com OR oura.com OR medibank.com.au OR bupa.com.au OR ahm.com.au OR my.gov.au) OR subject:(workout OR training OR fitness OR consulta OR exame OR appointment OR prescription OR pathology)` | `01.body` | v1.0 §5.1 (médico AU) + extensão fitness |
| 4 | `from:(medium.com OR substack.com OR readwise.io OR kindle.com OR goodreads.com)` | `02.mind` | v1.0 §5.1 (parcial) |
| 5 | `subject:(yugar OR "mt samson" OR "mount samson" OR cabin OR property OR council OR realestate)` | `04.purpose/yugar` | v1.0 §5.1+§5.2 fundidos |
| 6 | `subject:("atom engine" OR genesis OR pentagon OR pentágono)` | `05.bridge/atom-engine` | v1.0 §5.2 (refinado: "atom engine" em vez de "atom" para evitar match genérico) |
| 7 | `from:mindroot.com.au OR subject:(mindroot OR "mind root")` | `05.bridge/mindroot` | v1.0 §5.2 |
| 8 | `from:(github.com OR vercel.com OR supabase.io OR supabase.com OR anthropic.com OR claude.ai OR openai.com OR notion.so OR figma.com OR linear.app OR cloudflare.com)` | `05.bridge` | v1.0 §5.1 (expandido com figma, linear, cloudflare) |
| 9 | `from:(paypal.com OR xero.com OR quickbooks.com OR ato.gov.au OR afterpay.com OR commbank.com.au OR nab.com.au OR anz.com.au OR westpac.com.au)` | `06.finance` | v1.0 §5.1 (concretizado para domínios AU; `stripe.com` movido para `00.work` por ser receita Atlas) |
| 10 | `from:(linkedin.com OR linkedinmail.com OR facebook.com OR facebookmail.com OR instagram.com OR x.com OR twitter.com OR reddit.com OR discord.com)` | `07.social` | v1.0 §5.1 (expandido com x/twitter/reddit/discord) |

**Configuração comum:** todos sem skip inbox, mark read, star, ou apply to history. **Apenas label.**

### 5.2 Filtros decididos como não-ativos

| Filtro proposto na v1.0 | Decisão na v1.1 | Razão |
|-------------------------|-----------------|-------|
| `03.family` (genérico) | **Não criado** | Keyword `family/familia/mãe/pai/filho/filha` é ampla demais; gera falso positivo em emails de marketing. Aguarda popular com domínios/remetentes reais. |
| `05.bridge/constellation` | **Não criado** (label existe) | V2 está `paused` no PENTAGON; regra dos galhos do ATOM.md: filtro automático só pra vértice ativo. |
| `05.bridge/lab` | **Não criado** (label existe) | V3 `concept`. Idem regra dos galhos. |
| `05.bridge/muda` | **Não criado** (label existe) | V5 `concept`. Idem regra dos galhos. |
| Aurora Gate (§5.4 v1.0) | **Adiado** | Filtro pra esconder email antes de 08h. Implementação via Inbox Pause add-on é mais robusta que filtro nativo. |

### 5.3 Estágio aplicado por humano ou edge function

- `@1-inbox` → padrão para tudo que chega (não precisa de filtro, é a INBOX nativa)
- `@2-classified` → aplicar quando você lê e classifica módulo (atalho de teclado custom recomendado, ver F6)
- `@5-connected` → aplicado pelo `gmail-sync` quando vira AtomItem (futuro)
- `@7-committed` → aplicar manualmente ao arquivar resolvido

---

## 6. Regras de manutenção

Espelham os "Rituais de manutenção" do `feature_raiz_v1-0.md` §4.

| Cadência | Ritual | O que fazer |
|----------|--------|-------------|
| Semanal | Inbox zero | Tudo em INBOX deve ter pelo menos `@2-classified` ou voltar pra `@1-inbox` se incompleto. |
| Mensal | Review de módulo | Audit: cada módulo tem volume razoável? Algum está sumido (sinal de regressão de domínio no Raiz)? |
| Trimestral | Audit de filtros | Filtros ainda fazem sentido? Pessoas mudaram? Domínios novos pra adicionar? `who/X` ainda relevantes? Vértices `paused/concept` viraram `active`? |

---

## 7. Conexões com outras specs

| Com | Relação | Detalhe |
|-----|---------|---------|
| `feature_conectores_v1-0.md` | feeds | Define a base; esta spec especifica o lado externo (Gmail) da boca |
| `feature_raiz_v1-0.md` | mirrors | `00-07` módulos = chão dos 9 domínios do Raiz; `domain:communication` é o saco que recebe tudo isso |
| `feature_triage_v1-0.md` | feeds | Quando `gmail-sync` puxa um email, o Triage lê as labels (module + vértice) e propõe esses valores com confidence alta |
| `gmail-sync` edge function | implements | A função consome estas labels como source of truth na ingestão |

---

## 8. Roadmap

| Fase | O que acontece | Status |
|------|----------------|--------|
| F1 | Reconectar Gmail no Cowork com permissões corretas | bloqueado por política Atlas |
| F2 | Criar 19 labels (8 módulos + 7 vértices + 4 estágios) | ✅ done 06 Mai 2026 via Claude in Chrome (UI) |
| F3 | Configurar 10 filtros ativos da §5.1 manualmente no Gmail UI | ✅ done 07 Mai 2026 via Claude in Chrome (UI) |
| F4 | Aplicar labels ao histórico (one-time) | **pendente — escopo conservador apenas** (decisão Rick: não aplicar ao histórico, só novos emails) |
| F5 | `gmail-sync` (MindRoot) lê estas labels como input do Triage | depende do F2 Conectores no MindRoot |
| F6 | Atalhos de teclado custom no Gmail (mark as @2-classified) | F2 |
| F7 | Aurora Gate via Inbox Pause add-on (esconder email antes de 08h) | adiado pra após F5 |

---

## 9. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 06 Mai 2026 | Documento inicial. Taxonomia de 4 camadas (módulo, vértice, estágio, pessoa) derivada de ATOM.md v1.4, PENTAGON.md v3.4, Identidade v1.2, Conectores v1.0, Raiz v1.0. Filtros heurísticos para o Gmail. F2 executada via Claude in Chrome após bloqueio de gmail.modify pela política corporativa Atlas. |
| 1.1 | 07 Mai 2026 | F3 executada (10 filtros ativos). Spec atualizada com sintaxe real de filtros do Gmail (wildcards no `from:` não funcionam — substituídos por listas concretas). Stripe.com movido de `06.finance` para `00.work` (é receita Atlas, não despesa). `01.body` virou híbrido fitness+médico (domínios AU concretos: Medibank, Bupa, AHM, MyGov). `04.purpose/yugar` absorveu `04.purpose` módulo-level (cabin/property/council/realestate). `05.bridge` módulo-level adicionado (github/vercel/supabase/anthropic/claude.ai/openai/notion/figma/linear/cloudflare). Filtros automáticos para `constellation/lab/muda` removidos por regra dos galhos do ATOM.md (vértice só ganha filtro quando ativo). Filtro `03.family` removido por keyword genérica demais — aguarda concretizar. F4 marcada como conservadora (não aplicar ao histórico). |

---

*A geometria do Atom não para na borda do MindRoot. Se o email entra pelo mesmo lugar que tudo, ele segue a mesma geometria desde a origem.*
