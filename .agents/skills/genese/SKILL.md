---
name: genese
description: Da IDEIA à primeira fatia verificável — recorte, decisões estruturais, critério de pronto, fatia zero
---

# /genese

Conduz um produto **de raiz**, quando não há código nenhum. O ciclo normal
(`metodo/01-ciclo-de-vida.md`) abre em «medir o que a aplicação É» e de raiz devolve `2`
correctamente — não há o que medir. Este percurso é o que vem antes.

**Doutrina:** `metodo/08-genese.md`. **Molde:** `templates/canvas-produto.md`.
**Gate:** `scripts/genese-verify.sh`.

## Uso

```
/genese                      # começa, ou continua de onde ficou
/genese <caminho/canvas.md>  # continua um canvas já começado
```

## Passos

**G0 · Recorte.** Perguntar até haver: o problema na língua de quem o tem · o papel de quem o tem ·
**um** resultado único · o **escopo negativo com a razão de cada linha** · e como se sabe que falhou.
Copiar `templates/canvas-produto.md` para onde o trabalho vive, e preencher R.

> **Não decidir pelo dono.** Valor de produto nunca é veredito do método. Perguntar
> exaustivamente **antes** de propor (`metodo/07-pratica-agentica.md` §2.5) — é aqui que rende mais.
> Onde o dono não decidir, escrever `[?]` com o que falta decidir, e **parar**: um canvas com o
> escopo negativo vazio não passa o gate, e é assim de propósito.

**G1 · Decisões estruturais.** Arquitectura (`arquiteturas/README.md` §3) · stack (`perfis/`) ·
fronteiras ortogonais (**«nenhuma» é resposta válida**) · plataforma e ramos. **Cada uma com a
alternativa descartada e porquê** — é o que conta como prova antes de haver código. Escrever as duas
chaves em `instancia/stack.env`.

**G2 · Critério de pronto.** Os vinte pares entrada-saída, à mão, **antes da primeira linha**, e o
comando que os corre. Se não saírem vinte, dizê-lo: é sinal de que a tarefa ainda não está percebida.

**G3 · Fatia zero.** A mais fina que atravessa **todas** as camadas — com o teste que a prova e a
**autorização desde o início**. Não é a primeira funcionalidade: é a prova do desenho.

**G4 · A instância nasce.** `perfis/<stack>.md` a `0/22` com as âncoras que a fatia zero já permite ·
`fase-atual.yml` com o canvas como evidência · `nivel-confianca.md` a **1 ou 2**, nunca mais.

## Entrega

- o canvas preenchido, com `scripts/genese-verify.sh` = **0**;
- a fatia zero a correr, com o comando de teste a devolver `N > 0`;
- a instância declarada, com a dívida `[?]` **visível e contada**;
- e a frase que fecha: **a génese termina quando o ciclo normal pode começar** — há código medível,
  perfil com âncoras, e fase com evidência (`08-genese.md` §8).

## O que NUNCA faz

| Nunca | Porquê |
|---|---|
| decide o valor do produto | obriga a que a decisão exista e esteja escrita; não a toma |
| valida o mercado | nada aqui diz se a ideia é boa |
| dispensa uma regra | muda o **referente** da prova, não a exigência |
| começa a construir com o canvas por decidir | é o que o gate impede, e é o ponto |
