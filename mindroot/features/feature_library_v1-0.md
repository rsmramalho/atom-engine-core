╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   work                       ║
║ state:    connected                  ║
║ status:   active                     ║
║ stage:    5 ⬠ Pentagono              ║
║ tags:     [#feature, #galho,         ║
║            #pilar-action]            ║
║ source:   claude-project             ║
║ created:  2026-04-05                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4 §4.4 ║
║   → feeds: feature_graph            ║
╚══════════════════════════════════════╝

# Feature: Library

**Versão:** 1.0
**Data:** 05 Abr 2026
**Status:** live
**Wireframe:** `design/wireframes/mindroot-wireframe-library-reflexoes.html`
**Visão futura:** Yugar Vision §9 (Library Feed — Soberania de Atenção)

---

## 1. Identidade

Acervo universal — tudo que entrou no sistema, curado, buscável, finito.

---

## 2. Propósito

A Library é onde o conteúdo vive depois de passar pelo pipeline. Hoje é o acervo interno — specs, receitas, reflexões, tudo que o Rick capturou e que o Genesis maturou. No futuro é o ponto onde o mundo externo encontra o sistema interno — RSS, newsletters, podcasts, filmes, recomendações de pessoas. Sem algoritmo de engajamento. Finito. Quando acabou, vai viver.

**Princípio (Yugar Vision):** "Soberania de atenção — feed curado, finito, sem algoritmo de engajamento. A mente é protegida."

---

## 3. Não é

- **Não é o Raiz.** Library é acervo universal pra busca e consumo. Raiz é diagnóstico de saúde por domínio. Library abraça a abundância. Raiz protege a intimidade.
- **Não é inbox.** Inbox é Pipeline/Triage. Library mostra items que já passaram pelo pipeline (stage 2+). Items no stage 1 não aparecem aqui.
- **Não é Google Drive.** Drive é export/impressora. Library é a view dentro do MindRoot. Dados vivem no Supabase.
- **Não é Netflix.** Quando o Library Feed chegar, ele é finito. 10 items por dia máximo. Sem infinite scroll. Sem "porque você assistiu X."
- **Não é read-later app.** Não é Pocket/Instapaper. Items entram pelo pipeline Genesis. Classificados, conectados, commitados. Não é "salvar pra nunca ler."

---

## 4. Estado atual

### O que existe (código live)

- Library como page fixa no BottomNav (`/library`)
- Search bar com fulltext
- Filtros: module (8 pills), type (scrollable), domain Raiz
- Sort: recentes, stage, módulo
- Cards tipados: recipe (tempo/serves), workout (tags), reflection (soul shift), spec (preview), podcast/article (meta)
- Tab "Reflexões": timeline emocional, filtro por emoção, soul summary (shift mais comum)
- Conectado ao `useItems` hook (query Supabase)

### O que falta do wireframe

- Search overlay com quick filters (type:, module:, #tag prefixos)
- Cards com preview de notes (2 linhas truncadas)
- Recipe cards com stats inline (tempo, serves, cuisine)
- Workout cards com streak counter
- Sort por módulo com agrupamento visual

### Arquivos

```
src/pages/Library.tsx
src/hooks/useItems.ts (compartilhado)
src/components/shared/ItemCard.tsx (compartilhado)
```

---

## 5. Visão

### Curto prazo (Espiral 2)

- Search overlay completo com quick filters
- Cards com preview de notes
- Receita completa (link entre Library e "ver receita" com ingredients/steps)
- Filtro por domain Raiz integrado (vindo do Raiz "ver na library →")

### Médio prazo (Espiral 3 — Library Feed)

- RSS polling worker (Edge Function ou cron) — blogs, podcasts, YouTube
- Newsletters via alias email (library@ramalho.au → Gmail → pipeline)
- TMDB integration (filmes/séries)
- Regras de curadoria:
  - "Desse canal, quero tudo" → polling integral
  - "Dessa newsletter, só o que menciona IA" → filtro keyword
  - "Dessa pessoa, qualquer recomendação" → tag `#who:*`
- Cap diário: 10 items/dia. Excedente vai pra fila, não pra tela
- Feed finito. Sem infinite scroll. Acabou → vai viver
- Items consumidos → wrap registra → seed ou archive

### Longo prazo (Yugar Vision)

- Library na cozinha: touchscreen com filmes/séries curados pela família
- Library compartilhada: `#who:flora` recomendou, família vê
- Library como view contextual por building (casa, workshop, commons)
- Soberania total: RSS + Miniflux self-hosted + IA local = zero dependência

---

## 6. Conexões

| Com | Relação | Detalhe |
|-----|---------|---------|
| Raiz | feeds | Raiz domain detail tem "ver na library →" que abre Library com filtro `#domain:*` |
| Pipeline | feeds | Items que passaram pelo pipeline (stage 2+) aparecem na Library |
| Triage | feeds | Triage classifica → item maduro → aparece na Library |
| Conectores | feeds | Conectores (Gmail, Calendar, RSS futuro) alimentam Library via inbox → pipeline |
| Soul | references | Tab Reflexões é view emocional do soul layer |
| Wrap | references | Items commitados no wrap aparecem na Library |
| Search | belongs_to | Search overlay é parte da Library |
| Companheiro | references | Companheiro pode sugerir "baseado no que está na sua Library..." |

---

## 7. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 05 Abr 2026 | Documento inicial — estado atual, visão (incl. Library Feed), separação clara do Raiz |
