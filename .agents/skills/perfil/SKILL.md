---
name: perfil
description: Rascunha o perfil de stack de UMA instância a partir do repositório — coletor primeiro; as sete secções do perfil mínimo antes das outras; toda âncora ficheiro:linha verificada HOJE por grep -n, com data; [?] no que não mediu; preenchido honesto (perfis-verify a 0) — e PÁRA para validação. Nunca aponta FORGE_PERFIL nem escreve no perfis/ do método
context: fork
---
# /perfil <raiz> [--stack <nome>] [--out <ficheiro>]

Doutrina: `perfis/README.md` §4 (como se escreve), §4.3 (o primeiro degrau) e §2 (o «não se aplica» nas duas
direcções); `normas/lentes.md` §5.4 (exemplo de outra stack não entra) e §5.9 (vazio lido como ausência).
Molde: `perfis/_template.md`. O perfil é a **tabela de tradução** do método para esta stack — não é norma
de código nem guia de boas práticas.

## 1. Coletor primeiro — o comando nunca adivinha a stack

```bash
scripts/stack-detectar.sh <raiz>          # o que reconheceu, o que viu, o que falta
scripts/stack-detectar.sh <raiz> --env    # FORGE_STACK_RECONHECIDA · FORGE_MARCADOR · FORGE_LINGUAGENS · sinais
```

| Saída | O que se faz |
|---|---|
| `0` — perfil do catálogo proposto | **Pára.** A instância aponta `FORGE_PERFIL` para o perfil do catálogo (`instancia-inicializar.sh` já o propõe); reancorar esse perfil nas linhas da instância é outra leva, por triar — não é este comando |
| `1` — stack reconhecida SEM perfil | Continua: `FORGE_STACK_RECONHECIDA` dá o rótulo, `FORGE_MARCADOR` o directório de referência das convenções, `FORGE_LINGUAGENS` o que activa nas lentes, `FORGE_FERRAMENTAS_EM_FALTA` o que §8-§9 vão dizer que não existe |
| `2` — nada reconhecido | **Pára** e di-lo: um perfil sem marcador é um perfil sem âncora |

## 2. O ficheiro de partida e o de chegada

1. Nome da stack: `--stack`, ou o rótulo do coletor em kebab-case (`typescript-node-express`, `java-gradle-android`).
2. Partida: `cp perfis/_template.md`. **Desde 2026-09-09 não há esqueletos no catálogo** — os nove perfis estão a `22/22`, e um perfil do catálogo faz o coletor sair `0` (o comando pára, §1). A regra fica escrita para o dia em que um esboço volte a existir: se `perfis/<stack>.md` existir com `preenchido: 0/22`, parte-se dele; senão
   `cp perfis/_template.md`. Manter a numeração; apagar as linhas «Pergunta/A lente espera» ao preencher.
3. Chegada: `--out`, ou `<raiz>/.forge/perfis/<stack>.md` da instância. **Nunca** `perfis/` do método: um perfil do
   catálogo exige fixture com `.ancoras` (`perfis/README.md` §4.2); este é o perfil **da instância**.
4. Bloco do topo: `stack`, `versao` (do manifesto, com o `grep` que a lê), `medido_em` = hoje, `linguagens`,
   `preenchido: 0/22` — sobe no fim, contado, nunca estimado.

## 3. Inventário por comando — §0 antes de tudo

Cada número de §0 traz o comando que o conta e a data: `find <dir> -name '*.<ext>' | wc -l`, `grep -rc`, o
`grep -n` no manifesto para a versão. **Um número sem comando não se cita.** O SHA do repositório
(`git -C <raiz> rev-parse --short HEAD`) entra na tabela: as âncoras são desse commit.

## 4. As sete do mínimo primeiro — pela ordem de `perfis/.minimo`

§0 → §1 → §3 → §4 → §7 → §17 → §19. É o degrau que destranca `security`, `dados`, `tester`, `corretor`,
`handoff`, o carregador, as regras por caminho e o mapa app→teste (`perfis/README.md` §4.3). Só depois as outras
quinze, pela ordem do molde. Para cada secção:

1. Ler a **pergunta** do molde e o que a lente que a cita espera encontrar.
2. Procurar no repositório por `grep -rn` / `find` / leitura — **nunca por execução** (correr a suíte, migrar,
   subir serviços é do `tester`, do `dados`, do `preflight`; aqui lê-se a configuração e escreve-se «não corrido»).
3. Toda âncora é `ficheiro:linha` **verificada hoje**: `grep -n '<padrão>' <ficheiro>` devolve essa linha, e a
   secção diz «medido AAAA-MM-DD». Âncora que não se conseguiu verificar não entra.
4. «Não há X» só com o instrumento provado (§5.9): o grep da **família** devolve `> 0` e o do mecanismo devolve
   `0` — os dois números ficam escritos (ex.: `res\.` 69 · `res\.render` 0 ⇒ sem vistas servidas).
5. O que não se mediu fica **`[?]` — falta medir: <o quê>**, com o mecanismo provável se houver. `[?]` numa linha
   basta para a secção não contar como preenchida; é dívida visível, não defeito.
6. Chave de instância que o perfil fixa (`FORGE_CMD_*`, `FORGE_DIR_*`, `FORGE_MAPA_APP_TESTE`, regex de §20)
   escreve-se com a marca **(proposta; a instância confirma)** e vai para a lista final — o comando não escreve
   em `instancia/stack.env`.

## 5. O que nunca entra

- Exemplo de **outra** stack ou de outra casa no corpo (`normas/lentes.md` §5.4): reescreve-se no equivalente
  desta, ou fica `[?]`. Os perfis do catálogo servem de **forma**, não de conteúdo.
- Âncora de fixture como se fosse da instância; contagem sem data; prosa a subir `preenchido`.
- Nome de pessoa, organização, conta, caminho de máquina, credencial — `scripts/vocabulario-verify.sh <perfil>` = 0
  e `perfis-verify.sh` P5 a 0 (nem em exemplo).
- `FORGE_ARQUITETURA`: o coletor dá **sinais** (`FORGE_SINAIS_ARQUITETURA`); a arquitectura é decisão de quem
  gere (§2 escreve a proposta com o sinal que a sustenta, e diz que é proposta).

## 6. Reexecutar cada comando citado — antes dos gates

O rascunho cita um comando por número. **Correr todos outra vez** e comparar com o que está escrito: `grep -oE
'`(grep|find|ls|sed|awk)[^`]*wc -l`' <perfil>` lista-os. Um número escrito antes de o comando correr é o defeito
que este passo apanha — na primeira prova deste comando (2026-09-08) doze «= 0» tinham sido escritos por
expectativa e três estavam errados (13 acertos de «critical» que eram domínio; 19 de «audit» que eram «Auditive»;
um `CREATE INDEX` numa pasta chamada `seeds`). O grep de uma **família** que devolve mais do que o esperado
lê-se antes de se escrever «não há»: pode ser homónimo, pode ser o mecanismo com outro nome.

## 7. Gates antes de parar

```bash
scripts/perfis-verify.sh <perfil>        # P2: preenchido = secções sem [?]; P4: secções citadas existem; P5: credencial
scripts/vocabulario-verify.sh <perfil>   # sem identidade de instância no texto
```

`preenchido: n/22` é o que o gate mede: contar as secções sem `[?]` e escrever esse número.

## 8. Parar — o pedido de validação

O comando **pára aqui**, como o `/canvas` pára na análise de domínio. Entrega, em texto:

1. O caminho do rascunho e `preenchido: n/22`.
2. A lista das secções `[?]` com **o que falta medir** em cada uma — e o que exige correr código.
3. As afirmações que precisam dos olhos de quem gere: fronteiras de confiança (quem assina a identidade, o que
   é público por desenho), cada «não há X», a proposta de arquitectura.
4. As chaves propostas para `instancia/stack.env`, prontas a colar, marcadas como proposta.
5. O passo seguinte, que **não** é deste comando: validado o rascunho, a instância aponta `FORGE_PERFIL`,
   `python3 scripts/rules-sync.py` gera as regras por caminho de §17, e `scripts/instancia-verify.sh` = 0.

## Nunca

Escrever em `perfis/` do método · apontar `FORGE_PERFIL` · inventar âncora ou linha · copiar exemplo de outra
stack · subir `preenchido` por prosa · decidir `FORGE_ARQUITETURA` · correr a suíte, migrar ou subir serviços ·
continuar depois do pedido de validação sem resposta.
