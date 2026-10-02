---
name: pr-review
description: Revê UM pedido — Gate 0, piso invariante, board roteado pelo toque, veredito com prova
disable-model-invocation: true
---
# /pr-review <n>

Revê um pedido do princípio ao fim e mantém o arquivo vivo até haver veredito. **Não mergeia.**

## Passos (a ordem é o gate)

1. **Ledger** — `scripts/pr-ledger-gate.sh antes <n> <sha>`. Já boardado neste SHA ⇒ **não refazer**.
2. **Gate 0** — `scripts/pr-batch.sh gitflow <n>`. Base ilegítima ou rascunho ⇒ **veto, sem board**.
   Nome fora do padrão ⇒ must-fix **com o board a correr**, e o veredito imprime o **nome recomendado**.
   O remédio (fechar e reabrir sob o nome certo) só se propõe **quando o mérito estiver limpo**
   — 0 must-fix de código: a conversa que se perde passa a ser a de uma revisão concluída, não
   a de uma viva. **Não apagar o ramo antigo** (é o que mantém o reabrir disponível), e correr
   `scripts/pr-batch.sh fila` a seguir: a autoria passa para quem recria, e a fila re-atribui.
3. **Fila** — `scripts/pr-batch.sh fila`. Preso por contacto de terreno ⇒ etiquetar, comentar qual o
   destranca, **não correr o board**.
4. **Disjuntores** — `scripts/pr-batch.sh churn <n>`, nos **dois** eixos. Ao disparar: escalar, não boardar.
5. **Piso invariante** — `scripts/piso-invariante.sh TODOS`. O que ele apanha, o board não gasta token.
6. **Router** — `metodo/04-review-router.md`: tier → toque → lentes → **fatia vinculada**.
   O `revisor` corre sempre; `security` é obrigatória em autorização, âmbito, rota pública ou entrada.
7. **Qualidade** — `scripts/qualidade-diff.sh` e nomear as etiquetas com a **prova**. Nunca de cabeça,
   e **nunca uma etiqueta de segurança tirada do analisador** — quem julga segurança é a lente.
8. **Frescura** — `scripts/pr-batch.sh vivo <n>=<sha>` **outra vez**, antes de publicar. `MOVEU` ⇒ reler o delta.
9. **Veredito em TEXTO**, com o SHA, em todos os pedidos tocados. Etiqueta sem comentário obriga
   quem lê a adivinhar. Cada achado é must-fix **ou** spin-off **com a issue já criada**.
10. **Registar** — `scripts/pr-ledger-gate.sh regista <n> <sha> board`.

## Nunca

Mergear · aprovar · fechar · mudar a base · renomear a branch de um pedido aberto (fecha-o) ·
escrever «provavelmente correcto» · deixar achado sem destino.
