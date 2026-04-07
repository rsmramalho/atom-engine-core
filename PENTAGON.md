╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     doc                        ║
║ module:   bridge                     ║
║ state:    committed                  ║
║ status:   active                     ║
║ stage:    7 ○ Circulo                ║
║ tags:     [#system, #roadmap,        ║
║            #pentagono, #vertices]    ║
║ source:   claude-project             ║
║ created:  2026-04-05                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: ATOM.md             ║
║   → references: Genesis v5.0.4      ║
║   → feeds: MindRoot ROADMAP.md      ║
║   → feeds: all vertex roadmaps      ║
╚══════════════════════════════════════╝

# Pentágono — Master Roadmap

**Versão:** 3.4
**Data:** 08 Abr 2026
**Status:** active
**Princípio:** Cinco vértices, um centro. Atom Engine alimenta todos. O Lab experimenta pra todos.

---

## O que é isto

O Pentágono é o ecossistema completo do Rick. Atom Engine no centro e cinco projetos que orbitam ao redor, alimentados pelo centro e conectados entre si. Este documento é o master — a visão cross-project que garante que nenhum roadmap individual perca coerência com o todo.

**Regra:** toda vez que um roadmap de projeto muda, este documento é atualizado. Se o PENTAGON.md não reflete a realidade, a geometria quebrou.

---

## A geometria

```
              V1 · MindRoot
              (O Espelho)
             /           \
      V5 · Muda          V2 · Constellation
    (A Arvore)           (O Telescopio)
          |  ATOM ENGINE  |
          |   (centro)    |
    V4 · Yugar           V3 · Lab
    (A Raiz)          (O Laboratorio)
```

Atom Engine e o centro — nao compete com os vertices, alimenta todos eles. O Pentagono sao os 5 pontos que orbitam ao redor.

| Posicao | Projeto | Apelido | Status | Onde vive |
|---------|---------|---------|--------|-----------|
| **Centro** | **Atom Engine** | — | **active** | atom-engine-core repo |
| **V1** | **MindRoot** | O Espelho | **active** | mindroot-v2 repo |
| V2 | Constellation | O Telescopio | paused | constellation repo |
| V3 | Lab | O Laboratorio | concept | — |
| V4 | Yugar Commons | A Raiz | concept | — |
| V5 | Muda | A Arvore | concept | — |
| ⬡ | Atlas Frames | A Bigorna (hexagono) | active | Monday.com |

### Atlas Frames — Hexagono ⬡

Atlas nao e vertice do Pentagono. E o primeiro hexagono — a primeira propagacao externa. Atlas ja existia antes do Atom Engine. Mas quando o Pentagono se conecta com Atlas, a conexao interna gera efeito cascata no mundo externo.

Na geometria sagrada, o hexagono e a unica forma regular que tessela infinitamente sem lacunas. Cada novo projeto externo que usar o Engine e um novo hexagono que encaixa perfeitamente.

O estagio 6 (⬡) do Genesis e opcional. O Pentagono (⬠, estagio 5) nao precisa de propagacao pra existir completo. Mas quando a conexao gera efeito cascata — ela acontece pelo hexagono.

---

## Estado de cada vértice

### V1 — MindRoot · O Espelho (active)

**Roadmap:** ROADMAP.md no mindroot-v2 (v7.0)
**Espiral atual:** 2 (Vida — sistema operacional) — F1 ✅, F2 ◐ (14/19), F3 ✅, F4 ✅, F5/F6/F7 ⚪
**Progresso Espiral 1:** COMPLETA ○ (7/7 fases)
**Progresso Espiral 2:** 4/7 fases entregues ou em progresso (PHI v3.0 — 7 fases obrigatorias)
**Metricas:** 80 commits, 109 files (.ts/.tsx), ~12.2K LOC, 14 pages, 6 edge functions, 14 test files
**Princípio:** Motor → Bocas → Galhos → Frutos. Presença sobre produtividade.

Espiral 1 — Corpo — COMPLETA ○ (03 Abr 2026):
- ✅ F1 · Sementes (config, types, type-schemas.json)
- ✅ F2 — Raízes (services, Supabase real, auth)
- ✅ F3 △ Geometria (atoms, tokens, shell, router)
- ✅ F4 □ Fundação (pages, auth, onboarding, triage UI)
- ✅ F5 ⬠ Conexão (pipeline, wrap, search, projects)
- ✅ F6 ⬡ Inteligência (AI triage, audit, analytics, testes)
- ✅ F7 ○ Completude (dark mode, search, export, calendar, offline lite, polish)

Espiral 2 v7.0 (PHI v3.0 — 7 fases) — "Vida/sistema operacional". Conceito: "se existe no digital, tem como entrar."
- ✅ F1 · Raiz — done (commits b64511b + a53be24)
- ◐ F2 — Conectores — em progresso 14/19 (Gmail/Calendar OAuth+sync, Atom Agent v0.1 CLI; falta body.location, AtomDrive, watch mode)
- ✅ F3 △ Toque + alma — done 19/19 (soul loop, triage Haiku, ItemDetail morph)
- ✅ F4 □ Biblioteca + grafo — done 9/9 (Library, ConnectionsSection, D3 graph, search filtros)
- ⚪ F5 ⬠ Companheiro — futuro
- ⚪ F6 ⬡ Escudo + propagacao — futuro (acoes write nos conectores, propagacao real, stage 6, Corp Shield)
- ⚪ F7 ○ Completude viva — futuro (PWA offline real, Ollama fallback, Agent v2, onboarding universal)

Seeds Espiral 3: Constellation (V2), Multi-user, Marketplace de connectors, Graph intelligence.

**Debt:** ZERO.
**Deploy:** mindroot.com.au (Vercel)
**Audit:** 08 Abr 2026 — ROADMAP v7.0 reescrito em PHI v3.0 (7 fases por espiral). F6/F7 da Espiral 2 criadas a partir das antigas seeds.
**Cross-check:** 08 Abr 2026 — ROADMAP v7.0 (mindroot ui-v2) sync com PENTAGON v3.4.
**Protocolo:** Genesis Build Protocol v1.0 (CLAUDE.md no repo).

### V2 — Constellation OS (paused)

**Roadmap:** não criado (formato PHI pendente)
**Fase atual:** landing page entregue, operação pausada
**Depende de:** V1 MindRoot (patterns, infra, experiencia)

Quando ativar: apos V1 Espiral 1 F7. O Constellation herda patterns do MindRoot — auth, pipeline, UI components, service layer. Sem V1 maduro, V2 repete trabalho.

Material estratégico: seções 12.2-12.3 do Yugar Vision Doc (template de replicação, playbook, pricing).

Próximo passo: criar ROADMAP.md no formato PHI quando V1 estabilizar.

### V3 — Lab · O Laboratorio (concept)

**Roadmap:** nao criado
**Fase atual:** conceito
**Depende de:** V1 MindRoot (sistema), Atlas (negocio), V4 Yugar (terreno)

O Lab e o playground — onde novas ideias, produtos e servicos sao experimentados antes de virar realidade em qualquer outro vertice. O ponto onde o negocio fisico (Atlas) encontra o terreno (Yugar). Experimenta, valida, distribui.

Material estrategico: secao 4.4 do Yugar Vision Doc (hardware AI local), secao 13 Fase 6 (primeira cabana como prototipo).

Proximo passo: primeira ideia concreta documentada no V1 (type: note/project, module: work, tags: #project:lab).

### V4 — Yugar Commons · A Raiz (concept)

**Roadmap:** nao criado
**Fase atual:** conceito / visao
**Depende de:** V1 MindRoot (dados), V5 Muda (comunidade)
**Vision doc:** system_spec_yugar-vision_v0-1.md (atom-engine-core)

Yugar e Mt Samson (20.66ha) como projeto de vida. Propriedade como organismo vivo: rede fisica, touchscreens por building, sensores IoT, Life Layer, Commons. Visao de 10+ anos.

O Yugar Vision Doc contem a visao completa — foi decomposto nos vertices relevantes:
- Features de Engine/MindRoot → V1 Espiral 2
- Template de replicacao → V2
- Economia de troca e Build & Stay → V5
- Infra fisica e sensores → V4 (este vertice)
- Experimentacao e primeira cabana → V3

Material estrategico: secoes 6-9 do Vision Doc (rede, buildings, sensores, Life Layer, Commons).

Proximo passo: documenta como reflexoes e notas no V1 (type: reflection/note, module: purpose, tags: #project:yugar).

### V5 — Muda · A Arvore (concept)

**Roadmap:** nao criado
**Fase atual:** conceito
**Depende de:** V1 MindRoot (maduro), V4 Yugar (terreno)

Muda e comunidade — nasce quando o MindRoot provar que Human Systems funciona pra uma pessoa, antes de funcionar pra muitas. Nao tem prazo, nao tem pressao. Cresce como planta.

Material estrategico: secoes 10-11 do Yugar Vision Doc (economia de troca, Build & Stay).

Proximo passo: primeiro spec quando V1 estiver no dia a dia.

---

## Mapa de dependências

```
                    V2 Constellation
                   ↑ patterns, infra
                   |
V3 Lab ←——— V1 MindRoot ———→ V5 Muda
  ↕              |  ↑            ↓
⬡ Atlas         |  | items     V4 Yugar
                 ↓
           dados, padroes
```

| De | Para | O que flui | Quando |
|----|------|-----------|--------|
| V1 | V2 | Patterns de UI, service layer, auth | Apos V1 Espiral 1 F7 |
| V1 | V5 | Prova de que Human Systems funciona | Apos V1 estavel |
| V1 | V4 | Dados, reflexoes, padroes de longo prazo | Continuo |
| V1 | V3 | Sistema pra organizar experimentos | Apos V1 estavel |
| ⬡ Atlas | V1 | Tasks e projetos via items no MindRoot | Agora (ativo) |
| ⬡ Atlas | V3 | Experiencia de negocio, demandas reais | Quando V3 ativar |
| V5 | V4 | Comunidade como base pro terreno | Futuro distante |
| V4 | V3 | Terreno como espaco fisico pro Lab | Quando ambos ativos |
| V3 | todos | Ideias validadas migram pro vertice certo | Continuo quando ativo |

**V1 alimenta todos. V3 distribui pra todos. Atlas opera independente (hexagono).**

---

## Documentos estratégicos

| Documento | Escopo | Onde vive |
|-----------|--------|-----------|
| Yugar Vision Doc v0.1 | Visão completa da propriedade como organismo. 6 camadas, Corp Shield, AI resiliente, Library Feed, infra física, economia de troca, Build & Stay, replicabilidade. | atom-engine-core |
| Genesis Build Protocol v1.0 | Protocolo de agentes para Claude Code. 5 agentes, inside-out. | atom-engine-core + mindroot-v2 (CLAUDE.md) |
| Guardião Audit v2.0 | Agente de geometria documental — 7 camadas de verificação, de dentro pra fora. | atom-engine-core |
| Atom Agent v1.0 (spec) | Braco fisico do Atom HS — filesystem scanner, 6 spirais, Python CLI. Implementado em F2. | atom-engine-core |
| Atom Agent v0.1 (codigo) | CLI funcional: scan, classify, rename, move, index. Repo: rsmramalho/atom-agent. | atom-agent repo |
| Roadmap PHI Meta-Template v3.0 | Template universal de roadmaps. Multiplas espirais, 7 fases obrigatorias, seeds como secao. | atom-engine-core |
| Atom Identity v1.2 | Nomenclatura definitiva — Atom como universo, Engine como centro, Pentagono 5V, Atlas hexagono. | atom-engine-core (law/) |

---

## Regra de cross-check

Toda vez que um roadmap de projeto muda:

1. **Abrir este documento** (PENTAGON.md)
2. **Atualizar a seção do vértice** (estado, fase, progresso)
3. **Verificar dependências** — a mudança afeta algum outro vértice?
4. **Verificar coerência** — os status dos vértices fazem sentido juntos?
5. **Commitar ambos** — roadmap do projeto + PENTAGON.md no mesmo push

### Checklist rápido

- [ ] Estado do vértice reflete o roadmap atualizado?
- [ ] Progresso (N/M fases) está correto?
- [ ] Dependências continuam válidas?
- [ ] Nenhum vértice "paused" deveria ter sido ativado?
- [ ] Nenhum vértice "active" deveria ter sido pausado?
- [ ] Mapa de dependências continua correto?

---

## Cadência

O PENTAGON.md é revisado:
- **A cada mudança de fase** em qualquer projeto
- **Mensalmente** como audit geral (mesmo sem mudança de fase)
- **A cada decisão estratégica** que afete mais de um vértice

---

## Bug lifecycle

### Fonte
Testador submete relatório com screenshots → bug identificado.

### Ciclo

1. Bug reportado → captura no inbox (`type: task`, `tags: [#bug, #regression]`, `module: work`)
2. GUARDIÃO identifica: qual pilar, qual componente, reprodução confirmada?
3. Fix implementado via build protocol (de dentro pra fora)
4. Regression test criado: 1 teste permanente por bug — nunca deletar
5. Wrap documenta: bug → fix → test → commit hash
6. Release note pro testador: HTML simples, linguagem não-técnica, explica o que mudou e como verificar

### Regras

- Nenhum bug fechado sem regression test correspondente
- Regression tests vivem no agente Regressão (ATOM.md □ Fundação 4)
- O histórico de bugs é memória do sistema — tudo commitado

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 02 Abr 2026 | Documento inicial. Atom HS no centro (hub), 5 vértices orbitando. V6 Atlas/Yugar Lab adicionado. Dependências cruzadas. Regra de cross-check. |
| 1.1 | 02 Abr 2026 | Yugar Vision Doc referenciado. Decomposição por vértice documentada. V1 duas espirais (Corpo + Mente). Material estratégico mapeado em cada vértice. Seção "documentos estratégicos" adicionada. |
| 2.0 | 03 Abr 2026 | Espiral 1 COMPLETA. Espiral 2 definida (5 fases PHI). Build Protocol, Guardião Audit, Roadmap PHI v2.0 referenciados. Audit AMARELO→VERDE. Debt resolvida. |
| 2.1 | 04 Abr 2026 | Repo reorganizado: law/, specs/, wraps/, archive/. Naming convention padronizada (Meta-Template). F1 Raiz done, F2 parcial. README com arvore real. |
| 2.2 | 04 Abr 2026 | Guardião v2.0 (7 camadas documentais). Atom Agent v1.0 referenciado como seed da Espiral 3. Routine Builder registrado. |
| 3.0 | 04 Abr 2026 | Naming: Atom OS→Atom. Genesis sem prefixo. Pentagono: V3=Lab, V4=Yugar, V5=Muda. Atlas → hexagono (propagacao externa, fora do Pentagono). Identity spec v1.0 adicionado. |
| 3.1 | 05 Abr 2026 | Cross-repo sync: V1 Espiral 2 status real (F2-F4 parciais, 38/52 entregaveis). Atom Agent movido de Seed pra F2 (v0.1 implementado, repo criado). Metricas V1 atualizadas (80 commits, 12.2K LOC). Debt atualizada. |
| 3.2 | 05 Abr 2026 | Sprint Fechamento Espiral 2 — wrap. V1: F3 19/19 ✓ (soul loop completo, morph, chips), F4 9/9 ✓ (connection prompt, domain filter), F2 14/19 (Gmail #who, calendar tz). Debt→ZERO. Ritual blocks→Seeds. 8 commits, ROADMAP v6.9. |
| 3.3 | 07 Abr 2026 | Honest sync: V1 Espiral 2 status verificado contra codigo (HEAD cf4bc37). F1 Raiz e F2 Conectores nao existem no codebase — status corrigido de done→not started. F4 graph/connections nao construidos — status corrigido de 9/9→parcial. Metricas reais: 63 commits, 156 files, 25.8K LOC, 3 edge fns. Genesis v5.0.4, Identity v1.2. |
| 3.4 | 08 Abr 2026 | Sync com ROADMAP v7.0 (PHI v3.0): Espiral 2 expandida pra 7 fases. F1 Raiz ✅, F2 Conectores ◐ 14/19, F3 ✅, F4 ✅, F5/F6/F7 ⚪. F6 Escudo+propagacao e F7 Completude viva criadas a partir das seeds anteriores. Roadmap PHI Meta-Template referenciado em v3.0. |

---

*Cinco vertices, um centro. O Pentagono nao e seis projetos separados — e um organismo. Atom Engine e o coracao. MindRoot e o espelho. O Lab e as maos. Os outros sao os orgaos que dao forma. Atlas e a primeira propagacao — o hexagono que tessela infinitamente.*
