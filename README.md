# GEMINI AI - BASH SCRIPT

## Description

This script is used to automate the process of getting back an AI result from Gemini to the given prompt.

## Requirements
 * `bash`
 * `jq`
 * `curl`
 * A Google Gemini API Key
 * Internet connection :-D

## Setup

1. Copy the script `ludicrous-speed.sh` file to a folder in your path like `$HOME/.local/bin`
2. Run `chmod +x ludicrous-speed.sh` to make the file executable
3. Obtain a Google Gemini API Key
 * Go to Google AI Studio (you might need to log in with your Google account).
 * Look for an option like "Get API key" or "Create API key". This might be in a "Gemini API" tab or directly visible.
 * You may need to agree to the terms of service.
 * Choose to create an API key in a new project or use an existing one.
 * Once generated, copy your API key immediately and store it in a safe, private place. Treat it like a password!
4. Export your GEMINI_API_KEY Key either to the terminal session using `export GEMINI_API_KEY="your api key"` or add it at somewhere in your `.bashrc` file.
4. Run `./ludicrous-speed.sh "prompt"` to get an AI result


## Usage

```bash
./ludicrous-speed.sh "prompt"
```


## Author

- [**Milind Mishra**](https://x.com/milindstwt)
- [**Miguel Pérez Colino**](https://x.com/mmmmmmpc)
