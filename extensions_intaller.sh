#!/bin/bash

dotfiles_dir="$PWD/dotfiles"
codium_extensions="$dotfiles_dir/codium/extensions.txt"
gnome_extensions="$dotfiles_dir/gnome/extensions.txt"

# VSCodium Extension
install_vscodium_extensions() {
    if [ -f "$codium_extensions" ]; then
        echo "Instalando extensões do VSCodium..."
        xargs -n1 codium --install-extension < "$codium_extensions"
    else
        echo "Arquivo de extensões do VSCodium não encontrado!"
    fi
}

# Install GNOME Extensions
install_gnome_extensions() {
    if [ -f "$gnome_extensions" ]; then
        echo "Installing GNOME Shell extensions..."
        xargs -n1 gnome-extensions install < "$gnome_extensions"
    else
        echo "GNOME extensions file not found! 🥲"
    fi
}

# Função para ativar extensões do GNOME Shell
activate_gnome_extensions() {
    if [ -f "$gnome_extensions" ]; then
        echo "Activate GNOME Extension ..."
        xargs -n1 gnome-extensions enable < "$gnome_extensions"
    fi
}

# Executar funções
install_vscodium_extensions
install_gnome_extensions
activate_gnome_extensions

echo "🎉 Settings applied successfully!🎉"