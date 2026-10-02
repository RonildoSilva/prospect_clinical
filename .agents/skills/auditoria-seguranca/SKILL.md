---
name: auditoria-seguranca
description: Auditoria do PROJECTO INTEIRO — cinco vacilações, histórico git, cabeçalhos, LLM
---
# /auditoria-seguranca

Corre a lente [`auditoria-seguranca`](../../lentes/auditoria-seguranca.md). Periódica, e antes de
uma publicação grande.

1. `scripts/auditoria-seguranca.sh --saida qa/auditoria/<data>.md` — **coletor mede**.
2. `scripts/segredos-repo.sh --historico` — o eixo que o board nunca vê. Achado com remoto está
   **queimado**: o relatório pede **rotação**, e o valor nunca aparece. E `--arvore` para a árvore
   inteira, **de propósito** (uma passagem; `FORGE_SEGREDOS_TIMEOUT` s e depois `2`) — `--diff` sem
   base já não varre a árvore em silêncio.
3. Julgar cada sinal contra o perfil §3, §14 e §15 — e, nos eixos 7-11, contra o documento de
   `seguranca/` que o cabeçalho da secção cita. Sinal não é achado.
4. Escrever a secção **«não verificado»**, obrigatória, com motivo e o que a desbloquearia.
5. Comparar com a auditoria anterior: entrou, saiu, saldo, por vacilação.

**A conclusão nunca é «seguro».** É o que foi medido, com o que não foi medido ao lado.
**Nunca** abre issue, comenta um pedido, imprime credencial, ou sai da máquina local.
