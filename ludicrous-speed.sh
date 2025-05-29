#!/usr/bin/env bash

# Copyright 2025 by Milind Mishra 'thatbeautifuldream' in Github
# Modifications by Miguel Pérez Colino 'mmmmmmpc' in GitHub
# Published under GNU GPLv3 License
# 
# It requires the tools "curl" and "jq" to function as well as
# Internet access and a Google Gemini API Key to access it

AVAILABLE_MODELS=(
    "gemini-1.5-flash-latest"
    "gemini-1.5-pro-latest"
    "gemini-2.0-flash-exp"
    "gemini-2.0-flash-lite-preview-02-05"
    "gemini-2.0-flash-lite-preview-02-05"
)
DEFAULT_MODEL="${AVAILABLE_MODELS[0]}"

function print_help() {
    echo "Usage: ai [--select-model] [--list-models] [prompt]"
    echo "  --list-models            Show all available Gemini models"
    echo "  --select-model           Select a model from the list"
    echo "  --help                   Show this help message"
    echo "  prompt                   The prompt to send to Gemini"
}

function list_models() {
    echo "Available models:"
    for model in "${AVAILABLE_MODELS[@]}"; do
        echo "  $model"
    done
}

function is_valid_model() {
    local check_model="$1"
    for model in "${AVAILABLE_MODELS[@]}"; do
        if [[ "$model" == "$check_model" ]]; then
            return 0
        fi
    done
    return 1
}


function ai() {
    local model_name="$DEFAULT_MODEL"
    local prompt_args=()
    local select_model=0

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --help)
                print_help
                return 0
                ;;
            --list-models)
                list_models
                return 0
                ;;
            --select-model)
                select_model=1
                shift
                ;;
            *)
                prompt_args+=("$1")
                shift
                ;;
        esac
    done

    if [[ $select_model -eq 1 ]]; then
        if command -v fzf >/dev/null 2>&1; then
            model_name=$(printf "%s\n" "${AVAILABLE_MODELS[@]}" | fzf --prompt="Select Gemini model: ")
            if [[ -z "$model_name" ]]; then
                echo "No model selected."
                return 1
            fi
        else
            echo "fzf not found. Falling back to basic selector."
            select m in "${AVAILABLE_MODELS[@]}"; do
                if [[ -n "$m" ]]; then
                    model_name="$m"
                    break
                else
                    echo "Invalid selection."
                fi
            done
        fi
    fi

    if [[ ${#prompt_args[@]} -eq 0 ]]; then
        if [[ $select_model -eq 1 ]]; then
            echo "Selected model: $model_name"
            return 0
        fi
        echo "Error: No prompt provided."
        print_help
        return 1
    fi

    jq -n \
        --arg content "${prompt_args[*]}" \
        '{
          "contents": [
            {
              "parts": [
                {
                  "text": $content
                }
              ]
            }
          ]
        }' | curl --silent --no-buffer \
        --header 'Content-Type: application/json' \
        --data @- \
        --request POST \
        "https://generativelanguage.googleapis.com/v1beta/models/${model_name}:streamGenerateContent?alt=sse&key=$GEMINI_API_KEY" |
        sed -u 's/^data: //' |
        jq -r 'select(.candidates) | .candidates[].content.parts[].text'
}

ai $@
