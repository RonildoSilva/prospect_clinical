---
name: plano-vivo
description: Mantém o plano vivo — painel antes/depois de tudo o que está aberto, verificado contra o código, com o rácio e a ordem de ataque
---
# /plano-vivo [<âmbito>]

Corre a lente [`produto`](../../lentes/produto.md) sobre **tudo o que está aberto** no âmbito, e
escreve **um** ficheiro `plano-vivo-<âmbito>.md` (molde: `templates/plano-vivo.md`) no arquivo
privado — reescrito **no lugar**, nunca um por dia. Doutrina: `metodo/09-planeamento.md` §3.

1. **Factos por coletor, nunca de memória.** Ler as unidades abertas pelo adaptador do tracker
   declarado (`. scripts/tracker.sh; tk_list --state open` — issues, Jira, Linear; `plataformas/tracker.md`) nos **três recortes** — criei para mim ·
   criei para outro · outro criou para mim — e só depois separar. Zero num recorte é um sinal sobre
   o processo, e escreve-se. Cruzar com o histórico real pelo adaptador da plataforma
   (`. scripts/plataforma.sh; pf_pr_list --state merged`) e por `git log`: o tracker mente nas duas
   direcções. **Não há coletor único** que faça o cruzamento — é da instância, e escreve-se o método de
   contagem ao lado do número.
2. **O rácio antes da lista**: `scripts/backlog-racio.sh --json` — admitidas · em decisão · por triar ·
   sem tamanho. Se as em decisão forem mais do que as admitidas, é a primeira frase do plano. Bilhete
   contra nevoeiro o coletor não mede: lê-se o comentário de triagem de cada unidade em decisão.
3. **Selar cada unidade com prova no código** — ENTREGUE · RESOLVIDA · PARCIAL · ABERTA · NÃO
   VERIFICADA (com o motivo). `ficheiro:linha`, saída de teste com `N > 0`, ou o grep vazio com o
   instrumento provado. Título de pedido não é prova.
4. **Gate de delta**: só se re-aprofunda a unidade nova, a que mudou no tracker, ou a cujos
   ficheiros-prova mudaram desde o SHA registado (`git diff --name-only <SHA>..HEAD`). O resto
   mantém selo e data.
5. **Gate de escopo**: só entra na ordem de ataque o que tem a marca de admissão; o resto sai
   contado como «por triar». Ordenar por: aproxima do critério de saída da fase → algo depende
   disto → custo de não fazer; urgência à frente do foco.
6. **Decisões por quanto destrancam** — uma por sessão de quem decide, com a proposta que a
   triagem já escreveu.
7. **Escrever o ficheiro** pela ordem do molde e correr o gate:

   ```bash
   scripts/plano-verify.sh <caminho>/plano-vivo-<âmbito>.md
   ```

   `0` para dar por feito. `1` diz o que falta. `2` é «não medi», nunca aprovação.

**Invioláveis:** a coluna «Estado na 1.ª leitura» é imutável · nunca se apaga uma linha · «Mudou
em» só quando o selo muda · tamanho nunca se inventa (sem etiqueta e sem medição, `—`) · a secção
«o que NÃO foi medido» é obrigatória · papéis, nunca nomes.

**Nunca** fecha, etiqueta, comenta ou abre uma unidade no tracker — propõe; quem age é
`/issue-estado`. Não corrige código. Valor de produto não é veredito de quem ordena.
