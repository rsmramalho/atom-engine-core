# ATOM WRAP — 12 Mai 2026 (espirais-docs-lei)

**Tema:** docs-lei das 2 Espirais novas + ADR D-007 commitados em PR único
**Continuação de:** `system_wrap_2026-05-12_audit-e-topologia.md` + `system_wrap_2026-05-12_mineracao-topologia.md`
**Ritual:** crepúsculo

---

## CREATED

- `law/system_spec_espiral-do-trabalho_v1-0.md` (~400 linhas) — Pentágono canônico × 3 camadas operacionais; V1 cross-cutting; V4 split limpo; Atlas Frames como Hexágono ⬡
- `law/system_spec_espiral-pessoal_v1-0.md` (~310 linhas) — 3 frentes (Mt Samson família, arquivo pessoal, MindRoot Kids cíclica) + V1 uso pessoal; privacidade primária; sem KPI
- `decisions/d-007_topologia-consolidada-pos-mineracao_2026-05-12.md` (~260 linhas) — ADR mãe; 7 sub-decisões inline; 1 pendência aberta; 4 alternativas consideradas; validação contra Genesis v5.0.4, Marco Zero v3.1, Meta-Template v1.2, Identidade v1.3, D-004, D-005, D-006
- `job_espirais-d007_2026-05-12.md` (artefato descartável de execução, não commitado)

**Commit atômico** em `atom-engine-core/main`.

## MODIFIED

(nenhum — todos arquivos novos)

## DECIDED

1. **Pentágono canônico INTACTO** — V1 MindRoot (O Espelho), V2 Constellation, V3 Lab, V4 Yugar, V5 Muda, centro Atom Engine, ⬡ Atlas Frames. Identidade v1.3 §2.6 referência canônica. A topologia organiza camadas operacionais, não muda o Pentágono.
2. **V1 MindRoot atravessa as 3 camadas** — Marco 0 (dev), Trabalho (gestão de produto), Pessoal (uso cotidiano). Mesmo objeto, três óticas.
3. **V4 Yugar Commons split limpo** — Pessoal (terra/família/hipoteca) vs Trabalho V4 (Airbnb venture/grants/co-op). Endereço físico único, funções operacionais distintas.
4. **Atlas Frames = Hexágono ⬡ que orbita V3 Lab** — não é vértice. Pré-existia ao Atom (propagação externa, Identidade v1.3 §2.7).
5. **MindRoot Kids = frente cíclica** — nasce na Pessoal → vai pro Marco 0 (dev) → volta pra Pessoal (uso por Bella e Ben). Mesma lógica do V1, escala pedagógica.
6. **D-007 monolítico** — ADR único com 7 sub-decisões inline (§4.1–4.7), em vez de fragmentar em D-007 a D-013. Mais limpo pra consolidação pós-mineração.
7. **Filename do wrap "mineracao-topologia"** — Claude Code identificou no pre-flight que o repo tem `mineracao-topologia.md` (commit `ad37457`), sem `-final`. Decisão: alinhar job ao real (não renomear o wrap commitado). Prosa conceitual em D-007 mantém `mineracao-topologia-final` por descrever o ato de finalizar a topologia.

## CONNECTIONS

- Espiral do Trabalho v1.0 → references Identidade v1.3, Genesis v5.0.4, Marco Zero v3.1, D-007
- Espiral Pessoal v1.0 → mirrors Espiral do Trabalho v1.0
- D-007 → feeds ambas as Espirais
- D-007 → supersedes leitura anterior de Marco 0 sobre AtlasLab (§4.1)
- Espiral do Trabalho v1.0 → supersedes PENTAGON.md (legacy — aposentar em rodada futura)

## SEEDS

1. **Plano de migração Project-by-Project** → `atom-engine-core/migration/plan-v1.md` (ordem, mapeamento de memórias, mover KB dos 16 Projects minerados)
2. **System prompts dos 2 Projects Claude.ai** — derivados dos skeletons §8 (Trabalho) e §6 (Pessoal) dos docs-lei
3. **Criação dos 2 Projects Claude.ai** — Espiral do Trabalho + Espiral Pessoal
4. **Memórias Atom Drive #1/#4/#5** — resolve na fase de migração (D-007 §5, pendência aberta)
5. **PENTAGON.md** — aposentar ou reescrever em rodada futura (Pentágono operacional vive agora no doc-lei da Trabalho)
6. **ATOM.md** — refletir 4 camadas em rodada futura (Marco 0 / Trabalho / Pessoal / Espaço Entre)
7. **Memória do Marco 0** — atualizar pra refletir as 4 camadas em vez de "Pentágono 5V" como estrutura única
8. **System prompt do Project Marco 0 (Arca)** — atualizar pra refletir nova topologia

## AUDIT

- 3 docs-lei + 1 ADR commitados em commit atômico único
- 0 erros no fluxo principal
- 1 stop-and-report resolvido (divergência de filename `mineracao-topologia.md` vs `-final` no job)
- 1 stop-and-report secundário resolvido (2 prosas conceituais mantidas após patch sed)
- Pre-flight verde · validações verdes · push ok

## NEXT

- Abrir próximo chat Marco 0 com seed:
  ```
  Continuação 12 Mai 2026.
  Commit Espirais+D-007 em origin/main (atom-engine-core).
  Próximo: plano de migração Project-by-Project + system prompts
  derivados dos docs-lei + criação dos 2 Projects Claude.ai.
  ```
- Sessão 4 de 12 Mai (se houver hoje) ou nova data
- Memórias Atom Drive #1/#4/#5 voltam à mesa na fase de migração

---

*Marco 0 constrói. Trabalho opera. Pessoal vive. Espaço Entre repousa.*
*Três wraps em um dia — audit-e-topologia, mineracao-topologia, espirais-docs-lei.*
*De dentro pra fora — sempre.*
