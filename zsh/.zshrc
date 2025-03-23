# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="spaceship"

# check if command starship is available
# echo "Didn't find StarShip installing starship";
# curl -sS https://starship.rs/install.sh | sh;

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/projects/dotfiles/zsh/oh-my-zsh/custom"
# ALL OF MY CUSTOM PLUGINS
export SPACESHIP_CONFIG="$ZSH_CUSTOM/themes/spaceship-custom.zsh"

# enable starship
eval "$(starship init zsh)"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-bat
)

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Alternative to plugins. Currently, not sure what would be efficient way to map the files from custom directory to ohmyzsh because on it's own I want it to be detached and be it's own repository for better versioning.

source $ZSH/oh-my-zsh.sh




if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

if [ -f ~/.zsh_profile ]; then
    source ~/.zsh_profile
fi

fpath=(~/.zsh/completion $fpath)

# NVM is node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


# FZF Configuration for macOS
# Makes fzf faster by excluding system directories and prettier with nice colors
# Use the 'fo' command to open files in vim if editable, otherwise in Finder
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use fd for better performance if available
if command -v fd > /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules --exclude Library --exclude System --exclude .Trash --exclude .cache --exclude .npm --exclude .vscode --exclude .DS_Store --exclude Applications'
else
  # Fallback to find with exclusions
  export FZF_DEFAULT_COMMAND='find . -type f -not -path "*/\.*" -not -path "*/node_modules/*" -not -path "*/Library/*" -not -path "*/System/*" -not -path "*/.Trash/*" -not -path "*/.cache/*" -not -path "*/.npm/*" -not -path "*/.vscode/*" -not -path "*/Applications/*"'
fi

# Visual configuration with nice colors (Dracula theme)
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --info=inline --prompt='❯ ' --pointer='❯' --marker='✓' --preview 'cat {} 2>/dev/null | head -500 || ls -la {}' --preview-window=right:60%:wrap --bind 'ctrl-/:toggle-preview' --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

# Function to open file with vim if text, otherwise with Finder
fzf-open() {
  local file
  file=$(fzf --query="$1" --select-1 --exit-0)
  if [[ -n "$file" ]]; then
    if [[ -f "$file" ]] && file --mime "$file" | grep -q "text\|empty\|json\|xml\|yaml\|csv\|markdown\|script"; then
      vim "$file"
    else
      open "$file"
    fi
  fi
}

# Create alias for easier use
alias fo='fzf-open'

# Configure key bindings for better experience
export FZF_ALT_C_OPTS="--preview 'ls -la {}'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind 'ctrl-/:toggle-preview'"
