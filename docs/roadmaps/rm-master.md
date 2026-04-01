╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [UUID — gerado no commit]  ║
║ type:     spec                       ║
║ module:   bridge                     ║
║ state:    structured                 ║
║ status:   active                     ║
║ stage:    3 △ Triângulo              ║
║ tags:     #mod_bridge,               ║
║           #roadmap:RM-MASTER,        ║
║           #milestone                 ║
║ source:   claude-project             ║
║ created:  2026-03-31                 ║
║ updated:  2026-03-31                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → feeds: RM-ATOM-OS               ║
║   → feeds: RM-CONSTELLATION         ║
║   → feeds: RM-ATLAS-FRAMES          ║
║   → feeds: RM-MUDA                  ║
║   → feeds: RM-YUGAR                 ║
╚══════════════════════════════════════╝

## Master Plan — Ecossistema Pentágono (RM-MASTER)

**Serial:** RM-MASTER
**Versão:** 2.0
**Visão:** Um ecossistema onde indivíduo, negócio, ação, comunidade e legado se alimentam mutuamente — e o protocolo que os conecta é aberto.

---

### A Hierarquia

```
Genesis v4.2.1 (a lei)
  └── Atom OS (Engine + MindRoot = protocolo + interface)
        └── Pentágono (5 vértices — o que o OS serve)
              ├── V1. Atom OS          — O Espelho     — serve o indivíduo
              ├── V2. Constellation OS — O Telescópio  — serve o negócio
              ├── V3. Atlas Frames     — A Bigorna     — serve o presente
              ├── V4. Muda             — A Árvore      — serve a comunidade
              └── V5. Yugar/Atlas Lab  — A Raiz        — serve o legado
```

**Decisão arquitetural (31 Mar 2026):** MindRoot não é produto separado — é a interface do Atom OS. O protocolo (Engine) e a interface (MindRoot) são uma coisa só.

---

### Base (fundação estável)

- Genesis v4.2.1 + Schema v2
- Marco Zero v1.3
- Meta-Template v1.0
- 12 templates Genesis v4.2 commitados
- Atom Drive estruturado (8 módulos + system/)
- Supabase 3 tabelas deployed
- GitHub rsmramalho/atom-engine-core
- drive-tools.js operacional
- MindRoot v1.0.0-alpha.25.2 live no Vercel
- Atlas Frames faturando ~$2.5M/ano
- Constellation OS Sprint 9 (72%)

---

### Modelo Operacional: Dual-Track Permanente

| Track | Quando | O quê | Foco |
|-------|--------|-------|------|
| **CONSTRUIR** | Aurora (05h-08h) | Infra, automação, OS | Atom OS: RPCs, n8n, auto-triage, pipeline |
| **OPERAR** | Zênite (08h-17h) | Dia a dia, projetos | Atlas, Constellation, ritual, captura |

**Gate universal:** Se o ritual (aurora + wrap) quebra, ambos os trilhos pausam.

---

### CONSTRUIR — Milestones (Aurora)

| # | Milestone | O que entrega | Dependência |
|---|-----------|--------------|-------------|
| C1 | **Atom OS fundação** | OAuth fix. RPCs no Supabase. Pipeline end-to-end. | Nenhuma |
| C2 | **Automação** | n8n sync. Auto-triage. Captura automática. | C1 |
| C3 | **Consumidores reais** | Constellation via Schema v2. PHI-TIME extraído. DAG check. | C2 |
| C4 | **Protocolo aberto** | Docs públicos. GitHub public. SDK/CLI. Muda como consumidor. | C3 |

### OPERAR — Milestones (Zênite)

| # | Milestone | O que entrega | Dependência |
|---|-----------|--------------|-------------|
| O1 | **Ritual funcionando** | 1 ciclo aurora+wrap. 1 item por módulo. | Nenhuma |
| O2 | **Atlas digital** | Lojinha + quote + FB Marketplace. | Nenhuma |
| O3 | **Constellation Sprint 9** | Toggle, label fix, Client Mode. Demo Atlas. | Sessão deep work |
| O4 | **Primeiro cliente externo** | Constellation deployed. Flora. 1 estrela externa. | O3 |
| O5 | **Receita + escala** | Constellation com receita > custos. Atlas Score > 60. | O4 |

---

### Horizonte — O Pentágono Completo

Os 5 vértices vivos e interconectados. O Atom OS é o tecido conjuntivo. Genesis é a lei. Os 8 módulos são as lentes. De dentro pra fora. Sempre.

### Regras

1. Dual-track sempre: CONSTRUIR (aurora) + OPERAR (zênite).
2. Gate universal: ritual. Se aurora+wrap quebra, ambos pausam.
3. Atlas nunca para. É o revenue engine.
4. O triângulo antes de V4 e V5.
5. Tudo passa pelo inbox. Sem exceção.
6. Ideia nova → inbox. Não vira milestone.
7. Cada RM-[SLUG] vive sozinho e se conecta aqui via belongs_to.
8. Review trimestral.
9. MindRoot = Atom OS. Um roadmap, um destino.

## Connections
- feeds:: [[RM-ATOM-OS]]
- feeds:: [[RM-CONSTELLATION]]
- feeds:: [[RM-ATLAS-FRAMES]]
- feeds:: [[RM-MUDA]]
- feeds:: [[RM-YUGAR]]
