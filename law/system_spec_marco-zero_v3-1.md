# Marco Zero — Guia Operacional

**Versão:** 3.1
**Última atualização:** 06 Abr 2026
**Princípio:** Este documento responde a pergunta mais básica de qualquer usuario: "Acordei. E agora?"

---

## 1. Perfil do usuario — exemplo

### 1.1 Exemplo de perfil operacional

> Este e um exemplo anonimizado de como um usuario configura seu perfil no Atom. Cada pessoa preenche o seu.

**Forcas:**
- [lista de forcas do usuario]

**Padroes de atencao:**
- [como a pessoa pensa — divergente/convergente, velocidade, organizacao]

**Tensoes centrais:**
- [as tensoes produtivas que movem a pessoa — ex: velocidade vs presenca, construir vs estar presente]

### 1.2 Principio fundamental

> O usuario nao quer ser mais produtivo. Quer ser mais presente. Os sistemas sao o meio — a presenca e o fim.

Este principio governa toda decisao de design. Se uma feature otimiza pra produtividade mas reduz presenca, ela esta errada.

---

## 2. Ritual do dia

### Princípio: mesmo ritual, todo dia. Sem decisão. Sem improviso.
**Consistência imperfeita > sistema perfeito que ninguém usa.**

### 2.1 Aurora — 05h às 08h — Deep work

| Hora | O quê | Como |
|------|-------|------|
| Aurora | Acordar. Sem celular. | Café. 5 min silêncio. Nada digital. |
| +15min | Abrir o sistema. "Bom dia." | O sistema puxa estado + audit leve, pergunta foco do dia. |
| 05:20 | Decidir foco do dia. | Uma frase: "hoje é dia de [X]". |
| +30min | Deep work. | Monitor = projeto. Notificações off. |

### 2.2 Zênite — 08h às 17h — Operar + executar

| Hora | O quê | Como |
|------|-------|------|
| 08:00 | Check email principal. 15 min máx. | Urgente → responde. Resto → captura no Atom. |
| 08:30 | Trabalho operacional se for o dia. | Ferramentas do projeto. Ideias fora → captura rápida. |
| 12:00 | Pausa real. Sair do PC. | Se surgiu algo → uma frase no Atom. Não resolver agora. |
| 13:00 | Bloco 2: continuar foco ou trocar. | Decidir em 10 seg. Não ficar entre dois projetos. |

### 2.3 Crepúsculo — 17h em diante — Fechar + estar presente

| Hora | O quê | Como |
|------|-------|------|
| 17:00 | Atom wrap. Fechar o dia. | MindRoot propõe wrap + audit completo. Usuario confirma. Supabase commita. |
| 17:15 | Fechar tudo. | Família, descanso, vida. O sistema cuida do resto. |

### 2.4 Audit ritual

**Aurora (leve):** Último wrap commitado? Inbox vazio? Docs misplaced?
**Crepúsculo (completo):** + naming, connections, folder growth rule, duplicatas, órfãos.
Resultados vivem na seção AUDIT do wrap.

---

## 3. Apps e canais

### 3.1 Stack minima

**Sempre abertos:** MindRoot (cockpit principal), Claude.ai ou agente AI (sessoes profundas)
**Quando necessario:** Email (2x/dia), calendario, mensagens, editor de codigo, ferramentas de trabalho

### 3.2 Regra de ouro

**Nao abrir email nem mensagens antes do bloco de deep work.** A manha e pra deep work.

---

## 4. Regras de sobrevivência

### 4.1 "Não sei por onde começar o dia"
Abre o sistema. Digita "bom dia". O sistema te diz onde tu parou e o que tá pendente. Tu escolhe um. Só um.

### 4.2 "Tive uma ideia genial no meio de outra coisa"
Captura rápida: abre o Atom, digita uma frase. Não classifica. Não organiza. Volta pro que tava. O sistema organiza no wrap.

### 4.3 "Atlas invadiu meu bloco de deep work"
Urgente (cliente esperando hoje) → 15 min e volta. Importante → captura e resolve no bloco Atlas.

### 4.4 "Tenho 100 coisas e não sei priorizar"
"Me ajuda a priorizar". O sistema propõe: 1 pra hoje, 3 pra semana, resto é someday.

### 4.5 "Perdi o fio — não sei o que foi decidido"
O sistema mostra o último wrap. Tudo tá lá.

### 4.6 "O medo apareceu — parece que nada tá avançando"
Olha o Graph View. Cada nó é progresso real. Tu não tá parado. Tá construindo.

### 4.7 "Quero trabalhar em tudo ao mesmo tempo"
Escolhe UM. "Hoje é dia de [X]". Não troca até o wrap.

### 4.8 "Coloquei algo no inbox e nada aconteceu"
Capturas devem acontecer diretamente no sistema. A automação está planejada mas ainda não implementada. Workaround: despeja no sistema, o agente processa no wrap.

### Princípio
**Captura rápida > classificação perfeita.** Tu despeja, o sistema organiza. Tu decide, o sistema documenta. Tu cria, o sistema arquiva.

### Regra fundamental: INBOX OBRIGATÓRIO
A partir do go live, TODO item que não seja um documento-lei (Genesis, Marco Zero, Meta-Template) entra pelo inbox (estágio 1) e percorre o pipeline. Sem exceção. Sem atalho. Tudo na vida passa pelo Genesis. Receita, tarefa, ideia, reflexão, recomendação — tudo entra pelo ponto e cresce de dentro pra fora.

---

## 5. Soul Layer — registro emocional

### Princípio: presença sobre produtividade.

### 5.1 Três momentos do dia

**Aurora — "bom dia"**
O sistema pergunta: "como tu tá chegando hoje?"
Registra: `emotion_before` (linguagem livre) + `energy` (high/medium/low) + `intention` (frase do foco)

**Task significativa (peso > 1)**
Milestones, entregas, decisões difíceis → o sistema pergunta: "como foi?"
Registra: `emotion_after` na task. Nunca em tasks triviais. Nunca atrapalha o flow.

**Crepúsculo — wrap**
O sistema pergunta: "como tu tá saindo hoje?"
Registra: `emotion_after` + `energy` + `shift` (aurora → crepúsculo)

### 5.2 Como aparece no wrap

```
SOUL:
  aurora: ansioso | energy: high
  intention: "fechar a spec do cockpit"
  ---
  task:spec-cockpit → aliviado
  ---
  crepusculo: satisfeito | energy: low
  shift: ansioso → satisfeito
```

### 5.3 Regras do Soul Layer

1. **Nunca forçar.** Se o usuario diz "bora trabalhar" sem emoção, tá ok. O sistema não insiste.
2. **Linguagem livre.** "Meio bosta" é válido.
3. **Task check-in só em peso > 1.** Milestones, entregas, decisões difíceis.
4. **Dados vivem no wrap.** Seção SOUL.
5. **Padrões, não julgamentos.** O sistema observa tendências. Nunca diz "tu deveria estar mais calmo."

---

## 6. Regras do agente

1. **Entender o contexto, não só o pedido** — Otimizar pra clareza mental, não pra produtividade.
2. **Acompanhar a velocidade sem perder o fio** — Nunca pedir pra "focar".
3. **O usuario cria, o agente organiza** — Nomes, pastas, classificação, versões = agente.
4. **Honestidade sempre. Validação nunca.**
5. **Cuidado com a racionalização** — "A decisão já tá tomada — quer que eu execute ou quer análise honesta?"
6. **Documentar é executar.**
7. **Lingua nativa do usuario, sempre** — Exceto código/operacional.

---

## 7. Atom Drive — destino de exports

O Drive não é mais a source of truth. Items vivem no Supabase. O Drive recebe exports quando faz sentido (compartilhar, arquivar, ler offline). A estrutura de pastas permanece como destino organizado.

```
Atom Drive/
├── inbox/
├── mod-work/
│   ├── project-[nome]/
│   └── library/
├── mod-body/
│   └── library/
├── mod-mind/
│   ├── library/
│   └── logs/
├── mod-family/
├── mod-purpose/
│   └── project-[nome]/
├── mod-bridge/
├── mod-finance/
├── mod-social/
└── system/
    ├── spec_atom-genesis-v5           ← Export do Genesis
    ├── spec_marco-zero                ← Export deste documento
    ├── templates/                      ← Referência histórica (type_schemas vivem no Supabase)
    └── logs/                           ← Wraps + session-logs exportados
```

### Regra de crescimento
Pastas só são criadas quando o primeiro export vai pra lá.

### Source of truth
- **Schema e regras:** 3 docs-lei na Knowledge base do Project Atom
- **Dados operacionais:** Supabase (items, connections, events)
- **Drive:** export/impressora — nunca fonte

---

## Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 2026-03-22 | Documento inicial — perfil + ritual + emails + sobrevivência + regras agente + drive map |
| 1.1 | 2026-03-23 | Audit ritual 2x/dia (aurora leve + crepúsculo completo) |
| 1.2 | 2026-03-29 | Seção 4.8 — inbox do Drive não automatizado, workaround documentado |
| 1.3 | 2026-03-31 | Clean start — connections Genesis v4.2, Drive map atualizado, Soul Layer seção 5, regra inbox obrigatório, versão sincronizada |
| 2.0 | 2026-04-01 | Arquitetura v5: Drive→export (seção 7), MindRoot→cockpit principal (seção 3.2), wrap→Supabase (seção 2.3), Genesis v5 referenciado |
| 3.0 | 2026-04-06 | Reescrita universal: perfil pessoal vira exemplo anonimizado, emails/apps viram template, ritual do dia generalizado, regras do agente universais. O documento agora serve qualquer usuario do Atom, nao um usuario especifico. |
| 3.1 | 2026-04-07 | YAML frontmatter legado removido (docs-lei são anteriores ao contrato — ver Genesis v5.0.4 Part 1). Rodapé corrigido: Drive removido como source of truth. |

---

*Este documento é a fundação operacional do Atom Engine. Vive na Knowledge base do Project Atom como source of truth.*
