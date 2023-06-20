#!/bin/bash
set -euo pipefail

# Function to display the help information
show_help() {
    cat <<EOF
    ██╗   ██╗ ██████╗ ██╗   ██╗███╗   ██╗███████╗
    ██║   ██║██╔═══██╗██║   ██║████╗  ██║██╔════╝
    ██║   ██║██║   ██║██║   ██║██╔██╗ ██║███████╗
    ██║   ██║██║   ██║██║   ██║██║╚██╗██║╚════██║
    ╚██████╔╝╚██████╔╝╚██████╔╝██║ ╚████║███████║
     ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝

    Developed by Mochivani

    Usage: ./install_packages.sh [OPTION]

    Options:
      --help    Display this help information
      --extra   Install an additional package (provide package name as argument)
EOF
}

# Function to install packages
install_packages() {
    # List of packages to install
    local packages=(
        build-essential
        openssh-server
        git
        curl
        wget
        vim
        tmux
        htop
        nginx
        python3
        python3-pip
        fail2ban
        ufw
    )

    # Update package lists
    sudo apt update

    # Upgrade installed packages
    sudo apt upgrade -y

    # Remove existing mysql-server and postgresql packages
    sudo apt remove -y mysql-server postgresql

    # Install packages
    sudo apt install -y "${packages[@]}"

    # Print a completion message
    echo "Package installation completed!"
}

# Check if the script is called with the help option
if [[ "${1:-}" == "--help" ]]; then
    show_help
elif [[ "${1:-}" == "--extra" ]]; then
    if [[ -z "${2:-}" ]]; then
        echo "Error: No package name provided."
        exit 1
    fi
    package_name="${2}"
    sudo apt install -y "${package_name}"
    echo "Package '${package_name}' installed!"
else
    # Call the function to install packages
    install_packages
fi
