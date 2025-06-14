# GEMINI AI - BASH SCRIPT

## Description

This script is used to automate the process of getting back an AI result from Gemini to the given prompt.

## Requirements

- `bash`
- `jq`
- `curl`
- `fzf`
- A Google Gemini API Key
- Internet connection :-D

## Setup

1. Copy the script `ludicrous-speed.sh` file to a folder in your path like `$HOME/.local/bin`
2. Run `chmod +x ludicrous-speed.sh` to make the file executable
3. (Optional, recommended) Symlink the script to a global location for easy access:
   ```bash
   ln -s /full/path/to/ludicrous-speed.sh $HOME/.local/bin/ai
   # Or, for system-wide (requires sudo):
   sudo ln -s /full/path/to/ludicrous-speed.sh /usr/local/bin/ai
   ```
   Now you can use `ai` from anywhere in your terminal.
4. Obtain a Google Gemini API Key

- Go to Google AI Studio (you might need to log in with your Google account).
- Look for an option like "Get API key" or "Create API key". This might be in a "Gemini API" tab or directly visible.
- You may need to agree to the terms of service.
- Choose to create an API key in a new project or use an existing one.
- Once generated, copy your API key immediately and store it in a safe, private place. Treat it like a password!

5. Provide your GEMINI_API_KEY to the script in one of the following ways:

   - **Recommended:** Create a `.env` file in the same directory as the script with the following content:
     ```env
     GEMINI_API_KEY=your_actual_api_key_here
     ```
   - Or, export your GEMINI_API_KEY to the terminal session using `export GEMINI_API_KEY="your api key"`, or add it to your `.bashrc` or `.zshrc` file.

   > The script will automatically load the `.env` file if it exists. If the API key is not set, it will print an error and exit.

6. Run `ai prompt` or `./ludicrous-speed.sh prompt` to get an AI result

## Usage

### Basic prompt

```bash
ai "What is the best Google product?"
```

### List available models

```bash
ai --list-models
```

### Select a model interactively (requires fzf or will use basic selector)

```bash
ai --select-model "Explain quantum computing"
```

### Interesting Use Cases

#### Prepare for standup

```bash
ai "Help me prepare for standup by summarizing my work from yesterday based on these commits: $(git log --since='yesterday.midnight' --until='midnight' --all --no-merges --oneline --author='work_email_here')"
```


#### Generate Commit Message from Staged Files and PR Description

```bash
ai "Generate a concise and descriptive commit message based on the current staged changes and a suitable PR description. Here are the staged changes: $(git diff --cached)"
```

#### Review code before pushing

```bash
ai "Review the following code changes for potential issues, improvements, or best practices: $(git diff --cached)"
```

#### Detect issues in your system

```bash
ai "Which process is consuming more memory in $(ps -efa)"
```

```bash
ai "is there anything extrange in the permissions of these files $(ls -lrt /usr/bin/ /etc/)"
```

#### Summarize Log Files

```bash
ai "Summarize the key errors and warnings from this log file: $(cat /var/log/syslog)"
```

#### Generate Shell Scripts

```bash
ai "Write a bash script to backup my Documents folder to an external drive"
```

#### Explain Complex Commands

```bash
ai "Explain what this command does: find . -type f -exec grep -l 'TODO' {} +"
```

#### Optimize Shell Commands

```bash
ai "How can I make this command faster? rsync -avz /source/ /destination/"
```

#### Troubleshoot System Issues

```bash
ai "Why might my computer be running slowly based on this output? $(top -l 1)"
```

#### Refactor or Improve Scripts

```bash
ai "Refactor this bash script for better readability: $(cat myscript.sh)"
```

#### Security Audits

```bash
ai "Are there any security risks in these firewall rules? $(sudo iptables -L)"
```

#### Regex Help

```bash
ai "Write a regex to extract all email addresses from a text file"
```

#### Data Extraction

```bash
ai "Extract all unique IP addresses from this log: $(cat access.log)"
```

#### Code Review

```bash
ai "Review this shell script for best practices: $(cat deploy.sh)"
```

#### Translate Commands

```bash
ai "Translate this bash command to PowerShell: ls -la | grep 'Aug'"
```

#### Generate Documentation

```bash
ai "Generate documentation for this bash script: $(cat backup.sh)"
```

#### Find Large Files

```bash
ai "Which files in my home directory are taking up the most space? $(du -ah ~ | sort -rh | head -n 20)"
```

#### Explain System Output

```bash
ai "What does this output from dmesg mean? $(dmesg | tail -n 20)"
```

#### Automate Repetitive Tasks

```bash
ai "Write a bash script to rename all .txt files in a folder to have today's date as a prefix"
```

---

## Authors

- [**Milind Mishra**](https://x.com/milindstwt)
- [**Miguel Pérez Colino**](https://x.com/mmmmmmpc)
