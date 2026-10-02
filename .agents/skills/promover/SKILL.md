---
name: promover
description: Integração → publicação, com a análise do commit EXACTO a promover
disable-model-invocation: true
---
# /promover

A integração absorve; a publicação só recebe este pedido. A direcção inversa é **sempre livre** e
não tem gate — a assimetria é o ponto.

`scripts/promocao-gate.sh <sha>` verifica **três** coisas, e a terceira é a que discrimina:
portão conforme · zero achados por resolver · **a análise é do commit exacto**. «Cem por cento» num
instantâneo velho não diz nada: já aconteceu o painel dizer «conforme» sobre uma revisão anterior
aos 25 commits que estavam para subir.

`1` bloqueia; `2` nunca é aprovação.
