---
name: canvas
description: Da unidade refinada ao REASONS Canvas — análise de domínio (pára para validação), Canvas auto-contido em draft com canvas-verify a 0, e o texto do pedido; também aplica prompt-update e sync
disable-model-invocation: true
---
# /canvas <id> [--analise | --gerar | --prompt-update "<o que mudou>" | --sync <ficheiros>]

Doutrina: `metodo/10-refinamento.md` §7 (análise) e `metodo/11-especificacao.md` (Canvas, estado,
closed loop). Molde: `templates/reasons-canvas.md`. Nunca abre o pedido — prepara o texto.

## `--analise` (omissão quando não existe análise para a unidade)

1. Extrair das critérios as entidades, regras implícitas e operações implícitas.
2. Varrer o código **por camada do perfil** (`perfis/<stack>.md` §2): modelos, contratos, casos de
   uso, adaptadores, pontos de entrada, testes — por `grep`/leitura, nunca por execução.
3. Escrever `templates/analise-dominio.md` preenchido: entidades (existe · nasce), código a
   reutilizar, riscos e dependências, direcção **com as alternativas rejeitadas**, ADR a seguir.
4. **Parar** e fazer as três perguntas. O Canvas não se gera no mesmo passo.

## `--gerar` (só com a análise validada)

1. Copiar o molde para `<pasta dos canvases>/<id>_<slug>.md` com **`status: draft`** — nunca outro.
2. R na língua do negócio, a partir da unidade; E-A-S-O-N-S específicos: ficheiros, classes, campos
   **reais**, ou declarados como novos. Critérios já feitos ficam **riscados com a âncora** (§7).
3. **N e S inline** — copiados de `normas/`, do perfil e de `lentes/security.md` para o que **esta**
   unidade toca; nunca «ver ficheiro». O escopo negativo escreve-se.
4. O — passos por camada do perfil, testáveis, com o comando de teste depois de cada grupo
   (`{{CMD_TESTE_FICHEIRO}}` · `{{CMD_TESTE_ESSENCIAL}}`); o último passo é a verificação manual
   contra a aplicação real (§11).
5. `scripts/canvas-verify.sh <ficheiro>` = 0. Depois, o texto do pedido (`templates/pr.md`) —
   **quem abre e quem mergeia é um humano**; o merge é o que torna o Canvas `approved`.

## `--prompt-update "<o que mudou>"` — requisito mudou (o Canvas muda PRIMEIRO)

1. Determinar o impacto por secção: critério novo → R (e O) · entidade/campo novo → R E S O ·
   abordagem → A S O · salvaguarda nova → S (e O) · escopo menor → R A O · escopo maior → tudo.
2. Actualizar incrementalmente, com a linha de changelog **de decisão**; N e S continuam inline.
3. Se estava `implemented` ⇒ **`approved`** e changelog «requisito mudou: status → approved».
   Mudança grande (entidade nova, abordagem nova) ⇒ recomendar Canvas novo em vez de remendo.
4. `scripts/canvas-verify.sh` = 0. Só depois se toca no código.

## `--sync <ficheiros>` — código mudou sem requisito novo (com parcimónia, no MESMO pedido)

Actualizar E, A, S e O para o que o código faz; **nunca R**; **não muda o estado**; linha de
changelog «sync: …». Divergência grande ⇒ não é sync, é `--prompt-update` e regenerar.

## Nunca

Gerar um Canvas fora de `draft` · saltar a validação da análise · pôr N ou S como referência ·
implementar (é outra sessão, e recusa Canvas que não esteja `approved`) · mudar o estado para
`approved` (só o merge o faz) · descrever um alvo decidido como infra-estrutura existente (§8).
