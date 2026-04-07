╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   bridge                     ║
║ state:    connected                  ║
║ status:   active                     ║
║ stage:    5 ⬠ Pentagono              ║
║ tags:     [#system, #agent,          ║
║            #filesystem, #cli]        ║
║ source:   claude-project             ║
║ created:  2026-04-05                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4 §8.4 ║
║   → feeds: feature_conectores       ║
╚══════════════════════════════════════╝

---
title: "Atom Agent — O Braco Fisico do Atom HS"
type: spec
module: work
tags: [atom-hs, atom-agent, filesystem, scanner, raiz, local-agent]
status: draft
source: claude-project
created: 2026-04-04
updated: 2026-04-04
connections:
  - target: spec_atom-genesis-v5-schema-v2
    relation: references
  - target: spec_marco-zero_v2-0
    relation: references
  - target: roadmap_atom-hs_v6-0
    relation: feeds
---

# Atom Agent v1.0
## O Braco Fisico do Atom HS

**Versao:** 1.0
**Data:** 04 Abr 2026
**Status:** Draft
**Principio:** Se existe no digital, tem como entrar. O Agent e a porta de entrada do mundo fisico.

---

## Parte 1 — Visao

### O problema

A vida digital de uma pessoa acumula caos em camadas: anos de Downloads nao processados, fotos espalhadas em 3 contas de email, documentos vitais misturados com lixo, contas e logins em dezenas de servicos. Nenhum sistema de produtividade toca esse passado — todos assumem que o usuario ja esta organizado.

### A solucao

O Atom Agent e o braco fisico do Atom HS. Ele faz o que o MindRoot nao pode: acessa o filesystem local, conecta em APIs de servicos, escaneia o caos digital e passa tudo pela esteira Genesis. Arquivos sao fisicamente movidos, renomeados, deduplicados e indexados. O MindRoot mostra o resultado. O Raiz e o painel de controle.

### Os tres tempos

| Tempo | O que resolve | Quem resolve |
|-------|--------------|--------------|
| **Futuro** | Tudo novo ja nasce no lugar certo | MindRoot (captura -> pipeline -> commit) |
| **Presente** | Dia a dia, rituais, wraps | MindRoot (ja funciona) |
| **Passado** | Anos de baguca digital acumulada | **Atom Agent** (scan -> pipeline -> organiza) |

### Posicao na arquitetura

```
Atom HS (Human Systems)
|
+-- Engine          <- Genesis v5, schema, regras (cerebro)
+-- MindRoot        <- web/mobile UI (porta da frente)
+-- Atom Agent      <- organiza o mundo digital real (braco fisico)
+-- Conectores      <- Gmail, Calendar, Drive APIs (portas de entrada)
```

Todos escrevem na mesma tabela `items` no Supabase. Mesmo pipeline Genesis. Mesmos 7 estagios. O item que o Agent cria ao mover um PDF e o mesmo item que aparece no MindRoot.

---

## Parte 2 — Arquitetura (de dentro pra fora)

### 2.1 Camada 1 - Schema — `body.locations` (plural)

O coracao. Um item que referencia um arquivo fisico precisa saber onde ele vive — e um arquivo pode viver em mais de um lugar (local + cloud mirror). Nenhuma migracao necessaria — o campo `body` ja e JSONB.

```typescript
// Dentro do body JSONB de qualquer item que referencia um arquivo
interface FileRef {
  // Identidade do arquivo (nivel do item, nao da location)
  hash: string;            // SHA-256 do arquivo (dedup)
  mime: string;            // ex: "application/pdf"
  size: number;            // bytes
  original_path: string;   // ex: "C:/Users/rsmra/Downloads/invoice_atlas.pdf"

  // Onde o arquivo vive (pode ter mais de um)
  locations: FileLocation[];
}

interface FileLocation {
  service: 'local' | 'google-drive' | 'icloud' | 'dropbox' | 'onedrive';
  root: string;            // ex: "C:/AtomDrive" ou "My Drive"
  path: string;            // ex: "mod-work/project-atlas/invoice-apr-2026.pdf"
  role: 'primary' | 'mirror';  // primary = organizado (AtomDrive), mirror = backup (cloud)
  synced_at: string;       // ISO-8601 — ultima vez que confirmou que o arquivo existe la
}
```

**Estrategia: Mirror (decisao 04 Abr 2026)**

O AtomDrive local e a versao organizada (`role: primary`). Cloud e o backup (`role: mirror`). O Agent baixa da cloud pro local organizado E indexa as duas localizacoes no Supabase. Nada e deletado da cloud.

```
Fase 1 (agora):
  Cloud (baguca) --download--> AtomDrive (organizado)
  Cloud fica como esta          role: primary (local)
                                role: mirror (cloud, desorganizado)

Fase 2 (futuro):
  Agent organiza a cloud        Drive espelha a estrutura do AtomDrive
  Cloud (organizado) <-mirror-> AtomDrive (organizado)
                                True mirror. Mesma estrutura. Mesmo nome.
```

**Regras:**
- `body.locations` e opcional em qualquer item. Presente quando o item referencia um arquivo.
- `path` e relativo ao `root`. O `root` pode mudar (ex: mover o AtomDrive pra outro disco) sem invalidar os items.
- `original_path` preserva de onde veio — auditoria, nunca se perde. Vive no nivel do item (nao da location).
- `hash` e a identidade do arquivo. Dois arquivos com mesmo hash sao duplicatas, independente de nome, path, ou service.
- `locations[0]` e sempre o primary. Demais sao mirrors.
- Um item pode existir sem `body.locations` (uma task, um wrap). Um arquivo processado sempre tem.
- `synced_at` permite detectar mirrors desatualizados — se o primary mudou depois do ultimo sync, o mirror precisa de refresh.

### 2.2 Camada 2 - Pipeline — Genesis aplicado a arquivos

Os mesmos 7 estagios da Genesis v5 Part 2. O arquivo e o item.

| # | Estagio | O que acontece com o arquivo |
|---|---------|------------------------------|
| 1 | Ponto . | Arquivo detectado no source (local ou cloud). Item criado no inbox: title=filename, body.original_path preenchido. |
| 2 | Linha — | Classificado: extensao + metadata + nome + conteudo -> type, module, tags (#domain:*). |
| 3 | Triangulo | Naming convention aplicada. Destino calculado. body.locations[0].path preenchido com path futuro no AtomDrive. |
| 4 | Quadrado | Validado: dedup (hash check), lixo? vital? Decisao registrada. Aguarda aprovacao humana. |
| 5 | Pentagono | Connections sugeridas (pertence a qual projeto? qual dominio?). |
| 7 | Circulo | **ACAO FISICA.** Se source=local: move. Se source=cloud: download pro AtomDrive. Renomeado. Locations preenchidas (primary + mirror). Item commitado. |

**Regras do pipeline de arquivos:**
- **A acao fisica so acontece no estagio 7.** Ate la, o arquivo nao saiu do lugar. Seguro por design.
- **Source local:** move (arquivo sai do source -> AtomDrive). **Source cloud:** download (copia pro AtomDrive, original fica na cloud como mirror).
- **Aprovacao humana obrigatoria** entre estagio 4 e 7. O Agent propoe, o humano confirma.
- **Auto-approve** permitido apenas para regras de altissima confianca: duplicata obvia (hash match 100%), lixo obvio (extensoes: .tmp, .cache, .exe, .msi, .dmg quando nao e installer desejado).
- **Estagio 6 (propagacao) e skip** — nao tem cascata no processamento de arquivo. Pode ter no futuro (ex: mover um projeto move todos os arquivos do projeto).
- **Lixo** nao e deletado — e movido pra `AtomDrive/lixo/`. Review a cada 30 dias (regra Genesis de entropia). Deletar de verdade e decisao humana.

### 2.3 Camada 3 - Scanner Contract — interface comum

Cada dominio do Raiz tem um tipo de caos diferente. Cada tipo de caos precisa de um scanner diferente. Mas todos produzem a mesma coisa: items no inbox do Supabase.

```typescript
// Contrato que todo scanner implementa
interface ScannerPlugin {
  name: string;                    // ex: "filesystem", "gmail", "photos"
  source_type: string;             // ex: "local", "google-api", "browser"

  // Escaneia e retorna items candidatos (NAO move nada ainda)
  scan(config: ScanConfig): Promise<ScanResult[]>;

  // Executa a acao aprovada (move, delete, rename)
  execute(approved: ScanResult[]): Promise<ExecuteResult[]>;
}

interface ScanConfig {
  path?: string;                   // filesystem: path do folder
  account?: string;                // api: email/account
  deep?: boolean;                  // recursivo vs shallow
  since?: string;                  // data minima (ISO-8601)
  dry_run?: boolean;               // so lista, nao propoe
}

interface ScanResult {
  // Identificacao
  original_path: string;           // de onde veio
  hash: string;                    // SHA-256
  mime: string;
  size: number;
  file_date: string;

  // Classificacao (proposta pelo scanner)
  proposed_title: string;          // titulo limpo
  proposed_type: AtomType;
  proposed_module: AtomModule;
  proposed_tags: string[];         // inclui #domain:*
  proposed_destination: string;    // path relativo no AtomDrive
  proposed_filename: string;       // nome final (naming convention)

  // Decisao
  action: 'move' | 'trash' | 'duplicate' | 'skip' | 'manual';
  confidence: number;              // 0-100
  reasoning: string;               // explicacao da decisao
  duplicate_of?: string;           // item_id se for duplicata
}
```

**Scanners planejados:**

| Scanner | Source | Dominio(s) Raiz | O que faz |
|---------|--------|-----------------|-----------|
| `filesystem` | local disk | arquivos, documentos, financas | Escaneia folders, classifica por extensao+nome+conteudo |
| `gmail` | Gmail API | comunicacao, documentos | Lista emails, indexa contatos, extrai attachments |
| `photos` | Google Photos API | memorias | Lista albuns, metadata EXIF, detecta duplicatas |
| `calendar` | Google Calendar API | tempo | Lista eventos, timezone, rotinas |
| `drive` | Google Drive API | arquivos, todos | Lista arquivos no Drive, classifica |
| `browser` | Chrome export | identidade | Bookmarks, senhas exportadas, extensoes |

**Principio:** cada scanner e um plugin independente. Se Gmail falha, filesystem continua. Novos scanners podem ser adicionados sem mudar o Agent core.

### 2.4 Camada 3 - Regras — classificacao, dedup, naming

#### Classificacao por extensao (regras estaticas, confidence alta)

| Extensao | Type | Module default | Confidence |
|----------|------|----------------|------------|
| .pdf | resource | bridge | 70% (precisa de contexto) |
| .jpg/.jpeg/.png/.heic/.webp | resource | family | 75% |
| .mp4/.mov/.avi | resource | family | 75% |
| .xlsx/.csv | resource | finance | 70% |
| .docx/.doc | doc | work | 65% |
| .md/.txt | note | mind | 60% |
| .pptx | doc | work | 70% |
| .zip/.rar/.7z | resource | bridge | 50% |
| .exe/.msi/.dmg/.pkg | trash | — | 95% (auto-trash) |
| .tmp/.cache/.crdownload | trash | — | 99% (auto-trash) |

#### Classificacao por nome (regex patterns, refinam a extensao)

| Pattern | Refinamento | Tags adicionais |
|---------|-------------|-----------------|
| `invoice`, `fatura`, `receipt`, `recibo` | module->finance | #domain:financas |
| `passport`, `passaporte`, `visa`, `certidao` | module->bridge | #domain:documentos, #vital-doc |
| `contract`, `contrato`, `lease` | module->bridge | #domain:documentos, #vital-doc |
| `IMG_`, `DSC_`, `photo` | mantem family | #domain:memorias |
| `screenshot`, `Screen Shot`, `Captura` | module->bridge | — |
| `resume`, `curriculo`, `cv` | module->work | #domain:documentos |
| `recipe`, `receita` (culinaria) | module->body | #domain:saude |
| `prescription`, `receita` (medica) | module->body | #domain:saude |

#### Classificacao por conteudo (Haiku, so quando ambiguo)

Quando confidence < 70% apos extensao + nome, o Agent chama o triage-classify edge function com contexto extra:

```json
{
  "input": "arquivo: contrato_2024_final.pdf",
  "context": "filesystem scan | domain: documentos | mime: application/pdf | size: 245KB | modified: 2024-03-15"
}
```

O Haiku retorna type, module, tags, confidence — mesmo formato que o triage do MindRoot.

#### Deduplicacao

```
1. Calcular SHA-256 do arquivo
2. Buscar no Supabase: SELECT id, title FROM items WHERE body->'location'->>'hash' = $hash
3. Se encontrou:
   a. action = 'duplicate'
   b. duplicate_of = item_id existente
   c. confidence = 100%
   d. Auto-approve -> lixo (o original ja existe organizado)
```

#### Naming Convention

A mesma do Genesis Part 8.4 e Meta-Template Part 8, aplicada ao filename:

`[prefixo]_[tipo]_[descricao-curta]_[versao-ou-data].ext`

Exemplos:
- `invoice_atlas.pdf` -> `mod-finance_resource_invoice-atlas_2026-04.pdf`
- `IMG_20240315.jpg` -> `mod-family_resource_foto_2024-03-15.jpg`
- `passaporte_scan.pdf` -> `mod-bridge_resource_passaporte-au.pdf`
- `planilha gastos 2024.xlsx` -> `mod-finance_resource_controle-gastos_2024.xlsx`

**Regras do rename:**
1. Tudo minusculo
2. Espacos e underscores -> hifens dentro de segmentos
3. Underscores separam segmentos (prefixo, tipo, descricao, data)
4. Caracteres especiais removidos (acentos mantidos como opcao, decisao futura)
5. O Agent propoe o nome. O humano pode override.

### 2.5 Camada 4 - Agent — o executor

#### Tecnologia

Python CLI. Escolha fundamentada:
- Acesso filesystem nativo (pathlib, shutil, hashlib)
- Bibliotecas Google API maduras (google-api-python-client)
- OCR quando necessario (pytesseract, pdf2text)
- Supabase Python SDK (supabase-py)
- Empacotavel como executavel (PyInstaller) pro futuro app local
- Claude Code executa Python perfeitamente

#### Repo

`rsmramalho/atom-agent` — repo novo. Parte do ecossistema Atom HS.

#### CLI Interface — 6 modos, uma esteira

```bash
# SCAN — organizar
atom-agent scan <path>                    # scan folder local
atom-agent scan <path> --deep             # recursivo
atom-agent scan <path> --dry-run          # so lista, sem propor
atom-agent scan --source gmail <account>  # scan email
atom-agent scan --source photos <account> # scan Google Photos
atom-agent scan --source calendar         # scan calendarios
atom-agent scan --source drive <folder>   # scan Google Drive folder

# WATCH — monitorar
atom-agent watch <path>                   # monitora folder (default: daily)
atom-agent watch <path> --interval 1h     # a cada hora
atom-agent watch --schedule "08:00"       # scan diario as 08h
atom-agent watch --list                   # quais paths estao sendo monitorados
atom-agent watch --stop                   # para o daemon

# CLEAN — limpar
atom-agent clean                          # scan o AtomDrive inteiro
atom-agent clean <path>                   # scan path especifico
atom-agent clean --duplicates             # so duplicatas (hash match cross-AtomDrive)
atom-agent clean --large 100MB            # arquivos maiores que threshold
atom-agent clean --cache                  # cache de apps (Chrome, npm, pip, etc.)
atom-agent clean --empty                  # pastas vazias
atom-agent clean --stale 90d              # arquivos nao acessados ha 90+ dias

# PROTECT — proteger
atom-agent protect                        # audit completo
atom-agent protect --vitals               # vital docs (#vital-doc) tem mirror?
atom-agent protect --mirrors              # primary e mirror estao em sync?
atom-agent protect --hashes               # re-verificar hashes (detecta corrupcao)
atom-agent protect --report               # gera relatorio de saude do AtomDrive

# MIGRATE — migrar
atom-agent migrate photos --from r.r@saystay.com --to r@ramalho.au
atom-agent migrate email --from rsmramalhoss@gmail.com --to r@ramalho.au
atom-agent migrate drive --from "My Drive" --to C:/AtomDrive
atom-agent migrate --plan                 # mostra plano sem executar
atom-agent migrate --status               # progresso de migracoes em andamento

# ENTROPY — entropia
atom-agent entropy                        # roda regras de entropia
atom-agent entropy --trash 30d            # lixo com 30+ dias -> propoe deletar
atom-agent entropy --stale                # items stale no Supabase -> propoe arquivar
atom-agent entropy --seeds                # extrai seeds de items arquivados
atom-agent entropy --report               # relatorio de entropia

# UTILITY
atom-agent process                        # processa items pendentes (stage 4->7)
atom-agent process --auto                 # auto-approve alta confianca (>=95%)
atom-agent process --item <item_id>       # processa item especifico
atom-agent status                         # resumo geral
atom-agent status --domain financas       # status por dominio Raiz
atom-agent init                           # setup inicial
atom-agent init --root C:/AtomDrive       # define root
```

#### Configuracao

```yaml
# ~/.atom-agent/config.yaml
supabase:
  url: "https://avvwjkzkzklloyfugzer.supabase.co"
  service_key: "..." # stored encrypted
  user_id: "acc24249-ad6d-4378-a382-e1fbbcdec1d2"

atomdrive:
  root: "C:/AtomDrive"

scan:
  auto_trash_extensions: [".tmp", ".cache", ".crdownload", ".exe", ".msi", ".dmg"]
  auto_approve_threshold: 95
  default_source: "atom-agent"

watch:
  paths:
    - "C:/Users/rsmra/Downloads"
    - "C:/Users/rsmra/Desktop"
  schedule: "daily"
  time: "08:00"
```

### 2.6 Camada 4 - AtomDrive — o filesystem organizado

```
C:/AtomDrive/
+-- inbox/                        <- arquivos ambiguos aguardando triagem
+-- mod-work/
|   +-- project-atlas/
|   +-- project-mindroot/
|   +-- project-constellation/
|   +-- library/
+-- mod-body/
|   +-- library/
+-- mod-mind/
|   +-- library/
+-- mod-family/
|   +-- 2024/
|   +-- 2025/
|   +-- 2026/
+-- mod-purpose/
+-- mod-bridge/
|   +-- documents/                <- documentos vitais (#vital-doc)
|   +-- library/
+-- mod-finance/
|   +-- library/
+-- mod-social/
+-- system/
|   +-- templates/
|   +-- logs/
+-- lixo/                         <- duplicatas, tmp, review a cada 30 dias
    +-- duplicatas/
    +-- trash/
```

**Regras do AtomDrive:**
1. **Espelho do Genesis.** Mesma estrutura do Genesis Part 8.5 — modulos como raiz.
2. **Cresce de dentro pra fora.** Pastas so sao criadas quando o primeiro arquivo vai pra la.
3. **Fotos organizam por ano.** mod-family/ usa subpastas por ano (metadata EXIF ou file date).
4. **Projects sao pastas.** mod-work/project-[nome]/ agrupa tudo do projeto.
5. **Documents vitais separados.** mod-bridge/documents/ com tag #vital-doc — passaporte, contrato, certidao.
6. **Lixo tem subpastas.** Duplicatas separadas de trash generico. Review em 30 dias.
7. **Root configuravel.** Pode ser C:/AtomDrive, D:/AtomDrive, /mnt/nas/atomdrive — qualquer path.
8. **O Agent nunca cria a estrutura vazia.** Sem pastas fantasma.

### 2.7 Camada 5 - Superficie — como aparece

#### No MindRoot (web/mobile)

Items criados pelo Agent aparecem normalmente no app:
- No inbox (estagio 1-4, aguardando aprovacao)
- No pipeline (estagio 4+)
- Nos modulos (apos commit)
- No Raiz (por dominio)

O campo `source: 'atom-agent'` identifica itens do scanner. O `body.location` mostra o path real.

#### No Raiz (painel de controle)

Cada dominio mostra:
- Items indexados (arquivos reais com path)
- Status: quantos arquivos, tamanho total, ultimo scan
- Botao: "escanear" — dispara scan no dominio relevante
- Alertas: duplicatas encontradas, vital docs sem backup, arquivos stale

#### Na CLI (terminal)

O Agent mostra progresso, propoe decisoes, aguarda confirmacao. Output colorido, claro, sem jargao tecnico.

---

## Parte 3 — Scanners por Dominio

### 3.1 Scanner: filesystem (prioridade 1)
**Dominios:** arquivos, documentos, financas, memorias, saude, projetos
**Source:** pastas locais (Downloads, ORGANIZAR, Desktop, etc.)
**Primeira entrega. O mais importante. Resolve o passado.**

### 3.2 Scanner: gmail (prioridade 2)
**Dominios:** comunicacao, documentos (attachments), identidade (contatos)
**Source:** Gmail API (OAuth2)

### 3.3 Scanner: photos (prioridade 3)
**Dominios:** memorias
**Source:** Google Photos API

### 3.4 Scanner: calendar (prioridade 2)
**Dominios:** tempo
**Source:** Google Calendar API

### 3.5 Scanner: drive (prioridade 3)
**Dominios:** arquivos, todos
**Source:** Google Drive API

### 3.6 Scanner: browser (prioridade 4)
**Dominios:** identidade
**Source:** Chrome exported data

---

## Parte 4 — Decisoes de Design

### 4.1 Aprovacao humana e sagrada
O Agent **nunca** move, renomeia, ou deleta sem aprovacao. Excecoes: duplicata hash 100%, extensoes auto-trash (.tmp, .cache, .crdownload).

### 4.2 Nada se perde
Arquivo movido pro lixo nao e deletado. Fica em `AtomDrive/lixo/` por 30 dias. Depois, o wrap pergunta.

### 4.3 CLI primeiro, app depois
Motor primeiro, casca depois.

### 4.4 O Agent nao e o MindRoot
MindRoot e web/mobile. Agent e local. Ambos escrevem no mesmo Supabase.

### 4.5 Cada scanner e independente
Se Gmail falha, filesystem continua.

### 4.6 AtomDrive e agnostico de plataforma
O root e um path. Windows, Linux, NAS — tanto faz.

### 4.7 Mirror, nao centralizar (decisao 04 Abr 2026)
AtomDrive e o organizado (primary), cloud e o backup (mirror). Nada e deletado da cloud.

---

## Parte 5 — O Que Muda

### 5.1 No Genesis v5
Nada muda no schema. `body.locations` e JSONB — ja cabe.

### 5.2 No Roadmap (Espiral 2)
F1 Raiz ganha o Agent como componente. F2 Conectores ganham API scanners.

### 5.3 No PENTAGON.md
Atom Agent e componente do V1 (Atom HS), nao um vertice novo.

### 5.4 Novo repo
`rsmramalho/atom-agent` — Python, pip install, CLI entry point.

```
atom-agent/
+-- README.md
+-- pyproject.toml
+-- src/
|   +-- atom_agent/
|       +-- __init__.py
|       +-- cli.py              <- entry point (click ou typer)
|       +-- config.py           <- ~/.atom-agent/config.yaml
|       +-- core/
|       |   +-- scanner.py      <- ScannerPlugin interface
|       |   +-- classifier.py   <- regras de classificacao
|       |   +-- dedup.py        <- SHA-256 hash + Supabase check
|       |   +-- namer.py        <- Genesis naming convention
|       |   +-- mover.py        <- move/download + Supabase commit
|       |   +-- hasher.py       <- SHA-256 + integridade
|       +-- commands/
|       |   +-- scan.py
|       |   +-- watch.py
|       |   +-- clean.py
|       |   +-- protect.py
|       |   +-- migrate.py
|       |   +-- entropy.py
|       +-- scanners/
|       |   +-- filesystem.py   <- prioridade 1
|       |   +-- gmail.py
|       |   +-- photos.py
|       |   +-- calendar.py
|       |   +-- drive.py
|       |   +-- browser.py
|       +-- supabase_client.py  <- connection + CRUD
+-- tests/
```

---

## Parte 6 — Sequencia de Build

### Espiral A — O motor (scan + process)
1. `body.locations` documentado + tipo no type-schemas
2. `core/` — classifier, dedup, namer, hasher (unit tests)
3. `scanners/filesystem.py` — escaneia folder, produz ScanResult[]
4. `core/mover.py` + supabase_client — move arquivo + cria item
5. `commands/scan.py` + `cli.py` — fluxo completo
6. `atom-agent scan ~/Downloads --dry-run` — primeira corrida
7. `atom-agent scan C:/ORGANIZAR --deep` — **A faxina grande**

### Espiral B — O sentinela (watch)
8-10. Daemon + scheduler + auto-approve rules

### Espiral C — O faxineiro (clean)
11-13. Duplicatas cross-AtomDrive + large/cache/empty/stale + relatorio

### Espiral D — O guardiao (protect)
14-16. Vitals audit + mirrors/hashes + relatorio de saude

### Espiral E — O consolidador (migrate + entropy)
17-20. Migracao entre servicos + ciclo de vida + integracao com wrap

### Espiral F — Superficie
21-24. API scanners + MindRoot Raiz integration + app local

---

## Versionamento

| Versao | Data | Mudanca |
|--------|------|---------|
| 1.0 | 04 Abr 2026 | Spec inicial — visao, arquitetura inside-out, schema body.locations (mirror), pipeline Genesis pra arquivos, scanner contract, regras de classificacao, 6 modos operacionais (scan/watch/clean/protect/migrate/entropy), CLI, AtomDrive structure, 6 scanners planejados, sequencia de build em 6 espirais. Decisao: mirror (C) — AtomDrive primary, cloud mirror. |

---

*O Atom Agent e o braco fisico do Atom HS. Organiza, monitora, limpa, protege, migra, e recicla. O MindRoot organiza o que voce pensa. O Agent organiza o que ja existe. Juntos, cobrem passado, presente e futuro. De dentro pra fora.*
