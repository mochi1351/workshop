# Mochivani Installation Guide

## Introduction
This guide provides step-by-step instructions for installing various packages using a Bash script. The script automates the installation process for the following packages:

- Docker
- Docker Compose
- Git
- Wget
- Zsh
- Node.js and npm
- Python 3 and pip
- Visual Studio Code
- Terraform
- Ansible
- Tmux

## Prerequisites
- A Linux-based operating system
- Root privileges or sudo access

## Usage
To use the script, follow these steps:

1. Download the script: [bash_script_install.sh](link_to_script_file)
2. Make the script executable: `chmod +x mochivani.sh`
3. Run the script with the desired options: `./mochivani.sh [options]`

## Options
The script supports the following command-line options:

- `-h, --help`: Displays the help message and available options.
- `-a, --all`: Installs all dependencies.
- `-d, --docker`: Installs Docker.
- `-c, --compose`: Installs Docker Compose.
- `-g, --git`: Installs Git.
- `-w, --wget`: Installs Wget.
- `-z, --zsh`: Installs Zsh.
- `-n, --nodejs`: Installs Node.js and npm.
- `-p, --python`: Installs Python 3 and pip.
- `-v, --vscode`: Installs Visual Studio Code.
- `-t, --terraform`: Installs Terraform.
- `-b, --ansible`: Installs Ansible.
- `-m, --tmux`: Installs Tmux.

## Examples
1. Install Docker:
   ```bash
   ./mochivani.sh --docker

2. Install all dependencies:
   ```bash
   ./mochivani.sh --all



