---
id: D-004
title: Atom como produto único + Marketplace como estrutura natural
date: 2026-05-08
status: accepted
deprecates: []
relates_to: [D-001, D-003]
supersedes_partial: [system_spec_atom-identidade_v1-2]
authors: [Rick, Arca]
tags: [naming, product, marketplace, identity, architecture]
---

# D-004 — Atom como produto único + Marketplace como estrutura natural

## Contexto

A Identidade v1.2 (04 Abr 2026) declarou MindRoot como nome público do app, Atom Engine como protocolo interno, e Pentágono como ecossistema de 5 vertices distintos. À época, o conceito Engine OS Naked ainda não estava maduro e o produto MindRoot era único em deploy.

Nas sessões de 07-09 Abr 2026 (chats `7a4ddbaa`, `9a8c0888`), o conceito Engine OS Naked foi formalizado no Design Tree v1.1: o Engine, sozinho, com 8 camadas universais (Casa→Olhos), é app funcional completo. Vertex adiciona apenas Home (camada 9) e Features (camada 10). Marketplace foi nomeado como estrutura natural — terceiros publicam add-ons que rodam em qualquer instância do Engine.

Em 08 Mai 2026, com MindRoot LIVE em `mindroot.com.au` há semanas (estabilizado em master após D-003) e o criador retomando uso real, três pressões convergiram para uma simplificação:

1. **Estrutural:** múltiplos vertices como apps separados (MindRoot, Constellation, Atlas) significam múltiplos deploys, múltiplos onboardings, fragmentação de dados, fricção de marketing. O conceito Engine OS Naked já dissolvia a necessidade — faltava nomear.
2. **Filosófica:** a escala fractal estava torta. Item (7 estágios) → Interface (10 camadas) → "Pentágono = 5 vertices" não cresce para Marketplace (∞). Substituir por "Atom = 1 produto" → "Marketplace = ∞ add-ons" restaura a espiral fibonacci limpa.
3. **Estratégica:** Marketplace como modelo de negócio só funciona honestamente se houver UM produto onde os add-ons rodam, não N produtos separados.

A decisão alinha o naming público com a arquitetura que o repo já carrega (ATOM.md, PENTAGON.md, Engine OS Naked) — não é virada conceitual, é correção de superfície.

## Decisão

1. **Atom é o nome público do produto.** Único, definitivo, exposto ao mundo.

2. **Atom = Engine OS Naked deployado como app.** O que existe em produção é o produto público. Não há "vertex como app separado" — vertex é configuração instalável.

3. **Marketplace é a estrutura natural de extensão do Atom.** Add-ons adicionam:
   - Features (camada 10) — funcionalidade nova
   - Home customizada (camada 9) — opcional
   - Tema visual — opcional, opt-in pelo usuário
   
   Add-ons nunca tocam camadas 1-8 (o Engine OS é imutável).

4. **MindRoot vira codename interno.** Sai do vocabulário público. Persiste em:
   - Repo `mindroot-v2` (rename é ação futura, não desta decisão)
   - Deploy técnico `mindroot.com.au` (migração de domínio é ação futura)
   - Código fonte (referências internas continuam válidas)
   - Branch canônico `master` definido em D-003 permanece intocado
   
   Onde MindRoot aparecer voltado ao usuário (UI, marketing, splash, manifest, copy), migra para Atom.

5. **Vertex como conceito de "app separado" é dissolvido.** Vertex passa a significar **configuração + conjunto de add-ons** dentro do Atom único.

6. **Pentágono vira preset, não estrutura de produto.** "Pentágono Rick" é coleção de add-ons recomendados que reproduzem a configuração pessoal do criador, instalável por qualquer pessoa via Marketplace.

7. **Constellation é add-on, não produto separado.** Vira "add-on Work" — features de gestão de equipe, projetos empresariais, diagnóstico organizacional. Quando ativo, Atom mostra esse modo.

8. **Atlas Frames é add-on, não produto separado.** Se evoluir como oferta, vira add-on industrial específico no Marketplace.

9. **Yugar Commons, Muda e quaisquer vertices futuros** seguem o mesmo padrão — viram add-ons quando forem produto, presets quando forem configuração.

10. **B2B (futuro):** "Atom for Teams" é uma instância configurada com add-ons empresariais pré-instalados, billing por seat, controles admin — não produto separado. Modelo Notion → Notion for Teams.

## Consequências

### Imediato (1-2 semanas)

- Identidade v1.2 → v1.3 — reescrever Seção 4 (Glossário) e Seção 5 (Onde cada nome aparece).
- Instruções do Project Atom (esta conta) atualizadas para v2 refletindo Atom como produto, vertices como add-ons/presets.
- Memória do Claude (em todas as superfícies) atualizada com nova nomenclatura.

### Curto/médio prazo (1-3 meses)

- ATOM.md revisado — produto único, não "centro de pentágono de produtos".
- PENTAGON.md revisado — Pentágono como preset/história pessoal do criador, não estrutura de produto.
- `mindroot/design/design-system.md` — referências a "MindRoot" como produto migram para "Atom".
- UI do app: logo, splash, `manifest.json`, copy, títulos, meta tags → Atom.
- Marketing/comunicação pública: site institucional, landing, redes sociais → Atom.
- Marketplace técnico (estrutura de add-ons, sandboxing, registry, lifecycle) entra no roadmap como capability obrigatória, não feature distante.
- Constellation reposicionado: deixa de ter trilha própria, vira escopo de add-on Work.

### Longo prazo (3-12 meses, decisão futura)

- Migração de domínio `mindroot.com.au` → domínio Atom (decisão futura, não desta).
- Rename do repo `mindroot-v2` → `atom-app` ou similar (decisão futura).
- Aposentadoria total do termo MindRoot do código (decisão futura).

### Não muda

- **Genesis v5.0.4** — schema universal, agnóstico ao naming. Continua intacto.
- **Marco Zero v3.1** — operacional universal. Continua intacto.
- **Meta-Template v1.2** — molde dos moldes. Continua intacto.
- **Schema técnico** — `AtomItem`, `AtomType`, `atom_events`, `item_connections`, prefixo `atom_*` em tabelas. Naming técnico permanece. Atom como produto público é consistente com `atom_*` técnico.
- **D-001 (A/B partition)** — continua válida. Repo Git para construção, Supabase para vida operacional, sem mudanças.
- **D-003 (mindroot-v2 branch canônico = master)** — continua válida. Esta decisão não toca branch nem repo, só naming público.
- **Repo `atom-engine-core`** — continua canônico, repositório do protocolo.

## Alternativas consideradas

**Alt 1 — Manter modelo "múltiplos vertices como apps separados".** Status quo Identidade v1.2.
- Rejeitado: complexidade desnecessária. Múltiplos deploys, múltiplos onboardings, fragmentação de dados, fricção pra modelo de negócio. Não escala. Marketplace fica artificial sobre N produtos.

**Alt 2 — Manter MindRoot como produto público + Atom Engine como sub-marca técnica.** "MindRoot powered by Atom Engine".
- Rejeitado: continua exigindo explicação dupla pro mundo (o que é MindRoot, o que é Engine, qual a relação). Atrita o marketing. Não captura a tese de produto único.

**Alt 3 — Rebrand total e imediato.** Renomear repo, deploy, domínio, tudo de uma vez.
- Rejeitado por agora: custo operacional alto, risco de quebrar links/referências. Migração gradual (UI/marketing primeiro, infra depois) é mais segura. Pode ser reavaliado em decisão futura.

**Alt 4 — "Atom" como guarda-chuva, "MindRoot" como produto consumer principal dentro dele.** Múltiplos produtos sob marca Atom.
- Rejeitado: reintroduz fragmentação. Essência da decisão é produto único.

## Documentos a atualizar

- [ ] `law/system_spec_atom-identidade_v1-2.md` → v1.3 (Seção 4 e 5 reescritas)
- [ ] `ATOM.md` → revisão para produto único + marketplace
- [ ] `PENTAGON.md` → Pentágono como preset/história pessoal
- [ ] `mindroot/design/design-system.md` → "MindRoot" público → "Atom"
- [ ] System prompt do Project Atom (esta conta) → v2
- [ ] Memória do Claude (esta conta + futura ramalho.au) → nova nomenclatura
- [ ] `mindroot-v2/CLAUDE.md` → references atualizadas
- [ ] `mindroot-v2/README.md` → references atualizadas
- [ ] `mindroot-v2/src/manifest.json` → name + short_name
- [ ] `mindroot-v2/src/` — splash, logo, copy, títulos, meta tags
- [ ] `mindroot-v2/index.html` → title

## Notas

- **D-002 (Cockpit como DML executor)** será deprecada em decisão separada (D-005 prevista) — aposentadoria do Cockpit como agente operacional faz parte da reorganização da topologia de agentes, não desta decisão.
- **Setup do Claude na conta `ramalho.au` em modo read-only** será decisão separada (D-006 prevista) — define superfície de uso pessoal sem fratura de "porta da frente".
- **Marketplace técnico** será spec separada em `atom-engine-core/specs/` — esta decisão estabelece o conceito como estrutura natural; a implementação técnica (registry, sandbox, lifecycle, billing) é trabalho de spec.
- Esta decisão alinha a superfície pública com a arquitetura que o repo já carrega há semanas. Não é virada de tese — é remoção de discrepância entre nome e estrutura.

---

*De dentro pra fora. Geometria perfeita. Atom é o produto.*
