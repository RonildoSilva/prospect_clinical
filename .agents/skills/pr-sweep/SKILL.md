---
name: pr-sweep
description: Revisão em lote dos pedidos abertos — triagem, fila por contacto, board só em quem passa
disable-model-invocation: true
---
# /pr-sweep

O mesmo de `/pr-review`, em lote, com uma diferença que é o ponto: **a lista envelhece em minutos**.

1. `scripts/pr-batch.sh fila` — a ordem, já com contacto de terreno. Quem não toca em ficheiro
   nenhum dos anteriores do mesmo autor **não é segurado**.
2. `scripts/pr-batch.sh gitflow <todos>` e `churn <todos>` — Gate 0 e disjuntores de uma vez.
3. `scripts/pr-ledger-gate.sh antes` por pedido — nunca rever duas vezes o mesmo SHA.
4. Board só nos que passaram os três filtros, por ordem crescente, **um autor de cada vez**.
5. **Antes de publicar qualquer veredito**: `scripts/pr-batch.sh vivo <n>=<sha> …` outra vez.
   Três formas de envelhecer, todas medidas no mesmo varrimento: mergeado a meio · aberto depois
   da triagem · head movido entre ler o diff e publicar.
6. **Qualidade, por pedido** — `scripts/qualidade-diff.sh` sobre as linhas adicionadas, e nomear
   cada etiqueta **com a prova**. Nunca de cabeça. E **nunca uma etiqueta de segurança tirada do
   analisador**: quem julga segurança é a lente `security`, contra o diff — numa base medida, 127
   de 142 avisos de acessibilidade do analisador eram falsos, e a maioria acusava um padrão que um
   registo de decisão tinha fixado.
7. `scripts/pr-ledger-gate.sh depois <n> <sha>` por pedido — a varredura **não fecha** com um board
   que não ficou no ledger.

**Antes de mergear a leva:** `scripts/composicao-verify.sh --lote`. Verde por pedido não é verde na
base composta.
