---
name: issue-admissao
description: Porteiro da fila de issues — a issue nova merece existir? Marca, NUNCA fecha
disable-model-invocation: true
---
# /issue-admissao <n>

Eixo **MÉRITO**. Aplica **uma** etiqueta e comenta **com a prova**. Não executa a saída: quem julga
a entrada não fecha.

**Antes disto, se o pedido vier de retorno de campo** (teste manual, relato de quem usa, achado fora
do tracker): o achado verifica-se contra o **código real** primeiro, e só entra aqui já com a âncora
da verificação — `metodo/01-ciclo-de-vida.md` §0.6. Sem esse passo, este comando julga o texto de
quem relatou e não o facto: quem relata pode ter usado uma versão antiga ou entendido ao contrário,
e o gate de escopo não distingue as duas coisas.

## O gate de escopo corre ANTES das âncoras

Um grep vazio tem o mesmo aspecto numa funcionalidade por construir, numa que vive noutro sistema,
numa que um registo de decisão **proibiu**, e numa cuja fundação ainda não existe. Por isso:

| | Pergunta | Se falhar |
|---|---|---|
| **E1** fronteira | isto é deste projecto, ou de um sistema vizinho? | fora de escopo — **e aponta o documento** |
| **E2** decisão | há registo de decisão que o proíba? | `triagem:recusada`, citando o registo |
| **E3** precondição | a fundação de que depende existe? | `triagem:decisao` — a ordem é de quem gere |
| **E4** recorte | dá para dizer o que é «feito»? | `triagem:decisao` |

**Fora de escopo aponta sempre um documento.** Sem documento é `triagem:decisao`, não `recusada`.

## Só então, a ausência provada

**Três sinais a zero** — literal · último segmento · ficheiro no caminho convencional. Um sinal só
não prova ausência.

**A polaridade depende do VERBO da issue.** Pede *criar* ⇒ âncora ausente = admitida. Pede *remover*
⇒ âncora **existe** = admitida. Pede *mudar* ⇒ a existência não decide nada: provar o comportamento,
ou cair em `triagem:decisao`. **Ler o verbo antes de olhar para os números.**

## Etiquetas

`triagem:admitida` (escopo E1-E4 **+** ausência provada) · `triagem:recusada` (`ficheiro:linha` +
teste) · `triagem:duplicada` (issue **mais antiga**, escopo **lido**, não inferido do título) ·
`triagem:decisao` (o que trava não é código — **a decisão nomeada, e de quem é**).

## Nunca

Fechar uma issue · apagar uma issue (fechar é reversível; apagar não) · decidir valor de produto.
