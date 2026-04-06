# Feature: Conectores

**Versão:** 1.0
**Data:** 05 Abr 2026
**Status:** parcial
**Visão futura:** Yugar Vision §3–4 (fluxos de email e pipeline de ingestão)

---

## 1. Identidade

Portas de entrada — tudo que existe no digital tem caminho pra dentro.

---

## 2. Propósito

O Raiz mapeia "o que existe". Os Conectores fazem "o que existe" entrar no sistema. Três bocas, uma esteira: MindRoot (captura manual), API (Gmail + Calendar), Agent Local (filesystem). Tudo que entra vai pro inbox como qualquer outro item. O Triage classifica. O Pipeline matura. O Genesis não muda — o que muda é quantas coisas entram.

**Princípio:** "Se existe no digital, tem como entrar." A promessa do Human Systems se materializa aqui.

---

## 3. Não é

- **Não é ação.** Conectores são leitura + ingestão (Espiral 2). Ações (enviar email, criar evento, mover arquivo) são Espiral 3 (Seed: Escudo).
- **Não é sync bidirecional.** Dados fluem pra dentro, não pra fora. MindRoot não edita o Gmail.
- **Não é Zapier.** Conectores são integração nativa, não automação genérica.

---

## 4. Estado atual

### API (deployed)

- Google OAuth unificado (um provider, um refresh token, múltiplos scopes)
- Edge functions: connector-auth, calendar-sync, gmail-sync (3 deployed)
- Calendar: OAuth + sync funcionando
- Gmail: edge function existe, end-to-end pendente de teste
- Painel de conectores em Settings (conectado/desconectado/erro)
- connector-service.ts + useConnectors hook

### Agent Local (repo criado)

- Repo `rsmramalho/atom-agent` (17 files, 678 LOC, Python CLI)
- Scanner: SHA-256 hash, dedup
- Classifier: 15 extensões + 8 regex de nome + confidence bands
- Namer: Genesis §8.4 naming convention
- Mover: post-move integrity verification
- CLI: `atom-agent scan <path>` com aprovação humana
- Falta: ROADMAP.md + CLAUDE.md, index no Supabase end-to-end

### Arquivos

```
src/service/connector-service.ts
src/hooks/useConnectors.ts
supabase/functions/connector-auth/
supabase/functions/calendar-sync/
supabase/functions/gmail-sync/
```

---

## 5. Visão

### Espiral 2 (agora)

- Gmail starred → items no inbox
- Calendar timezone fix (UTC → AEST)
- Atom Agent docs + integration com Supabase

### Espiral 3 (Seed: Escudo)

- Ações: enviar email, criar evento, mover arquivo
- Calendar: blocos rituais (aurora/zênite/crepúsculo) como eventos recorrentes
- Gmail: drafts compostos no MindRoot
- Agent: watch mode (daemon), Haiku fallback pra classificação

### Longo prazo (Yugar Vision)

- RSS polling (Library Feed)
- TMDB integration (filmes/séries)
- Google Photos migration
- Sensores IoT → Supabase
- Captura por voz (Whisper local)

---

## 6. Conexões

| Com | Relação | Detalhe |
|-----|---------|---------|
| Raiz | feeds | Conectores alimentam domínios (Calendar→tempo, Gmail→comunicação, Agent→arquivos) |
| Pipeline | feeds | Items de conectores entram no estágio 1 |
| Triage | feeds | Items de conectores passam pelo Triage |
| Library | feeds | Library Feed futuro usa infraestrutura de conectores |
| Settings | belongs_to | Painel de conectores vive em Settings |

---

## 7. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 05 Abr 2026 | Documento inicial — 3 edge functions, Atom Agent v0.1, visão Escudo + Yugar |
