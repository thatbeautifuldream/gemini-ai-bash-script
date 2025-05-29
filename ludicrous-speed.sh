#!/usr/bin/env bash

# Copyright 2025 by Milind Mishra 'thatbeautifuldream' in Github
# Modifications by Miguel Pérez Colino 'mmmmmmpc' in GitHub
# Published under GNU GPLv3 License
# 
# It requires the tools "curl" and "jq" to function as well as
# Internet access and a Google Gemini API Key to access it

function ai() {
    # Choose your desired model:
    MODEL_NAME="gemini-1.5-flash-latest"
    #MODEL_NAME="gemini-1.5-pro-latest" # Or use this for the more capable model

    jq -n \
        --arg content "$*" \
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
        }' | curl --silent \
        --header 'Content-Type: application/json' \
        --data @- \
        --request POST \
        "https://generativelanguage.googleapis.com/v1beta/models/${MODEL_NAME}:generateContent?key=$GEMINI_API_KEY" |
        jq -c -r '.candidates[0].content.parts[0].text' |
        while read -r line; do
            echo "$line"
        done
}

ai "$@"
