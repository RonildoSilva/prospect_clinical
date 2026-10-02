---
name: forge-sync
description: Sincroniza o arcabouço na MESMA leva — catálogo, matriz, agentes gerados, gates
---
# /forge-sync

Uma mudança que não chega ao documento **não existe** para quem o lê a seguir.

| Toquei em… | Corre |
|---|---|
| uma lente | `scripts/lentes-verify.sh` · `python3 scripts/agentes-sync.py` · `scripts/agentes-verify.sh` · catálogo `lentes/README.md` · matriz `metodo/02` §2 · router `metodo/04` §Passo 2 |
| um agente | **os blocos gerados não se editam** — `agentes-sync.py --check` = 0 |
| um comando | `metodo/comandos.md` (um índice que lista 10 quando existem 15 mente por omissão) |
| um perfil | `scripts/perfis-verify.sh` — `preenchido:` bate com a contagem de `[?]`? |
| um script | o `.test.sh` que o prova a discriminar, e `scripts/safeguards-cobertura.sh` |
| documentação | `scripts/docs-jardinagem.py` · `scripts/citacao-envelhecida.py` |
| qualquer documento do método | `scripts/vocabulario-verify.sh` · `scripts/arcabouco-verify.sh` |

**Lição aprendida fecha com script + gate + instrução no ponto de uso.** «Está escrito em X» não é
feito: perguntar, por cada lição, **qual script a impõe**.
