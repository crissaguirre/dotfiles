# Dotfiles

Mis configuraciones personales para Linux.

## Programas configurados

- Zsh
- Tmux
- Waybar
- Nvim

## Restaurar en una máquina nueva

### 1. Clonar el repo

git clone --bare <https://github.com/crissaguirre/dotfiles.git> $HOME/.dotfiles

### 2. Agregar el alias

echo "alias dotfiles='/usr/bin/git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME'" >> ~/.zshrc
source ~/.zshrc

### 3. Aplicar los archivos

dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

### 4. Instalar plugins de tmux

Abrir tmux y presionar `prefix + I`

### 5. Secrets

Crear ~/.zshrc.secrets con las API keys personales

OPENROUTER_API_KEY
