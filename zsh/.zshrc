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
