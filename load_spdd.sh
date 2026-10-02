#!/bin/bash

# Este script copia os comandos (skills) e agentes do spdd-forge para o padrão Antigravity no diretório local do projeto

AGENTS_DIR=".agents"
SKILLS_DIR="$AGENTS_DIR/skills"
RULES_DIR="$AGENTS_DIR/rules"
SPDD_CLAUDE_DIR="spdd-forge/projetos/forge/claude"

mkdir -p "$SKILLS_DIR"
mkdir -p "$RULES_DIR"

echo "Migrando comandos (skills)..."
for cmd_file in "$SPDD_CLAUDE_DIR"/commands/*.md; do
    filename=$(basename -- "$cmd_file")
    skill_name="${filename%.*}"
    
    # Cria a pasta para a skill
    mkdir -p "$SKILLS_DIR/$skill_name"
    
    # Copia o conteúdo
    cat "$cmd_file" > "$SKILLS_DIR/$skill_name/SKILL.md"
    
    # Garante que tem 'name:' no frontmatter se não tiver
    if ! grep -q "^name:" "$SKILLS_DIR/$skill_name/SKILL.md"; then
        sed -i "0,/^---/!b;//a\name: $skill_name" "$SKILLS_DIR/$skill_name/SKILL.md"
    fi
    echo "  - Skill $skill_name convertida."
done

echo "Migrando agentes (regras de agente)..."
for agent_file in "$SPDD_CLAUDE_DIR"/agents/*.md; do
    filename=$(basename -- "$agent_file")
    cat "$agent_file" > "$RULES_DIR/$filename"
    echo "  - Agente $filename copiado como regra/perfil."
done

echo "Migração concluída! As skills e perfis do spdd-forge agora estão disponíveis no diretório $AGENTS_DIR para o Antigravity."
