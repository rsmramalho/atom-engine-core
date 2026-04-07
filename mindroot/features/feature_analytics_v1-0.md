╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   bridge                     ║
║ state:    connected                  ║
║ status:   active                     ║
║ stage:    5 ⬠ Pentagono              ║
║ tags:     [#feature, #galho,         ║
║            #cross-pillar]            ║
║ source:   claude-project             ║
║ created:  2026-04-05                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.4      ║
║   → derives: feature_soul           ║
║   → derives: feature_wrap           ║
╚══════════════════════════════════════╝

# Feature: Analytics

**Versão:** 1.0
**Data:** 05 Abr 2026
**Status:** live
**Wireframe:** `design/wireframes/mindroot-wireframe-analytics.html`

---

## 1. Identidade

Espelho numérico — padrões que o dia a dia esconde.

---

## 2. Propósito

Analytics mostra o que a rotina esconde: tendências de energia (14 dias), frequência de emoções, shifts mais comuns (ansioso→satisfeito), connections mais frequentes, items por módulo/type. Não é dashboard de produtividade. É espelho — "olha o que está acontecendo com você e com o sistema."

---

## 3. Não é

- **Não é KPI dashboard.** Sem metas numéricas, sem "você precisa fazer X wraps por semana."
- **Não é relatório.** É visualização interativa pra explorar.
- **Não é Raiz.** Raiz é saúde por domínio. Analytics é patterns cross-domínio ao longo do tempo.

---

## 4. Estado atual

- Page `/analytics` com tabs: Soul, Connections
- Soul tab: energy trends (14d chart), emotion frequency, shift history
- Connections tab: stats, most connected items, relation breakdown

### Arquivos

```
src/pages/Analytics.tsx
src/components/analytics/SoulPanel.tsx
src/components/analytics/ConnectionsPanel.tsx
```

---

## 5. Visão

- Tab "Pipeline": items por estágio ao longo do tempo (quantos passaram de inbox→committed)
- Tab "Módulos": distribuição de items por module (work domina? body está vazio?)
- Tab "Raiz": domain health ao longo do tempo (regressões históricas)
- Weekly/monthly digest: email automático com highlights (Espiral 3)
- Comparação de períodos: "essa semana vs semana passada"

---

## 6. Conexões

| Com | Relação | Detalhe |
|-----|---------|---------|
| Soul | feeds | Soul tab usa dados do soul layer (wraps) |
| Graph | feeds | Connections tab usa dados do graph |
| Raiz | references | Domain health trends (futuro) |
| Wrap | feeds | Wraps são a fonte de dados do Analytics |

---

## 7. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 05 Abr 2026 | Documento inicial |
