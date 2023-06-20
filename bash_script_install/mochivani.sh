#!/bin/bash

set -euo pipefail

# Function to check if a package is already installed
check_dependency() {
    if dpkg-query -W -f='${Status}' "$1" 2>/dev/null | grep -q "installed"; then
        echo "$1 is already installed. Skipping..."
        return 0
    else
        return 1
    fi
}

# Function to display the help message
show_help() {
    cat <<EOF
██╗  ██╗ █████╗ ██████╗ ██╗     ██╗    ██╗██╗███╗   ██╗
██║ ██╔╝██╔══██╗██╔══██╗██║     ██║    ██║██║████╗  ██║
█████╔╝ ███████║██████╔╝██║     ██║ █╗ ██║██║██╔██╗ ██║
██╔═██╗ ██╔══██║██╔══██╗██║     ██║███╗██║██║██║╚██╗██║
██║  ██╗██║  ██║██║  ██║███████╗╚███╔███╔╝██║██║ ╚████║
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝

Developed by Mochivani

Usage: $0 [options]

Options:
  -h, --help          Display this help message
  -a, --all           Install all dependencies
  -d, --docker        Install Docker
  -c, --compose       Install Docker Compose
  -g, --git           Install Git
  -w, --wget          Install Wget
  -z, --zsh           Install Zsh
  -n, --nodejs        Install Node.js and npm
  -p, --python        Install Python 3 and pip
  -t, --terraform     Install Terraform
  -b, --ansible       Install Ansible
  -m, --tmux          Install Tmux
EOF
}

# Function to check root privileges
check_root_privileges() {
    if [[ $EUID -ne 0 ]]; then
        echo "This script must be run with root privileges."
        exit 1
    fi
}

# Function to update installed dependencies
update_dependencies() {
    sudo apt-get update
    sudo apt-get upgrade -y
}

# Function to install Docker
install_docker() {
    if check_dependency "docker.io"; then
        return
    fi

    sudo apt-get update
    sudo apt-get install -y docker.io

    echo "Docker version:"
    docker --version
}

# Function to install Docker Compose
install_docker_compose() {
    if check_dependency "docker-compose"; then
        return
    fi

    sudo apt-get update
    sudo apt-get install -y docker-compose

    echo "Docker Compose version:"
    docker-compose --version
}

# Function to install Git
install_git() {
    if check_dependency "git"; then
        return
    fi

    sudo apt-get update
    sudo apt-get install -y git

    echo "Git version:"
    git --version
}

# Function to install Wget
install_wget() {
    if check_dependency "wget"; then
        return
    fi

    sudo apt-get update
    sudo apt-get install -y wget

    echo "Wget version:"
    wget --version
}

# Function to install Zsh
install_zsh() {
    if check_dependency "zsh"; then
        return
    fi

    sudo apt-get update
    sudo apt-get install -y zsh

    chsh -s "$(command -v zsh)"

    echo "Zsh version:"
    zsh --version
}

# Function to install Node.js and npm
install_nodejs() {
    if check_dependency "nodejs"; then
        return
    fi

    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs

    echo "Node.js version:"
    node --version
    echo "npm version:"
    npm --version
}

# Function to install Python 3 and pip
install_python() {
    if check_dependency "python3"; then
        return
    fi

    sudo apt-get install -y python3 python3-pip

    echo "Python version:"
    python3 --version
    echo "pip version:"
    pip3 --version
}



# Function to install Terraform
install_terraform() {
    if check_dependency "terraform"; then
        return
    fi

    wget https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_linux_amd64.zip
    unzip terraform_1.0.4_linux_amd64.zip
    sudo install terraform /usr/local/bin/

    echo "Terraform version:"
    terraform --version
}

# Function to install Ansible
install_ansible() {
    if check_dependency "ansible"; then
        return
    fi

    sudo apt-get update
    sudo apt-get install -y ansible

    echo "Ansible version:"
    ansible --version
}

# Function to install Tmux
install_tmux() {
    if check_dependency "tmux"; then
        return
    fi

    sudo apt-get update
    sudo apt-get install -y tmux

    echo "Tmux version:"
    tmux -V
}

# Parse command line options
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -h|--help)
            show_help
            exit 0
            ;;
        -a|--all)
            check_root_privileges
            update_dependencies
            install_docker
            install_docker_compose
            install_git
            install_wget
            install_zsh
            install_nodejs
            install_python
            install_terraform
            install_ansible
            install_tmux
            exit
            ;;
        -d|--docker)
            check_root_privileges
            install_docker
            exit 0
            ;;
        -c|--compose)
            check_root_privileges
            install_docker_compose
            exit 0
            ;;
        -g|--git)
            check_root_privileges
            install_git
            exit 0
            ;;
        -w|--wget)
            check_root_privileges
            install_wget
            exit 0
            ;;
        -z|--zsh)
            check_root_privileges
            install_zsh
            exit 0
            ;;
        -n|--nodejs)
            check_root_privileges
            install_nodejs
            exit 0
            ;;
        -p|--python)
            check_root_privileges
            install_python
            exit 0
            ;;
        -v|--vscode)
            check_root_privileges
            install_vscode
            exit 0
            ;;
        -t|--terraform)
            check_root_privileges
            install_terraform
            exit 0
            ;;
        -b|--ansible)
            check_root_privileges
            install_ansible
            exit 0
            ;;
        -m|--tmux)
            check_root_privileges
            install_tmux
            exit 0
            ;;
        *)
            echo "Unknown option: $key"
            show_help
            exit 1
            ;;
    esac
    shift
done

# If no options are provided, display help
if [[ $# -eq 0 ]]; then
    show_help
    exit 0
fi

