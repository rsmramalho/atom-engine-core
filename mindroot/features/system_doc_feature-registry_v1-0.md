╔══════════════════════════════════════╗
║          A T O M   E N V E L O P E  ║
╠══════════════════════════════════════╣
║ id:       [a gerar no Supabase]      ║
║ type:     doc                        ║
║ module:   bridge                     ║
║ state:    connected                  ║
║ status:   active                     ║
║ stage:    5 ⬠ Pentagono              ║
║ tags:     [#system, #registry,       ║
║            #features]                ║
║ source:   claude-project             ║
║ created:  2026-04-05                 ║
║ updated:  2026-04-08                 ║
╠══════════════════════════════════════╣
║ connections:                         ║
║   → references: all 14 feature specs║
║   → references: Genesis v5.0.4      ║
╚══════════════════════════════════════╝

# MindRoot — Feature Registry

**Versão:** 1.0
**Data:** 05 Abr 2026
**Status:** active
**Princípio:** Cada feature é um organismo. Nasce pequena, cresce de dentro pra fora, tem identidade própria. Este registro documenta cada uma individualmente — o que é, o que não é, onde está, pra onde vai.

---

## O que é isto

Um documento vivo onde cada feature do MindRoot tem sua própria seção versionada. Não é roadmap (roadmap é sequência). Não é spec (spec é detalhe técnico). É o **mapa de identidade** de cada feature — propósito, limites, estado, visão.

Cresce de dentro pra fora: primeiro documenta o que existe, depois o que vai existir. Cada feature avança no ritmo dela. Uma pode estar na v3.0 enquanto outra ainda é v0.1.

**Onde vive:** `atom-engine-core/features/`
**Um arquivo por feature:** `feature_[nome]_v[N-N].md`
**Registry (este arquivo):** índice + conexões entre features

---

## Anatomia de uma feature

Toda feature segue esta estrutura:

```
1. Identidade — o que é, em uma frase
2. Propósito — por que existe (não o que faz)
3. Não é — o que parece mas não é (limites claros)
4. Estado atual — o que existe hoje no código
5. Visão — pra onde vai (sem prazo, sem promessa)
6. Conexões — como se relaciona com outras features
7. Versionamento
```

---

## Índice

| # | Feature | Versão | Status | Identidade |
|---|---------|--------|--------|------------|
| 01 | Raiz | 1.0 | live | Guardião da vida — diagnóstico dos 9 domínios |
| 02 | Library | 1.0 | live | Acervo universal — tudo que entrou no sistema |
| 03 | Pipeline | 1.0 | live | Esteira Genesis — do ponto ao círculo |
| 04 | Wrap | 1.0 | live | Ritual de fechamento — commit do dia |
| 05 | Soul | 1.0 | live | Camada emocional — presença sobre produtividade |
| 06 | Triage | 1.0 | live | Motor de classificação — IA + humano |
| 07 | Captura | 1.0 | live | Ponto de entrada — texto vira item |
| 08 | Graph | 1.0 | live | Raio-x — visualização das conexões |
| 09 | Conectores | 1.0 | parcial | Portas de entrada — API + filesystem |
| 10 | Companheiro | 0.1 | futuro | IA contextual — o sistema pensando |
| 11 | Calendar | 1.0 | live | Tempo — rituais e eventos |
| 12 | Projects | 1.0 | live | Pentágono pessoal — work em progresso |
| 13 | Analytics | 1.0 | live | Espelho numérico — padrões que o dia a dia esconde |
| 14 | Settings | 1.0 | live | Controle — o humano configura, o sistema obedece |

---

## Conexões entre features

```
Captura → Pipeline → Triage → Library
                        ↓
                      Graph ← Conexões
                        ↓
Soul ← Wrap → Library (items committed)
  ↑
Raiz (diagnóstico) ← Conectores (ingestão)
                        ↑
              Calendar ← Conectores
                        ↑
            Companheiro (observa tudo, sugere)
```

---

## Regras

1. **Uma feature por arquivo.** Nunca misturar duas features no mesmo doc.
2. **Versão independente.** Raiz pode ser v3.0 enquanto Companheiro é v0.1.
3. **"Não é" é obrigatório.** Limites claros previnem feature creep.
4. **Visão sem prazo.** O "pra onde vai" existe pra dar direção, não pra criar cobrança.
5. **Estado atual = verdade.** Se diz que tem, tem que existir no código. Se não existe, é Visão.
6. **Este registro indexa.** Os detalhes vivem nos arquivos individuais.

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 05 Abr 2026 | Documento inicial — conceito + índice + 14 features documentadas (12 live, 1 parcial, 1 futuro) |
