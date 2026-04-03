╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     spec                       ║
║ module:   bridge                     ║
║ state:    structured                 ║
║ status:   active                     ║
║ stage:    3 △ Triângulo              ║
║ tags:     [#system, #audit,          ║
║            #guardião, #geometria]    ║
║ source:   claude-project             ║
║ created:  2026-04-03                 ║
║ updated:  2026-04-03                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: Genesis v5.0.1       ║
║   → references: Meta-Template v1.1   ║
║   → references: Genesis Build        ║
║                 Protocol v1.0        ║
║   → feeds: PENTAGON.md               ║
╚══════════════════════════════════════╝

# Guardião Audit v1.0
## Verificação de Alinhamento Geométrico

**Princípio:** O sistema protege quando é usado, não quando existe.

---

## O que é

Ritual de verificação. O Guardião normalmente opera antes de construir — define constraints antes do código nascer. O Audit é o Guardião operando em retrospecto: olha pro que existe e pergunta se ainda está na geometria.

## Quando rodar

| Momento | Trigger |
|---------|---------|
| Wrap semanal | Sempre |
| Antes de iniciar nova fase | Obrigatório |
| Quando algo "parece estranho" | Sob demanda |
| Depois de mudança num documento-lei | Obrigatório |

## O prompt

```
GUARDIÃO AUDIT — [nome do projeto] — [data]

Documentos de referência (ler nesta ordem):
1. Genesis v5.0.1
2. Meta-Template v1.1
3. Genesis Build Protocol v1.0
4. Roadmap do projeto

Reportar em quatro seções:
1. ALINHADO — o que está em conformidade
2. DERIVOU — o que mudou sem seguir o contrato
3. ABAIXO DO PISO — items abaixo do piso mínimo
4. FORA DO GENESIS — o que o Genesis não reconhece

STATUS GERAL: VERDE | AMARELO | VERMELHO
```

## O que fazer com o resultado

| Status | Ação |
|--------|------|
| VERDE | Registrar no PENTAGON.md |
| AMARELO | Criar task no inbox. Não parar o projeto. |
| VERMELHO | Parar. Corrigir antes de continuar. |

## Primeiro uso

Rodado em MindRoot em 03 Abr 2026. Resultado: AMARELO (migrações v1/v2 divergentes, RPCs não rastreadas). Corrigido com migration 007. Status final: VERDE.

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 2026-04-03 | Documento inicial. Testado no MindRoot. |
