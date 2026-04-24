# ----------------------------------------------------------------------------- Update & upgrade system
echo "=== Update & upgrade system ==="
sudo apt update && sudo apt upgrade -y

# ----------------------------------------------------------------------------- Install basic utilities
echo "=== Install basic utilities ==="
sudo apt install git wget curl btop tmux zsh -y 

# ----------------------------------------------------------------------------- Install Oh My ZSH
echo "=== Install Oh My ZSH ==="
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh

# ----------------------------------------------------------------------------- Install Oh My ZSH plugins
echo "Install Oh My ZSH plugins"
echo "=== Clone ZSH Autosuggestions ==="
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "=== Clone ZSH Syntax Highlighting ==="
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "=== Clone Fast Syntax Highlighting ==="
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
echo "=== Clone ZSH Autocomplete ==="
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
echo "=== Configuring .zshrc with plugins...==="
# Change .zshrc file
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)/' ~/.zshrc
# switch to zsh as default shell
echo "Changing default shell to ZSH..."
chsh -s $(which zsh)
echo "Installation completed! Please restart your terminal or run 'source ~/.zshrc' to apply changes."

# ----------------------------------------------------------------------------- Install Miniconda
echo "=== Install Miniconda ==="
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda
rm Miniconda3-latest-Linux-x86_64.sh
echo "export PATH=\"$HOME/miniconda/bin:\$PATH\"" >> ~/.bashrc
echo "Miniconda installed successfully! Please restart your terminal or run 'source ~/.bashrc' to apply changes."

# ----------------------------------------------------------------------------- Install Docker
echo "=== Install Docker ==="
echo "Adding Docker's official GPG key..."
# Add Docker's official GPG key:
sudo apt update -y
sudo apt install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "Adding the Docker repository to Apt sources..."
# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
# Update the package index
sudo apt update -y
echo "=== Install the Docker packages ==="
# Install the docker packages:
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "Docker installed successfully!"
echo "Run 'sudo docker run hello-world' to verify the installation..."
sudo docker run hello-world

# ----------------------------------------------------------------------------- Install IBUS Unikey
echo "=== Install IBUS Unikey ==="
# Add the repository and install
sudo add-apt-repository ppa:ubuntu-vn/ppa
sudo apt-get update
sudo apt-get install ibus-unikey
# Restart IBus
ibus restart
# Configure System Settings:
#     Go to Settings > Keyboard (or Region & Language).
#     Under Input Sources, click Add Source....
#     Select Vietnamese and choose Vietnamese (Unikey).
