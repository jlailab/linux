# Ubuntu Setup Script

This repository contains a single Ubuntu setup script that installs a set of useful tools and configures a better shell environment.

## What it does

The `setup_ubuntu.sh` script performs the following tasks:

- Updates and upgrades the system packages
- Installs basic utilities: `git`, `wget`, `curl`, `btop`, `tmux`, and `zsh`
- Installs Oh My Zsh
- Installs and configures Oh My Zsh plugins:
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`
  - `fast-syntax-highlighting`
  - `zsh-autocomplete`
- Sets Zsh as the default shell
- Installs Miniconda and adds it to `~/.bashrc`
- Installs Docker (Docker Engine, CLI, containerd, Buildx, Docker Compose plugin)
- Installs IBUS Unikey for Vietnamese input support

## Requirements

- Ubuntu-based Linux distribution
- User with `sudo` privileges
- Internet connection

## Usage

1. Open a terminal in this repository folder.
2. Make the script executable (if needed):

```bash
chmod +x setup_ubuntu.sh
```

3. Run the script:

```bash
./setup_ubuntu.sh
```

4. After the script finishes, restart your terminal or run:

```bash
source ~/.zshrc
```

and if you installed Miniconda also run:

```bash
source ~/.bashrc
```

## Notes

- The script uses `sudo` for package installation and system-level changes.
- It modifies `~/.zshrc` to add plugins and changes the default shell to Zsh.
- Docker installation adds the official Docker repository and requires a successful `sudo docker run hello-world` verification step.
- If you already have any of the tools installed, the script may still attempt to re-install or update them.

## Disclaimer

Use this script at your own risk. Review the script before executing it, especially if you already have a custom shell configuration or package setup.
