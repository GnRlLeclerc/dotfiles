# Initialize symlinks to this repository

links:
	echo "Linking ZSH config"
	stow -t ~ zsh
	echo "Linking VSCode config"
	stow -t ~/.config/Code/User vscode
	echo "Linking general config"
	stow -t ~/.config .
	echo "Linking Firefox config"
	stow -t ~/.mozilla/firefox/$(shell ls ~/.mozilla/firefox | grep 'default-release') firefox

