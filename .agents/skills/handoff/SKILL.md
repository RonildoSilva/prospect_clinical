---
name: handoff
description: Escreve a retoma da sessão — um ficheiro, oito secções, incluindo o que NÃO foi medido
---
# /handoff [<tema>]

Corre a lente [`handoff`](../../lentes/handoff.md). Escreve **um** `RETOMA-<tema>-<AAAA-MM-DD>.md`
ao lado do trabalho, a partir de `templates/handoff.md`.

**Fotografa; não melhora.** Nada de correr testes «para deixar verde», corrigir a coisa pequena que
se vê, ou fechar a issue que ficou óbvia — uma retoma que arruma antes de fotografar descreve um
estado que nunca existiu, e a correcção não passou por revisão.

Existe já retoma do mesmo tema? **Actualiza-se essa** e diz-se o que mudou; não se cria a segunda.

Fechar com `scripts/handoff-verify.sh <ficheiro>` = 0.
