---
name: issue-estado
description: Eixo estado — já está feita? bem etiquetada? na ordem certa? Este FECHA, com prova
disable-model-invocation: true
---
# /issue-estado [<n>…]

Eixo **ESTADO**. É o único que fecha, e fecha com **prova do escopo inteiro** — não da primeira
âncora que apareceu.

1. Ler a issue e extrair **cada** coisa que ela pede (não só o título).
2. Para cada uma: prova no código (`ficheiro:linha`), teste que a exercita, ou o grep vazio **com o
   instrumento provado**. Uma issue com três pedidos e uma prova **não fecha**.
3. Fechado ⇒ comentar com a prova, **antes** de fechar.
4. Parcialmente feito ⇒ **não fecha**: comentar o que falta, com o comando.
5. Obsoleto ⇒ tirar da fila com a razão escrita; **não apagar**.

**Nunca planear contra o registo de trabalho sozinho** — ele mente nas duas direcções: diz feito o
que não está, e por fazer o que já está.
