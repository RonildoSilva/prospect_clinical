---
name: deploy
description: Publicação com cópia verificada, salto medido, reversão escrita antes e fumo integrado
disable-model-invocation: true
---
# /deploy

As duas garantias: **não perder dados** · **poder voltar atrás**.

1. `scripts/deploy-gate.sh` — cópia **restaurável** (não «existe»), salto medido, reversão escrita
   com as três listas, essencial verde. **`2` nunca é aprovação.**
2. **Listar a ordem de merge**, mesmo com um pedido só.
3. Migração destrutiva na leva ⇒ a reversão de **código** não chega. Dizer o que não se desfaz.
4. Publicar (humano nomeado; a ferramenta é do perfil §13).
5. `scripts/smoke-uniao.sh` — sobre o sistema **integrado**, não sobre a peça publicada.

**Nada vai a produção sem `commit → push → review → merge`.** Uma árvore de trabalho não é revista,
não é rastreável e não volta atrás.
