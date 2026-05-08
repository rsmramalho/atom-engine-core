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
║   → references: feature_conectores   ║
║   → references: feature_raiz         ║
║   → references: feature_triage       ║
║   → feeds: gmail-sync edge function  ║
╚══════════════════════════════════════╝

# Spec: Email Organization (Gmail Labels)

**Versão:** 1.0
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
| `05.bridge/constellation` | V2 | paused |
| `05.bridge/lab` | V3 | concept |
| `05.bridge/muda` | V5 | concept |

**Regra dos galhos (do ATOM.md):** vértice só ganha label dedicada quando tem flow ativo. `lab/muda/constellation` ficam criados mas dormindo até serem reativados.

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

## 5. Filtros sugeridos do Gmail

Como a conta corporativa Atlas bloqueia escopo `gmail.modify` via API externa, a classificação acontece via **filtros nativos do Gmail** (Settings → Filters and Blocked Addresses → Create new filter). Os padrões abaixo são heurísticas — refinam com uso.

### 5.1 Por módulo (Camada 1)

| Label alvo | Critério (Gmail filter syntax) |
|------------|-------------------------------|
| `00.work` | `from:(*@atlasframes.com.au) OR from:(monday.com) OR from:(stripe.com) OR subject:(invoice OR fatura OR pedido OR order)` |
| `01.body` | `from:(*medicare* OR *health* OR *clinic* OR *hospital* OR *gym*) OR subject:(consulta OR exame OR appointment OR prescription)` |
| `02.mind` | `from:(*substack* OR *medium.com* OR *coursera* OR *udemy* OR newsletter@*) OR list:(*newsletter*)` |
| `03.family` | `from:(family-domain OR escola-do-filho OR pediatra)` |
| `04.purpose` | `subject:(yugar OR samson OR cabin OR property) OR from:(realestate OR council)` |
| `05.bridge` | `from:(github.com OR vercel.com OR supabase.io OR anthropic.com OR claude.ai OR openai.com OR notion.so)` |
| `06.finance` | `from:(*bank* OR *bancos* OR ato.gov.au OR *broker* OR *invest*) OR subject:(extrato OR statement OR tax OR imposto)` |
| `07.social` | `from:(facebook OR instagram OR linkedin OR meetup OR eventbrite)` |

### 5.2 Por vértice (Camada 2)

| Label alvo | Critério |
|------------|----------|
| `00.work/atlas-frames` | `from:(*@atlasframes.com.au) OR subject:(atlas frames)` — auto também aplica `00.work` |
| `05.bridge/mindroot` | `subject:(mindroot) OR from:(*@mindroot.com.au) OR has:(mindroot)` |
| `05.bridge/atom-engine` | `subject:(atom OR genesis OR pentagon)` |
| `04.purpose/yugar` | `subject:(yugar OR mt samson) OR from:(*council* OR *survey*)` |

### 5.3 Por estágio (Camada 3)

Estágios são aplicados manualmente ou via lógica de:
- `@1-inbox` → padrão para tudo que chega (não precisa de filtro, é a INBOX nativa)
- `@2-classified` → aplicar quando você lê e classifica módulo (atalho de teclado custom recomendado)
- `@5-connected` → aplicado pelo `gmail-sync` quando vira AtomItem (futuro)
- `@7-committed` → aplicar manualmente ao arquivar resolvido

### 5.4 Filtro especial — Aurora Gate

Reforça a regra do ATOM.md §○ Círculo: "não abrir email antes das 08h."

Crie um filtro que marca emails recebidos antes de 08h com label `@aurora-skip` e remove de INBOX, retornando à inbox depois das 08h via filtro inverso ou via Inbox Pause add-on. Isso protege o ritual aurora.

---

## 6. Regras de manutenção

Espelham os "Rituais de manutenção" do `feature_raiz_v1-0.md` §4.

| Cadência | Ritual | O que fazer |
|----------|--------|-------------|
| Semanal | Inbox zero | Tudo em INBOX deve ter pelo menos `@2-classified` ou voltar pra `@1-inbox` se incompleto. |
| Mensal | Review de módulo | Audit: cada módulo tem volume razoável? Algum está sumido (sinal de regressão de domínio no Raiz)? |
| Trimestral | Audit de filtros | Filtros ainda fazem sentido? Pessoas mudaram? `who/X` ainda relevantes? |

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
| F2 | Criar 19 labels (8 módulos + 7 vértices + 4 estágios) | ✅ done 07 Mai 2026 via Claude in Chrome (UI) |
| F3 | Configurar filtros do §5 manualmente no Gmail UI | pendente |
| F4 | Aplicar labels ao histórico (one-time) | pendente — requer decisão sobre escopo (conservador vs agressivo) |
| F5 | `gmail-sync` (MindRoot) lê estas labels como input do Triage | depende do F2 Conectores no MindRoot |
| F6 | Atalhos de teclado custom no Gmail (mark as @2-classified) | F2 |

---

## 9. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 07 Mai 2026 | Documento inicial. Taxonomia de 4 camadas (módulo, vértice, estágio, pessoa) derivada de ATOM.md v1.4, PENTAGON.md v3.4, Identidade v1.2, Conectores v1.0, Raiz v1.0. Filtros heurísticos para o Gmail. F2 executada via Claude in Chrome após bloqueio de gmail.modify pela política corporativa Atlas. |

---

*A geometria do Atom não para na borda do MindRoot. Se o email entra pelo mesmo lugar que tudo, ele segue a mesma geometria desde a origem.*
