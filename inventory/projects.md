# Inventário de Projects Claude.ai — registro vivo

**Atualizado:** 2026-05-13
**Lido por:** Arca (Marco 0) · Claude Code (terminal) · Cowork (browser)
**Mantido por:** quem cria/encerra um Project commita aqui

---

## Como ler

| Coluna | O que é |
|--------|---------|
| Slug | identificador único kebab-case (usado em nome de chat, INDEX.md, etc) |
| Painel | nome literal no painel claude.ai |
| Hub | Marco 0 / Espiral Trabalho / Espiral Pessoal / Standalone |
| Status | `active` / `dormant` / `archived` / `absorved` / `manual` |
| INDEX | path do doc-mãe em `ventures/[slug]/INDEX.md` se aplicável |
| Criado | YYYY-MM-DD |
| Encerrado | YYYY-MM-DD ou `—` |

---

## Hubs

| Slug | Painel | Tipo | Status |
|------|--------|------|--------|
| marco-0 | Marco 0 | hub central (dev/arquitetura, Arca) | active |
| espiral-trabalho | Espiral do Trabalho | hub operacional pro (Pentágono V1-V5 + Atlas Frames) | active |
| espiral-pessoal | Espiral Pessoal | hub vida (Mt Samson família + arquivo pessoal + MindRoot Kids) | active |

## Standalone

| Slug | Painel | Tipo | Status | Nota |
|------|--------|------|--------|------|
| espaco-entre | O Espaço Entre / Project E. | standalone sensível | manual | sem touchpoint com hubs (D-007); processamento manual |
| atom-entre | Atom Entre | standalone sensível | manual | processamento manual |
| rubens | Rubens | standalone sensível | manual | fora de migração automática |

## Ventures ativas

| Slug | Painel | Hub | Status | INDEX | Criado | Encerrado |
|------|--------|-----|--------|-------|--------|-----------|
| atlas-atom | Atlas Atom | Marco 0 | active | ventures/atlas-atom/INDEX.md (TBD) | 2026-04-29 | — |
| mistico | (sem Project Claude — repo standalone Caligrafia da Alma) | Marco 0 + Espiral Pessoal | active | — | 2026-04-06 | — |

## Ventures dormentes (Onda 3 — arquivamento pós-extração)

Conteúdo migrado para destinos finais; Projects ficam dormentes no painel. Ver D-009 §5 para destinos.

| Slug | Painel | Hub | Status | INDEX | Encerrado |
|------|--------|-----|--------|-------|-----------|
| macro-vision | Macro Vision | Marco 0 | dormant | ventures/macro-vision/INDEX.md (TBD) | pendente |
| anthropic | Anthropic | Marco 0 | absorved | KB-twin de Macro Vision; sem INDEX próprio | 2026-05-13 |
| atom-claude | Atom Claude (= MindRoot v1) | Marco 0 | dormant | ventures/atom-claude/INDEX.md (TBD) | pendente |
| mindmate-tag-v1 | MindMate | Marco 0 | dormant | ventures/mindmate-tag-v1/INDEX.md (TBD) | pendente |
| atom-engine-4-0 | Atom Engine 4.0 | Marco 0 | dormant | ventures/atom-engine-4-0/INDEX.md (TBD) | pendente |
| ramalho-os | Ramalho Os | Marco 0 | dormant | ventures/ramalho-os/INDEX.md (TBD) | pendente |
| atom-drive | Atom Drive | Marco 0 | dormant | ventures/atom-drive/INDEX.md (TBD) | pendente |

## Ventures absorvidas (Onda 1 — consolidação)

Migram conteúdo para repos/destinos finais. Sem INDEX próprio em ventures/ — vivem nos repos consolidados.

| Slug | Painel | Destino | Status |
|------|--------|---------|--------|
| constellation-system | Constellation System | repo constellation-os (a criar) · /methodology/ | pendente |
| constellation-os | Constellation OS | repo constellation-os (a criar) · /app/ | pendente |
| atlas-frames-ecossistema | Atlas Frames Ecossistema | dividido: parte Constellation → repo constellation-os /case-studies/atlas-frames/ · parte Atlas → ventures/atlas-frames/ | pendente |
| atlas-frames | Atlas Frames | ventures/atlas-frames/ | pendente |
| atlas-lab-workshop | Atlas Lab Workshop Shed Container | já absorvido em atlas-atom (products/workshop-shed-container/) | absorved |
| rob-super | Rob super Landing page | sub-frente de Atlas Frames (atlasframes.com.au/) | absorved |

## Onda 2 — split (sem Project novo)

| Slug | Painel | Destino |
|------|--------|---------|
| mt-samson | 1874 Mount Samson | conteúdo família → KB Espiral Pessoal · conteúdo Yugar Commons venture → KB Espiral Trabalho V4 |

---

## Convenção de manutenção

1. **Cada criação** de Project: nova linha aqui via commit (job dedicado ou inline na sessão de criação).
2. **Cada encerramento**: atualizar `Status` e preencher `Encerrado: YYYY-MM-DD`.
3. **Sem deletar linhas** — Projects encerrados permanecem registrados como histórico.
4. **Sem reescrever histórico** — apenas adiciona ou atualiza.

---

*Source of truth dos Projects Claude.ai · D-010 §2 e §5 governam a manutenção.*
