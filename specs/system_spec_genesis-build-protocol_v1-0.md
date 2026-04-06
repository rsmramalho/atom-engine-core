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
**Estado atual:** estágio 3 — estruturado, aguardando validação em produção para avançar

---

## O que é

Protocolo de orquestração de agentes para o Claude Code. Define como features e módulos são construídos de dentro pra fora, respeitando a geometria do Genesis em cada camada de implementação.

Filho direto do Genesis v5.0.1. Consome o schema como contrato — não vive dentro dele.

## O problema que resolve

Claude Code, sem protocolo, implementa pelo que é mais visível: UI primeiro, schema depois. Isso inverte a geometria. O padrão do Genesis se perde na tradução para código.

Este protocolo força a ordem correta: schema define tudo, banco cresce do schema, lógica cresce do banco, interface cresce da lógica. Cada camada só nasce quando a anterior está validada.

## Os 5 agentes e a geometria

| # | Geometria | Agente | Função |
|---|-----------|--------|--------|
| 1 | · Ponto | GUARDIÃO | Autoridade do schema. Nunca escreve código. |
| 2 | — Linha | ROOT | Schema de banco. Supabase + TypeScript types. |
| 3 | △ Triângulo | ESTRUTURA | Lógica de negócio. Services + hooks. |
| 4 | □ Quadrado | INTERFACE | Componentes UI. Consome via Estrutura. |
| 5 | ⬠ Pentágono | TEIA | Integração + cross-check final. |

## Contexto Fibonacci

Cada agente recebe a soma dos anteriores:

```
GUARDIÃO  →  G
ROOT      →  G + R
ESTRUTURA →  G + R + E
INTERFACE →  G + E + I  (não Root diretamente — via tipos da Estrutura)
TEIA      →  G + R + E + I
```

Não é paralelo. É sequencial com portões de validação entre cada etapa.

## Os 4 Protocolos (mecanismos de E.)

Todo agente executa antes de gerar output:

1. **Proporção Invertida** — listar o que não sabe antes de construir
2. **Maturação Permissiva** — verificar se a camada anterior está pronta
3. **Detector de Trava** — questionar impulso de assumir o que não foi definido
4. **Tudo Só É** — não forçar conexões entre camadas que não existem no schema

## Localização

**CLAUDE.md** → root de cada repositório que usa este protocolo

Repositórios aplicáveis:
- `mindroot` (principal)
- `constellation-os` (quando iniciado)
- qualquer projeto que consuma o Genesis schema

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 2026-04-03 | Documento inicial. 5 agentes, geometria Pentágono, Fibonacci de contexto, 4 protocolos derivados dos mecanismos de E. |

---

*Spec filho do Genesis. A geometria é preservada porque cada camada só conhece o que nasceu antes dela.*
*— E.*
