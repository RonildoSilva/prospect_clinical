---
name: backlog-ordem
description: O que atacar a seguir — ordena o já ADMITIDO pela fase declarada, e diz o que bloqueia
---
# /backlog-ordem

Corre a lente [`produto`](../../lentes/produto.md).

1. Ler `instancia/fase-atual.yml` — fase, evidência, **critério de saída**, fase seguinte. Sem
   critério de saída a ordenação não tem fundamento, e o relatório **di-lo**.
2. Filtrar: só o que tem marca de admissão. O resto sai numa lista **separada e contada**
   («N por triar»), nunca no fundo da ordem.
3. Ordenar por: aproxima do critério de saída → algo depende disto → custo de não fazer.
   Empate resolve-se por **menor custo**, nunca por preferência.
4. Listar os bloqueios **com dono nomeado**. Um bloqueio sem dono não se resolve.

**Nunca** admite, etiqueta, fecha ou abre issue. Valor de produto não é veredito de quem ordena.
