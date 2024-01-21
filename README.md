# GEMINI AI - BASH SCRIPT

## Description

This script is used to automate the process of getting back an AI result from Gemini to the given prompt.

## Usage

```bash
./gemini.sh "prompt"
```

## Script

```bash
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
```

## Setup

1. Create a new shell script in your root folder called `gemini.sh`
2. Copy the script above into the file
3. Run `chmod +x gemini.sh` to make the file executable
4. Run `./gemini.sh "prompt"` to get an AI result

## Author

- [**Milind Mishra**](https://x.com/milindstwt)
