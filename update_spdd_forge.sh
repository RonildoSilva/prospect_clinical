#!/bin/bash

# Atualiza os arquivos no spdd-forge para serem nativamente compatíveis com Antigravity

SPDD_CLAUDE_DIR="spdd-forge/projetos/forge/claude"

echo "Atualizando comandos no spdd-forge para formato de Skills do AGY..."
for cmd_file in "$SPDD_CLAUDE_DIR"/commands/*.md; do
    filename=$(basename -- "$cmd_file")
    skill_name="${filename%.*}"
    
    # Adiciona 'name:' no frontmatter se não existir
    if ! grep -q "^name:" "$cmd_file"; then
        sed -i "0,/^---/!b;//a\name: $skill_name" "$cmd_file"
        echo "  - Adicionado 'name: $skill_name' em $filename"
    fi
done

echo "Atualizando agentes no spdd-forge para formato de Regras do AGY..."
for agent_file in "$SPDD_CLAUDE_DIR"/agents/*.md; do
    filename=$(basename -- "$agent_file")
    
    # Adiciona 'trigger: model_decision' no frontmatter se não existir
    if ! grep -q "^trigger:" "$agent_file"; then
        sed -i "0,/^---/!b;//a\trigger: model_decision" "$agent_file"
        echo "  - Adicionado 'trigger: model_decision' em $filename"
    fi
done

echo "Atualização do spdd-forge concluída."
