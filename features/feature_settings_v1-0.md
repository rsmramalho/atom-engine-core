# Feature: Settings

**Versão:** 1.0
**Data:** 05 Abr 2026
**Status:** live
**Wireframe:** `design/wireframes/mindroot-wireframe-settings.html`

---

## 1. Identidade

Controle — o humano configura, o sistema obedece.

---

## 2. Propósito

Settings é onde o humano tem controle total: aparência (light/dark/system), conectores (Google, Gmail, Agent), conta, export, e acesso ao Raiz. Mínimo possível de opções. Cada toggle existe porque alguém precisou dele. Sem settings preventivos.

---

## 3. Não é

- **Não é painel de administração.** Settings é pessoal. Admin é Supabase dashboard.
- **Não é lugar de features.** Conectores aparecem aqui pra configurar, mas o painel de uso é na Home/Calendar.

---

## 4. Estado atual

- Page `/settings`
- Theme toggle (system/light/dark)
- Seção conectores: Google Calendar (conectado/desconectado), Gmail (em breve), Drive (em breve)
- Account info
- Export (ATOM ENVELOPE, Obsidian .md, JSON backup)

### Arquivos

```
src/pages/Settings.tsx
```

---

## 5. Visão

- Atom Agent settings: path do AtomDrive, scan frequency
- Library Feed settings: fontes RSS, cap diário, filtros por canal
- Notification preferences: quais nudges do Companheiro são bem-vindos
- Data export: full backup → JSON → importável em nova instância

---

## 6. Conexões

| Com | Relação | Detalhe |
|-----|---------|---------|
| Conectores | belongs_to | Painel de conectores vive em Settings |
| Raiz | references | "Minha raiz" acessível via Settings |

---

## 7. Versionamento

| Versão | Data | Mudança |
|--------|------|---------|
| 1.0 | 05 Abr 2026 | Documento inicial |
