╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     template                   ║
║ module:   bridge                     ║
║ state:    connected                  ║
║ status:   active                     ║
║ stage:    5 ⬠ Pentágono              ║
║ tags:     [#mod_bridge, #template,   ║
║            #gmail, #automation,      ║
║            #claude-chrome]           ║
║ source:   claude-project             ║
║ created:  2026-05-07                 ║
║ updated:  2026-05-07                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: email-organization   ║
║                  v1-2                ║
║   → feeds: claude-chrome execution   ║
╚══════════════════════════════════════╝

# Template: Email Reorganization Prompt

**Versão:** 1.0
**Data:** 07 Mai 2026
**Tipo:** Prompt template pra Claude in Chrome
**Pareado com:** `system_spec_email-organization_v1-2.md`

---

## Quando usar

Cole esse prompt numa **sessão limpa do Claude in Chrome** (browser conectado via extensão) quando precisar:

1. **Limpar filtros antigos** que sobreviveram ao sistema pré-Atom
2. **Aplicar os 10 filtros do Atom ao histórico** (backfill one-time)

Use **só uma vez** por execução. Operação majoritariamente irreversível — Gmail não tem undo de aplicação em massa.

---

## Avisos críticos

- **Não tem undo nativo.** Se aplicar filtro errado em milhares de threads, recuperação é manual.
- **Volume alto.** Inbox principal (99+) + SUBSCRIPTION (milhares) = múltiplos minutos de processing.
- **Política Atlas bloqueia gmail.modify via API** — precisa ser UI automation via Claude in Chrome.
- **Confirme antes de cada batch destrutivo.** O prompt já pede confirmação, mas reforça quando colar.

---

## Pré-requisitos

- 19 labels do Atom criadas (8 mods + 7 vértices + 4 estágios) — ✅ feito 06 Mai 2026
- 10 filtros do Atom configurados — ✅ feito 07 Mai 2026
- Browser Chrome conectado à conta `rr@atlasframes.com.au` (Atlas Frames Mail)

---

## O Prompt (copy-paste)

```
# Reorganizar Gmail pra geometria do Atom

## Contexto

Eu sou o Rick (rr@atlasframes.com.au). Tenho:
- 19 labels do Atom já criadas no Gmail (8 módulos + 7 vértices + 4 estágios)
- 10 filtros do Atom configurados aplicando essas labels
- ~50+ filtros antigos remanescentes do sistema antigo (pré-Atom)
- Inbox grande (99+ na inbox principal, milhares em SUBSCRIPTION)

Quero duas tarefas no Gmail via UI (Claude in Chrome). API tá bloqueada por política Atlas, então vai ter que ser navegação na UI mesmo.

## Tarefa A — Apagar filtros antigos

Apagar TODOS os filtros do Gmail EXCETO:

1. **Os 10 filtros do Atom** (lista canônica abaixo) — preservar
2. **Filtros "Delete it" anti-spam** — preservar por padrão (apagam newsletter lixo automaticamente; perdê-los = lixo volta na inbox). Listar pra mim antes de apagar caso eu queira refazer.

### Os 10 filtros do Atom (preservar)

Identifica pelo "Apply label" — se a label aplicada está nesta lista, é Atom e fica:

| # | Search criteria (resumo) | Apply label |
|---|--------------------------|-------------|
| 1 | from:atlasframes.com.au OR to:atlasframes.com.au | 00.work/atlas-frames |
| 2 | from:(monday.com OR stripe.com) OR subject:(invoice/fatura/pedido/order) | 00.work |
| 3 | from:(strava/myfitnesspal/whoop/oura/medibank/bupa/ahm/my.gov.au) OR subject:(workout/training/fitness/consulta/exame/appointment/prescription/pathology) | 01.body |
| 4 | from:(medium/substack/readwise/kindle/goodreads) | 02.mind |
| 5 | subject:(yugar/"mt samson"/"mount samson"/cabin/property/council/realestate) | 04.purpose/yugar |
| 6 | subject:("atom engine"/genesis/pentagon/pentágono) | 05.bridge/atom-engine |
| 7 | from:mindroot.com.au OR subject:(mindroot/"mind root") | 05.bridge/mindroot |
| 8 | from:(github/vercel/supabase/anthropic/claude.ai/openai/notion/figma/linear/cloudflare) | 05.bridge |
| 9 | from:(paypal/xero/quickbooks/ato.gov.au/afterpay/commbank/nab/anz/westpac) | 06.finance |
| 10 | from:(linkedin/linkedinmail/facebook/facebookmail/instagram/x.com/twitter/reddit/discord) | 07.social |

### Workflow

1. Settings → Filters and Blocked Addresses
2. Lista todos os filtros visíveis (pode ter 50+, role tudo)
3. Pra cada filtro, classifica:
   - "Apply label" bate com algum dos 10 acima → PRESERVA
   - "Do this: Delete it" sem outras ações → PRESERVA (anti-spam)
   - Qualquer outro caso → MARCA pra deletar
4. Antes de clicar Delete, ME MOSTRA a lista do que vai apagar pra eu confirmar
5. Confirma → marca todos os checkboxes em batch → Delete → OK no diálogo

## Tarefa B — Aplicar os 10 filtros ao histórico

Depois que A terminar, aplicar os 10 filtros do Atom aos emails históricos (one-time backfill).

### Aviso importante (LER antes)

- Vai aplicar labels em **muito email de uma vez** (inbox + arquivos + SUBSCRIPTION com milhares de threads)
- **Não tem undo nativo no Gmail**
- Se algum filtro estiver muito amplo, vai gerar falso positivo em massa
- Tempo de processamento: minutos a horas dependendo do volume
- Se eu errar, posso deletar a label de threads específicos manualmente, mas não em batch

### Workflow

Pra cada um dos 10 filtros do Atom (lista acima):

1. Settings → Filters → encontra o filtro
2. Click "Edit"
3. Click "Continue" (passa pela tela de critério)
4. Marca o checkbox **"Also apply filter to matching conversations"**
5. Click "Update filter"
6. Aguarda processamento (Gmail mostra "Processing..." brevemente)
7. Vai pro próximo filtro

Faz na ordem que considerar mais segura — sugiro do mais restrito pro mais amplo (atlas-frames primeiro porque é só domínio Atlas; social/finance por último porque podem pegar volume alto).

## Coisas pra checar comigo durante

- ANTES de apagar filtros antigos: lista o que vai apagar, espera meu OK
- ANTES de cada apply-to-history: confirma qual filtro vai rodar e estimativa de impacto
- Se algo der erro inesperado (filtro não edita, label não existe, etc.): para e me avisa, não improvisa

## Estado final esperado

- ~10 filtros ativos no Gmail (os do Atom)
- + os "Delete it" anti-spam preservados
- Inbox + arquivos rotulados pela geometria do Atom (módulo + vértice quando aplicável)
- Estágios `@2-classified`, `@5-connected`, `@7-committed` ainda em zero (são aplicados manualmente / por gmail-sync no futuro)

Bora.
```

---

## Notas de execução

### Ordem sugerida pra Tarefa B (apply-to-history)

Do mais restrito pro mais amplo (minimiza risco de falso positivo em massa):

1. `00.work/atlas-frames` — só domínio Atlas, baixíssimo risco
2. `05.bridge/atom-engine` — keywords muito específicas
3. `05.bridge/mindroot` — domínio + subject específico
4. `04.purpose/yugar` — keywords médio-específicas (cuidado com `property`/`council` em outros contextos)
5. `02.mind` — domínios de leitura, baixo risco
6. `01.body` — domínios + keywords médicas, médio risco (pode pegar consulta de cliente)
7. `00.work` — `invoice/fatura/pedido/order` é amplo, médio-alto risco
8. `06.finance` — bancos AU + serviços, médio-alto risco
9. `05.bridge` — muitos domínios dev, alto volume
10. `07.social` — redes sociais, **maior volume esperado** (LinkedIn manda email diariamente)

### Se algo der errado durante execução

- **Filtro pegou massa errada** (ex: 07.social pegou 5000 emails legítimos em vez de social)
  - Buscar `label:07.social` na search bar
  - Selecionar emails errados
  - "Remove label: 07.social" via menu

- **Label não aparece no dropdown** (label foi deletada por engano)
  - Recriar via Labels → Create new label, com mesmo nome
  - Re-criar filtro apontando pra ela

- **Browser desconecta no meio**
  - Re-conecta, retoma de onde parou
  - Verificar última label aplicada pra saber em qual filtro retomar

### Pareado com gmail-sync (futuro F5)

Quando o `gmail-sync` da F2 do MindRoot ficar pronto, ele:
1. Lê emails com label `@2-classified` (estágio 2 — humano confirmou)
2. Cria AtomItem no Supabase
3. Deserializa labels do Gmail → fields do AtomItem (ver `system_spec_email-organization_v1-2.md` §9)
4. Aplica `@5-connected` no Gmail (fecha o loop)

A backfill da Tarefa B desta execução não dispara `gmail-sync` automaticamente — emails históricos com labels Atom só viram items quando o humano aplica `@2-classified` ou quando F5 implementar varredura de histórico.

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 07 Mai 2026 | Template inicial. Prompt auto-contido pra Claude in Chrome executar limpeza de filtros antigos + apply-to-history dos 10 filtros do Atom. Pareado com `system_spec_email-organization_v1-2.md` §5.1. |

---

*Template é instrumento. Spec é contrato. O prompt cola um no outro.*
