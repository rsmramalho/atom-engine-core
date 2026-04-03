# Pentágono — Master Roadmap

**Versão:** 2.0
**Data:** 03 Abr 2026
**Status:** active
**Princípio:** Cinco vértices, um centro. Atom HS alimenta todos. O Lab experimenta pra todos.

---

## O que é isto

O Pentágono é o ecossistema completo do Rick. Um hub central (Atom HS) e cinco projetos que orbitam ao redor, alimentados pelo centro e conectados entre si. Este documento é o master — a visão cross-project que garante que nenhum roadmap individual perca coerência com o todo.

**Regra:** toda vez que um roadmap de projeto muda, este documento é atualizado. Se o PENTAGON.md não reflete a realidade, a geometria quebrou.

---

## A geometria

```
              V2 · Constellation
             /                  \
        V6 · Lab            V3 · Atlas
            |                   |
        V5 · Yugar          V4 · Muda
             \                  /
              ——— V1 · Atom HS ———
                   (centro)
```

Atom HS é o centro — não compete com os vértices, alimenta todos eles. O Pentágono são os 5 pontos que orbitam ao redor.

| Vértice | Projeto | Status | O que é | Onde vive |
|---------|---------|--------|---------|-----------|
| **V1** (centro) | **Atom HS** | **active** | **Hub. Sistema humano pessoal. Engine + MindRoot.** | mindroot-v2 repo |
| V2 | Constellation OS | paused | Infraestrutura operacional | constellation repo |
| V3 | Atlas Frames | active | Negócio físico. Estruturas de aço, Brendale QLD. | Monday.com |
| V4 | Muda | concept | Comunidade | — |
| V5 | Yugar Commons | concept | Mt Samson. Visão de longo prazo. | — |
| V6 | Atlas/Yugar Lab | concept | Playground. Experimentação, novos produtos, serviços. | — |

---

## Estado de cada vértice

### V1 — Atom HS · centro (active)

**Roadmap:** ROADMAP.md no mindroot-v2 (v6.0)
**Espiral atual:** 2 (Vida — sistema operacional) — planejada, não iniciada
**Progresso Espiral 1:** COMPLETA ○ (7/7 fases, 30 commits, 76 files, ~7.8K LOC, 41 testes)
**Princípio:** Motor → Inteligência → Visualização → Reflexão

Espiral 1 — Corpo — COMPLETA ○ (03 Abr 2026):
- ✅ F1 · Sementes (config, types, type-schemas.json)
- ✅ F2 — Raízes (services, Supabase real, auth)
- ✅ F3 △ Geometria (atoms, tokens, shell, router)
- ✅ F4 □ Fundação (pages, auth, onboarding, triage UI)
- ✅ F5 ⬠ Conexão (pipeline, wrap, search, projects)
- ✅ F6 ⬡ Inteligência (AI triage, audit, analytics, testes)
- ✅ F7 ○ Completude (dark mode, search, export, calendar, offline lite, polish)

Espiral 2 redesenhada v6.0 — "Vida/sistema operacional". Conceito: "se existe no digital, tem como entrar."
- ⚪ F1 · Raiz (9 domínios como fundação permanente) — protocol: foundation
- ⚪ F2 — Conectores (Gmail, Calendar, Drive → inbox) — protocol: full
- ⚪ F3 △ Toque + alma + triage (UI + soul loop + AI classificação) — protocol: surface + logic
- ⚪ F4 □ Biblioteca + grafo (Library, connections, graph, filtro por domínio) — protocol: full
- ⚪ F5 ⬠ Companheiro (AI companion, voz, nudges, Raiz context) — protocol: full

Seeds Espiral 3: Escudo (ações nos conectores), Resiliência (offline + Ollama), Propagação (estágio 6 real).

**Debt:** migration 007 reconciliou schema v1/v2. Hex hardcoded resolvido (dark mode funciona). useRealtime extraído pra realtime-service.
**Deploy:** mindroot-v2.vercel.app / mindroot.com.au
**Audit:** 03 Abr 2026 — AMARELO → VERDE (migration 007 + realtime-service fix + Build Protocol testado)
**Cross-check:** 03 Abr 2026 — ROADMAP v6.0 commitado (mindroot-v2 5a5c9b0)
**Protocolo:** Genesis Build Protocol v1.0 (CLAUDE.md no repo). Testado com protocol:foundation na migration 007.

### V2 — Constellation OS (paused)

**Roadmap:** não criado (formato PHI pendente)
**Fase atual:** landing page entregue, operação pausada
**Depende de:** V1 Atom HS (patterns, infra, experiência)

Quando ativar: após V1 Espiral 1 F7. O Constellation herda patterns do Atom HS — auth, pipeline, UI components, service layer. Sem V1 maduro, V2 repete trabalho.

Material estratégico: seções 12.2-12.3 do Yugar Vision Doc (template de replicação, playbook, pricing).

Próximo passo: criar ROADMAP.md no formato PHI quando V1 estabilizar.

### V3 — Atlas Frames (active)

**Roadmap:** operação no Monday.com (não usa formato PHI — negócio físico)
**Fase atual:** operação corrente
**Independente operacionalmente** — mas alimenta e é alimentado pelo Lab (V6)

Atlas é o negócio real. Opera independente com Monday.com + email (rick@atlasframes.com.au). Não precisa de roadmap PHI porque não é software — é estrutura de aço. Aparece no Pentágono porque é parte da vida do Rick e interage com mod-work no Atom HS.

**Integração com V1:** tasks e projetos do Atlas vivem no Atom HS como items (type: task/project, module: work, tags: #project:atlas).

### V4 — Muda (concept)

**Roadmap:** não criado
**Fase atual:** conceito
**Depende de:** V1 Atom HS (maduro), V5 Yugar (terreno)

Muda é comunidade — nasce quando o Atom HS provar que Human Systems funciona pra uma pessoa, antes de funcionar pra muitas. Não tem prazo, não tem pressão. Cresce como planta.

Material estratégico: seções 10-11 do Yugar Vision Doc (economia de troca, Build & Stay).

Próximo passo: primeiro spec quando V1 estiver no dia a dia.

### V5 — Yugar Commons (concept)

**Roadmap:** não criado
**Fase atual:** conceito / visão
**Depende de:** V1 Atom HS (dados), V4 Muda (comunidade)
**Vision doc:** system_spec_yugar-vision_v0-1.md (atom-engine-core)

Yugar é Mt Samson (20.66ha) como projeto de vida. Propriedade como organismo vivo: rede física, touchscreens por building, sensores IoT, Life Layer, Commons. Visão de 10+ anos.

O Yugar Vision Doc contém a visão completa — foi decomposto nos vértices relevantes:
- Features de Engine/MindRoot → V1 Espiral 2
- Template de replicação → V2
- Economia de troca e Build & Stay → V4
- Infra física e sensores → V5 (este vértice)
- Experimentação e primeira cabana → V6

Material estratégico: seções 6-9 do Vision Doc (rede, buildings, sensores, Life Layer, Commons).

Próximo passo: documenta como reflexões e notas no V1 (type: reflection/note, module: purpose, tags: #project:yugar).

### V6 — Atlas/Yugar Lab (concept)

**Roadmap:** não criado
**Fase atual:** conceito
**Depende de:** V1 Atom HS (sistema), V3 Atlas (negócio), V5 Yugar (terreno)

O Lab é o playground — onde novas ideias, produtos e serviços são experimentados antes de virar realidade em qualquer outro vértice. O ponto onde o negócio físico (Atlas) encontra o terreno (Yugar). Experimenta, valida, distribui.

Material estratégico: seção 4.4 do Yugar Vision Doc (hardware AI local), seção 13 Fase 6 (primeira cabana como protótipo).

Próximo passo: primeira ideia concreta documentada no V1 (type: note/project, module: work, tags: #project:lab).

---

## Mapa de dependências

```
                    V2 Constellation
                   ↑ patterns, infra
                   |
V6 Lab ←——— V1 Atom HS ———→ V4 Muda
  ↕              |  ↑           ↓
V3 Atlas         |  | items    V5 Yugar
                 ↓
            dados, padrões
```

| De | Para | O que flui | Quando |
|----|------|-----------|--------|
| V1 | V2 | Patterns de UI, service layer, auth | Após V1 Espiral 1 F7 |
| V1 | V4 | Prova de que Human Systems funciona | Após V1 estável |
| V1 | V5 | Dados, reflexões, padrões de longo prazo | Contínuo |
| V1 | V6 | Sistema pra organizar experimentos | Após V1 estável |
| V3 | V1 | Tasks e projetos via items no Atom HS | Agora (ativo) |
| V3 | V6 | Experiência de negócio, demandas reais | Quando V6 ativar |
| V4 | V5 | Comunidade como base pro terreno | Futuro distante |
| V5 | V6 | Terreno como espaço físico pro Lab | Quando ambos ativos |
| V6 | todos | Ideias validadas migram pro vértice certo | Contínuo quando ativo |

**V1 alimenta todos. V6 distribui pra todos. V3 opera independente.**

---

## Documentos estratégicos

| Documento | Escopo | Onde vive |
|-----------|--------|-----------|
| Yugar Vision Doc v0.1 | Visão completa da propriedade como organismo. 6 camadas, Corp Shield, AI resiliente, Library Feed, infra física, economia de troca, Build & Stay, replicabilidade. | atom-engine-core |
| Genesis Build Protocol v1.0 | Protocolo de agentes para Claude Code. 5 agentes, inside-out. | atom-engine-core + mindroot-v2 (CLAUDE.md) |
| Guardião Audit v1.0 | Ritual de verificação de alinhamento geométrico. | atom-engine-core |
| Roadmap PHI Meta-Template v2.0 | Template universal de roadmaps com campo protocol:. | atom-engine-core |

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

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 02 Abr 2026 | Documento inicial. Atom HS no centro (hub), 5 vértices orbitando. V6 Atlas/Yugar Lab adicionado. Dependências cruzadas. Regra de cross-check. |
| 1.1 | 02 Abr 2026 | Yugar Vision Doc referenciado. Decomposição por vértice documentada. V1 duas espirais (Corpo + Mente). Material estratégico mapeado em cada vértice. Seção "documentos estratégicos" adicionada. |
| 2.0 | 03 Abr 2026 | Espiral 1 COMPLETA. Espiral 2 definida (5 fases PHI). Build Protocol, Guardião Audit, Roadmap PHI v2.0 referenciados. Audit AMARELO→VERDE. Debt resolvida. |

---

*Cinco vértices, um centro. O Pentágono não é seis projetos separados — é um organismo. Atom HS é o coração. O Lab é as mãos. Os outros são os órgãos que dão forma.*
