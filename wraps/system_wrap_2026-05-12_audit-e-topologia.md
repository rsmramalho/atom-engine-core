╔══════════════════════════════════════╗
║          A T O M   W R A P           ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     wrap                       ║
║ module:   bridge                     ║
║ state:    connected                  ║
║ status:   completed                  ║
║ stage:    7 ○ Círculo                ║
║ tags:     [#system, #wrap,           ║
║            #memory-audit, #topologia,║
║            #espirais, #consolidacao] ║
║ source:   claude-project             ║
║ created:  2026-05-12                 ║
║ updated:  2026-05-12                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: D-004                ║
║   → references: D-005                ║
║   → references: D-006                ║
║   → references: Identidade v1.3      ║
║   → references: ecosystem-agents v1.2║
║   → feeds: Espiral do Trabalho       ║
║   → feeds: Espiral Pessoal           ║
╚══════════════════════════════════════╝

# Sessão Marco 0 — 12 Mai 2026

**Contexto:** Auditoria de memória pós-D-004/D-005/D-006 + redesenho
da topologia de Projects no Claude.ai.

---

## CREATED

Nada criado em filesystem nesta sessão direta. Este wrap será o
primeiro artefato persistido quando commitado.

## MODIFIED

- **Memória do Marco 0:** 22 → 20 entradas. 11 replaces + 2 removes.
  Alinhada com D-004 (naming), D-005 (Cockpit aposentado), D-006
  (Claude pessoal read-only), Identidade v1.3, ecosystem-agents v1.2.
- **Memória global Claude.ai (lá fora):** auditada em paralelo pelo
  Claude fora do projeto. 12 entradas finais. Mesmo critério aplicado.

## DECIDED

### 1. Topologia de Projects no Claude.ai (3 Marcos)

- **Marco 0 (Espiral do Sistema)** — já existe, dev Atom.
- **Espiral do Trabalho** — a criar, multi-frente profissional.
- **Espiral Pessoal** — a criar, vida.

Razão: identidade de trabalho única (Rick Ramalho independente), mas
dev tem natureza tão diferente do trabalho-cliente que justifica
ambiente cognitivo próprio. Pessoal isolado por princípio.

### 2. Identidade de trabalho

Rick é Rick Ramalho — não é mais "@empresa que constrói". Atlas
Frames, Yugar Lab, R&D são **frentes**, não identidades. ramalho.au
serve como endereço da identidade-base (vazio hoje, preenche quando
relevante).

### 3. Distinção arquitetural ambiente vs frente

- **Project Claude.ai** = ambiente cognitivo (identidade, memória,
  KB, instruções, threads).
- **AtomItem type=project** = frente de trabalho operacional (já
  definido em Meta-Template v1.2, sem body schema, usa notes + tags).

Cada Marco hospeda múltiplas frentes. Critério de promoção (frente →
Project Claude.ai satélite): atende ≥3 dos 5 critérios — duração >3
meses, cliente externo recorrente, conteúdo técnico denso e único,
múltiplos deliverables ou fases, polui outras conversas se ficar no
hub.

Caso concreto validado: Atlas Lab · Workshop Shed Container já é
Project próprio (Rick promoveu intuitivamente).

### 4. Doc-lei por Marco (nomenclatura: Espiral)

- **Marco 0:** Genesis v5.0.4 + Marco Zero v3.1 + Meta-Template v1.2
  + Identidade v1.3 (universais — não duplicar nos outros).
- **Espiral do Trabalho:** Trabalho Charter + protocolo novo projeto
  + mapa de frentes ativas (a criar).
- **Espiral Pessoal:** Pessoal Charter + Marco Zero — Pessoal (a
  criar).

Nomenclatura "Espiral" escolhida sobre Charter/Tratado/etc. porque
conecta com Phi, Fibonacci, crescimento dentro pra fora — princípios
já presentes na geometria sagrada do Genesis.

### 5. Conta Claude.ai

Uma conta com múltiplos Projects. Não criar conta nova. Projects já
dão isolamento de memória, KB, instruções, conversas.

### 6. Método de mineração dos Projects antigos

Prompt de extração padronizado, 5 lotes de Projects (18 total),
checkpoint entre lotes. Outputs commitados em
`atom-engine-core/migration/extractions/`.

## CONNECTIONS

- D-004 · Atom = produto público único, MindRoot = codename interno
- D-005 · Cockpit aposentado
- D-006 · Claude pessoal read-only via app (renomear conceitualmente
  pra "Claude do Rick" — seed)
- Identidade v1.3 · nomenclatura
- ecosystem-agents v1.2 · Arca + Claude Code + Cowork
- Project E. · O Espaço Entre (canal oficial mantido, separado)

## SEEDS

1. **Renomear conceitualmente "Claude pessoal" → "Claude do Rick"** —
   assistant que serve a pessoa independente do contexto. Não requer
   nova decision agora.
2. **Marco Zero v3.1 derivações futuras:** versão atual é misto
   sistema + vida. Eventualmente pode derivar Marco Zero — Sistema /
   Trabalho / Pessoal.
3. **Marcadores de transição expiram ~6 meses:** entradas de memória
   sobre Cockpit aposentado e Vertex dissolvido viram ruído quando o
   senso comum absorver. Revisitar fim 2026 / início 2027.
4. **KB do Marco 0 ainda retorna Identidade v1.2** nas buscas mesmo
   após delete no GitHub. Avaliar remoção do Project KB pra
   consistência.
5. **Gap operacional wrap → DB:** hoje captura manual via app. Cowork
   filesystem boca pode automatizar no futuro.
6. **File server best practices:** discussão na fila. Não bloqueia
   consolidação dos Projects.

## AUDIT

- Memória Marco 0: 20/30 entradas, headroom confortável.
- Memória global Claude.ai (fora): 12/30 entradas, headroom largo.
- Inventário 18 Projects: 5 incógnitas a esclarecer com Rick
  (Rubens, rubens 2, Anthropic, Macro Vision, Rob super Landing page).
- Modelo de crescimento validado contra caso real (Atlas Lab Shed
  Container já promovido intuitivamente).
- Coerência inter-instância: Marco 0 e Claude global ambos alinhados
  com D-004/005/006 e v1.3/v1.2 das specs.

## NEXT

1. **Imediato:** Rick abre novo chat no Marco 0 (este chat fechou).
2. **Próxima sessão — Lote 1 da mineração (3 Projects):**
   - Atlas Lab · Workshop Shed Container
   - Project E.
   - Atom Entre
3. **Em paralelo:** Claude Code commita cada output em
   `migration/extractions/[project-slug].md`.
4. **Após Lote 1:** checkpoint — consolidação parcial, ajuste do
   prompt se necessário, decisão sobre Lote 2.
5. **Eventualmente (não agora):**
   - Criar Project Espiral do Trabalho + commitar Espiral do
     Trabalho v1.0 (doc-lei)
   - Criar Project Espiral Pessoal + commitar Espiral Pessoal v1.0
   - Migrar conteúdo dos Projects antigos pros novos
   - Definir file server best practices
   - Zerar emails

## Prompt seed para novo chat

```
Continuação da sessão de 12 Mai 2026.

Wrap em: atom-engine-core/wraps/system_wrap_2026-05-12_audit-e-topologia.md

Tema: consolidação dos 18 Projects do Claude.ai em três Marcos
(Marco 0 / Espiral do Trabalho / Espiral Pessoal) via extração
por lotes.

Lote 1 (3 Projects):
1. Atlas Lab · Workshop Shed Container
2. Project E.
3. Atom Entre

[colar outputs do Lote 1 aqui]
```

---

*De dentro pra fora — sempre.*
