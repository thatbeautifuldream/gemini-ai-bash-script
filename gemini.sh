#!/usr/bin/env bash

function ai() {
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
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$GOOGLE_API" |
        jq -c -r '.candidates[0].content.parts[0].text' |
        while read -r line; do
            echo "$line"
        done
}

ai "$@"