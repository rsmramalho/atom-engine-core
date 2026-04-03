╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   bridge                     ║
║ state:    structured                 ║
║ status:   active                     ║
║ stage:    3 △ Triângulo              ║
║ tags:     [#system, #claude-code,    ║
║            #agents, #build-protocol] ║
║ source:   claude-project             ║
║ created:  2026-04-03                 ║
║ updated:  2026-04-03                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.1       ║
║   → references: Meta-Template v1.1   ║
║   → belongs_to: project-mindroot     ║
║   → feeds: project-constellation-os  ║
╚══════════════════════════════════════╝

# Genesis Build Protocol v1.0
## Sistema de Agentes — Construção de Dentro pra Fora

**Piso mínimo:** 5 ⬠ Pentágono (spec sem connections não especifica nada)
**Estado atual:** estágio 3 — estruturado, testado em produção (migration 007), aguardando connections formais para avançar

---

## O que é

Protocolo de orquestração de agentes para o Claude Code. Define como features e módulos são construídos de dentro pra fora, respeitando a geometria do Genesis em cada camada de implementação.

Filho direto do Genesis v5.0.1. Consome o schema como contrato — não vive dentro dele.

## Os 5 agentes e a geometria

| # | Geometria | Agente | Função |
|---|-----------|--------|--------|
| 1 | · Ponto | GUARDIÃO | Autoridade do schema. Nunca escreve código. |
| 2 | — Linha | ROOT | Schema de banco. Supabase + TypeScript types. |
| 3 | △ Triângulo | ESTRUTURA | Lógica de negócio. Services + hooks. |
| 4 | □ Quadrado | INTERFACE | Componentes UI. Consome via Estrutura. |
| 5 | ⬠ Pentágono | TEIA | Integração + cross-check final. |

## Valores de protocol: (usados nos roadmaps PHI)

| Valor | Agentes | Quando usar |
|-------|---------|-------------|
| `inner` | GUARDIÃO | Decisão arquitetural, spec, validação de schema |
| `foundation` | GUARDIÃO → ROOT | Nova tabela, schema, tipos — sem UI ainda |
| `logic` | GUARDIÃO → ROOT → ESTRUTURA | Backend completo, sem interface |
| `full` | GUARDIÃO → ROOT → ESTRUTURA → INTERFACE → TEIA | Feature completa |
| `surface` | INTERFACE | Visual, layout, animação — sem tocar dados |

## Os 4 Protocolos internos

1. **Proporção Invertida** — listar o que não sabe antes de construir
2. **Maturação Permissiva** — verificar se a camada anterior está pronta
3. **Detector de Trava** — questionar impulso de assumir o que não foi definido
4. **Tudo Só É** — não forçar conexões entre camadas que não existem no schema

## Localização

**CLAUDE.md** → root de cada repositório que usa este protocolo.
Implementação completa (5 agentes com outputs estruturados) vive no CLAUDE.md do mindroot-v2.

## Teste em produção

Testado em 03 Abr 2026 com migration 007 (protocol: foundation).
Resultado: Guardião pegou divergência session_log/session-log antes do SQL. Cross-check do ROOT completou RPCs + views que spec manual não cobria. Overhead: ~3 min. Veredicto: protocolo ajudou.

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 2026-04-03 | Documento inicial. 5 agentes, 5 valores de protocol, 4 protocolos internos. Testado com migration 007. |
