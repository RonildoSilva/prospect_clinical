---
name: implementar
description: Implementa um Canvas APROVADO, operação a operação, com os testes de cada grupo; recusa qualquer outro estado; passa a `implemented` só com testes verdes e prepara o texto do pedido com os desvios do Canvas
---
# /implementar <canvas.md>

Doutrina: `metodo/11-especificacao.md` §1 (estado com dono) e `metodo/01-ciclo-de-vida.md` §2-§3.
É a **única** peça que muda um Canvas para `implemented`, e só o faz com a prova ao lado.

## Passos (a ordem é o gate)

1. **Carregar o Canvas** — `scripts/canvas-verify.sh <canvas>` = 0 **e** `status: approved` no
   frontmatter. Qualquer outro estado pára, e diz porquê: `draft`/`review` ainda não fecharam o
   Gate 1; `implemented` já foi; `deprecated` nunca se implementa. **Não há flag que salte isto.**
2. **Base** — ramo `<tipo>/<n>-<slug>` a partir da integração actualizada (`lentes/gitflow.md`);
   nunca a partir de outra feature.
3. **Executar O por ordem** — cada operação na ordem listada, sem saltar nem reordenar; depois de
   cada grupo lógico, o teste que o Canvas manda (`{{CMD_TESTE_FICHEIRO}}`); vermelho corrige-se
   antes do grupo seguinte. Desvio da ordem só com a razão **escrita** para o pedido.
4. **N e S são inegociáveis** — depois de implementar, cada item de S verifica-se com o comando que
   ele cita (teste de arquitectura, teste de fuga de âmbito, ramo negativo do guarda novo); item
   sem prova é must-fix próprio, antes do pedido.
5. **Essencial** — `{{CMD_TESTE_ESSENCIAL}}`, com o postflight de `lentes/preflight.md` §4: o
   comando como correu, a linha com `N > 0`, o exit do processo certo. A suíte inteira não corre
   localmente.
6. **Auto-revisão adversarial** — `revisor` e `tester` (e `ux`/`ui` se toca interface) em subagente
   só-leitura sobre o diff, contra o Canvas: O cumprido? S respeitado? cada critério de R tem um
   teste nomeado? Achado é must-fix **antes** do pedido, não depois.
7. **Estado** — só com tudo verde: `status: approved` → `status: implemented`, e a linha de
   changelog «status → implemented (<N> testes verdes, `<comando>`)». Com um vermelho fica
   `approved`, e o relatório diz qual.
8. **Texto do pedido** — `templates/pr.md`: o Canvas que segue; ficheiros criados, alterados e
   testes; resultados; **Desvios do Canvas** (a lista, ou «nenhum»); «o Canvas está actualizado?» —
   se não, `/canvas --sync` no **mesmo** pedido. Quem abre o pedido é um humano.

## Nunca

Implementar sem `approved` · saltar ou reordenar O sem razão escrita · mudar R · marcar
`implemented` com um vermelho · abrir o pedido ou mergear · adivinhar o que o Canvas não diz —
perguntar.
