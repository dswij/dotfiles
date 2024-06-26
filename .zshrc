# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  vi-mode
)
# 
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

fpath+=~/.zfunc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

LFCD="/path/to/lfcd.sh"                                
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

# Exports
export GEM_PATH=$HOME/.local/share/gem/ruby/3.0.0/bin:$GEM_PATH
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin
export PATH=$PATH:$HOME/.local/share/WebDriverManager/bin
export PATH="/usr/local/opt/gnupg@2.2/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export GPG_TTY=$(tty)
export EDITOR='nvim'
export NVIMPATH=~/.config/nvim/init.vim
export FZF_TMUX_PTS='-d 40%'
export FZF_DEFAULT_OPTS="--bind f1:execute(less -f {}),ctrl-y:execute-silent(echo {} | pbcopy)+abort,ctrl-f:page-down,ctrl-b:page-up"
export FZF_DEFAULT_OPTS="--bind ctrl-f:page-down,ctrl-b:page-up"

alias git-branch="git symbolic-ref --short HEAD"
alias composer="php composer.phar"
alias ls="exa --icons --long --group-directories-first --tree -1 --sort extension"
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfg-status='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME status -uno'
alias cat="bat --paging=never"
alias stage1='rustc +stage1'
alias pym='python -m'
alias create-venv='pyenv exec python -m venv'
alias activate-venv='source ./venv/bin/activate'
alias irebase='git stash && git rebase -i && git stash pop'
alias with-dotenv="env \$(grep -v '^#' .env | xargs)"
alias docker-kill-all="docker ps --format='{{.ID}}' | xargs docker kill"
alias lg="lazygit"

if type gpgconf &> /dev/null; then
  unset SSH_AGENT_PID
  if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  fi
  gpgconf --launch gpg-agent
  if [ ! -S "$SSH_AUTH_SOCK" ]; then
    gpg-agent --daemon > /dev/null
  fi
fi

# Toggle ctrl-z instead of ctrl-z + fg
ctrlz () {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
    zle redisplay
  else
    zle push-input
  fi
}
zle -N ctrlz
bindkey '^Z' ctrlz

# Mac specific keybindings
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

docker() {
 if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
    /usr/local/bin/docker "$1" --platform linux/amd64 "${@:2}"
  else
     /usr/local/bin/docker "$@"
  fi
}

if type starship&> /dev/null; then eval "$(starship init zsh)"; fi
if type pyenv &> /dev/null; then eval "$(pyenv init -)"; fi
if type rbenv&> /dev/null; then eval "$(rbenv init -)"; fi
