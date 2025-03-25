#!/bin/bash

dotfiles_dir="$PWD/dotfiles"
codium_extensions="$dotfiles_dir/codium/extensions.txt"
gnome_extensions="$dotfiles_dir/gnome/extensions.txt"



install_vscodium_extensions() {
    if [ -f "$codium_extensions" ]; then
	echo "⏳ Install VSCodium Extensions..."
        xargs -n1 codium --install-extension < "$codium_extensions"
    else
        echo "VSCodium extension file not found! 🥲"
    fi
}



install_gnome_extensions() {
    if [ -f "$gnome_extensions" ]; then
	echo "⏳ Installing Gnome Extensions..."

	GN_CMD_OUTPUT=$(gnome-shell --version)
        GN_SHELL=${GN_CMD_OUTPUT:12:2}
        content=$(cat "$gnome_extensions")

        for ext in  $content; do
            VERSION_LIST_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=${ext}" | jq '.extensions[] | select(.uuid=="'"${ext}"'")')
            VERSION_TAG="$(echo "$VERSION_LIST_TAG" | jq '.shell_version_map |."'"${GN_SHELL}"'" | ."pk"')"
            wget -O "${ext}".zip "https://extensions.gnome.org/download-extension/${ext}.shell-extension.zip?version_tag=$VERSION_TAG"
            gnome-extensions install --force "${ext}".zip
            rm ${ext}.zip
	done
    else
        echo "Gnome extensions file not found! 🥲"
    fi
}



install_vscodium_extensions
install_gnome_extensions


echo "🎉 Settings applied successfully!🎉"
