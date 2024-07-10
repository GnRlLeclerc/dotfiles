# Dotfiles

![Managed by Stow](https://img.shields.io/badge/Managed%20by-Stow-red?style=flat-square)
![Arch Linux](https://img.shields.io/badge/OS-Arch%20Linux-blue?logo=arch-linux&style=flat-square)
![AUR](https://img.shields.io/badge/AUR-Packages-blue?logo=arch-linux&style=flat-square)

My dotfiles and current config.\
The commands are for Arch Linux.\
This repository is symlinked with [`stow`](https://www.gnu.org/software/stow/).

## Symlinks

Create the different symlinks with the following commands:

```bash
make links
```

## Fonts

Cool monospace fonts patched with the [nerd fonts](https://www.nerdfonts.com/) patcher and ligature support.

- FiraCode Nerd Font
- JetBrainsMono Nerd Font
- Cascadia Code NF

```bash
pacman -S \
    ttf-firacode-nerd \
    ttf-jetbrains-mono-nerd \
    ttf-cascadia-code-nerd
```

## CLI

Useful cli tools.

| Tool                                                                          | Description                    |
| ----------------------------------------------------------------------------- | ------------------------------ |
| [`asdf`](https://github.com/asdf-vm/asdf)                                     | Multi-language version manager |
| [`bat`](https://github.com/sharkdp/bat)                                       | Fancy cat & less               |
| [`delta`](https://github.com/dandavison/delta)                                | Fancy git diff viewer          |
| [`dotacat`](https://gitlab.scd31.com/stephen/dotacat)                         | Faster lolcat                  |
| [`dust`](https://github.com/bootandy/dust)                                    | Fancy du                       |
| [`eza`](https://github.com/eza-community/eza)                                 | Fancy ls                       |
| [`fastfetch`](https://github.com/fastfetch-cli/fastfetch)                     | Maintained & faster neofetch   |
| [`fd`](https://github.com/sharkdp/fd)                                         | Better find                    |
| [`fzf`](https://github.com/junegunn/fzf)                                      | Cli fuzzy finder               |
| [`helix`](https://helix-editor.com/)                                          | Terminal-based editor          |
| [`lazygit`](https://github.com/jesseduffield/lazygit)                         | Fancy Git TUI                  |
| [`lazydocker`](https://github.com/jesseduffield/lazydocker)                   | Fancy Docker TUI               |
| [`mamba`](https://mamba.readthedocs.io/en/latest/user_guide/mamba.html#mamba) | Faster conda                   |
| [`procs`](https://github.com/dalance/procs)                                   | Fancy ps                       |
| [`ripgrep`](https://github.com/BurntSushi/ripgrep)                            | Better grep                    |
| [`tldr`](https://github.com/tldr-pages/tldr)                                  | User friendly man pages        |
| [`zoxide`](https://github.com/ajeetdsouza/zoxide)                             | Cd with autojump               |

Install them with:

```bash
pacman -S \
    bat \
    dust \
    eza \
    fastfetch \
    fd \
    fzf \
    git-delta \
    helix \
    lazygit \
    procs \
    ripgrep \
    tldr \
    zoxide

paru dotacat lazydocker betterdiscord-installer flavours
```

- `asdf`: [see instructions](https://asdf-vm.com/guide/getting-started.html#_2-download-asdf)
- `mamba`: [see instructions](https://github.com/conda-forge/miniforge), then copy [these completions](https://github.com/conda-incubator/conda-zsh-completion) to `/usr/local/share/zsh`

### Setup

In order to use the system clipboard inside neovim on wezterm on Wayland, install `wl-clipboard`:

```bash
pacman -S wl-clipboard
```

Run wezterm using the following command:

```bash
env WAYLAND_DISPLAY=wayland-0 wezterm start --always-new-process
```

#### Latex Setup

Install the following packages:

```bash
pacman -S \
    zathura \
    zathura-pdf-poppler \
    texlive-basic \
    texlive-latex \
    texlive-latexrecommended \
    texlive-latexextra \
    texlive-fontsrecommended \
    texlive-mathscience \
    texlive-bibtexextra
```

Setup Neovim with synctex:

```bash
pip install neovim-remote
```

## GUI

Useful gui programs.

| Program                                                                         | Description                         |
| ------------------------------------------------------------------------------- | ----------------------------------- |
| [`Flatseal`](https://flathub.org/apps/com.github.tchx84.Flatseal)               | Manage flatpak permissions          |
| [`Jetbrains Toolbox`](https://www.jetbrains.com/toolbox-app/)                   | Manage Jetbrains IDEs               |
| [`Libre Office`](https://www.libreoffice.org/)                                  | Office suite                        |
| [`Obsidian`](https://obsidian.md/)                                              | Note-taking app                     |
| [`Video Downloader`](https://flathub.org/apps/com.github.unrud.VideoDownloader) | Simple video downloader for youtube |
