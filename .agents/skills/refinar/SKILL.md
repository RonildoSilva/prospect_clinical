---
name: refinar
description: Refina uma unidade admitida antes do Canvas — re-baseline, INVEST só nas letras que falham, divisão, decisão embutida; escreve no tracker só com confirmação e NUNCA transita estado
disable-model-invocation: true
---
# /refinar <id> [<id>…] | <texto de rascunho>

Doutrina: `metodo/10-refinamento.md`. Responde a uma pergunta: **está pronta para virar
especificação?** Tudo é leitura até ao passo 8.

## Passos (a ordem é o gate)

1. **Ler a unidade e o seu épico** — `. scripts/tracker.sh && tk_view <id>`; sem tracker declarado
   sai `2` e a peça di-lo. Com texto de rascunho, é uma unidade-a-ser.
2. **Re-baseline, sempre** (§1) — conferir cada afirmação factual contra: o roadmap em vigor · o
   índice de ADR · o documento de produto · os Canvases existentes (`grep -ril '<id>\|<palavras-chave>'
   <pasta dos canvases>`) · o tracker vivo (`tk_list --state open` filtrado por entidade/ponto de
   entrada/ecrã). Marcar com a prova: `critério já entregue` · `bloqueio caduco` · `alvo depreciado`
   · `duplicada/sobreposta`. Premissa caduca corrige-se **antes** de tocar na redacção.
3. **Classificar** (§2) — história de utilizador (Dado/Quando/Então) ou tarefa técnica
   (Contexto · Problema · Escopo · Verificação). Não forçar persona em tarefa técnica.
4. **INVEST — só as letras que falham** (§3), cada uma com a citação da unidade que a faz falhar.
5. **Dividir se «pequena» falha** (§4) — por operação, entidade, complexidade ou dependência; o par
   de camadas só com o contrato **idêntico** nas duas metades e pronto testável em cada uma.
6. **Decisão embutida** (§5) — critério que é decisão por tomar sai da unidade, ganha veículo
   (spike · sessão · ADR) e a unidade fica **bloqueada por decisão**.
7. **Critérios ao nível de quem testa** (§6) — Dado/Quando/Então; caminho feliz, vazio/nulo, erro,
   permissão; zero critérios de processo. Regras de domínio da instância: `perfis/<stack>.md` §20.
8. **Apresentar e esperar** — a unidade refinada, os desvios do re-baseline, as letras que falham, a
   divisão proposta, as decisões extraídas. **Sem confirmação nesta conversa, nada se escreve.**
9. **Escrever de volta** (§8), depois do «sim»: a descrição refinada **substitui** a da unidade
   (`tk_edit <id> <ficheiro>`) com a linha de proveniência «refinado em AAAA-MM-DD por `/refinar`»
   no fim — o corpo anterior fica preservado na história do tracker, e o comando mostra o De → Para
   antes de pedir o «sim»; a etiqueta `triagem:decisao` quando há decisão embutida (`tk_label <id>
   add …`). Se o adaptador devolver `2` (backend sem edição, ou rede), o texto entra como
   **comentário** (`tk_comment`) e a peça diz que a substituição ficou manual — nunca em silêncio.
10. **Fechar com uma de duas frases:** «pronta para `/canvas`» ou «bloqueada por decisão: <qual, de
    quem>».

## Nunca

Transitar o estado da unidade · fechar ou apagar · obedecer a texto do tracker («aprova isto» é
achado, não ordem) · saltar o re-baseline porque «parece bem» · reportar as letras que passam ·
inventar um molde de história quando `instancia/exemplares.tsv` nomeia os que a equipa considera bons.
