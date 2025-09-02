export ZSH="$HOME/.oh-my-zsh"
DISABLE_AUTO_UPDATE=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  git
  npm
  zsh-syntax-highlighting
  docker
  fzf
)

source $ZSH/oh-my-zsh.sh

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
# MacPorts equivalent:
# export JAVA_HOME="/opt/local/Library/Java/JavaVirtualMachines/openjdk17/Contents/Home"

export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/sbin
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
# MacPorts equivalent:
# export PATH="/opt/local/lib/mysql8/bin:$PATH"
export PATH="/Users/renatoselenica/.git-fuzzy/bin:$PATH"
export PATH=$PATH:/usr/sbin:/usr/local/bin
# MacPorts equivalents (add to beginning of PATH):
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# aliases
alias lg=lazygit
alias ld=lazydocker
alias pip=pip3
move_to_trash() {
  mv "$@" ~/.Trash
}
alias rm='move_to_trash'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/renatoselenica/Projects/rounds/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/renatoselenica/Projects/rounds/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/renatoselenica/Projects/rounds/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/renatoselenica/Projects/rounds/google-cloud-sdk/completion.zsh.inc'; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Number of events stored in the zsh history file
export SAVEHIST=100000

# Do not find duplicate command when searching
setopt HIST_FIND_NO_DUPS

export EXPO_TARGET="iPhone 15"
eval "$(fnm env --use-on-cd --shell zsh)"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
# MacPorts equivalent:
# export PATH="/opt/local/lib/postgresql16/bin:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/renatoselenica/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# pnpm
export PNPM_HOME="/Users/renatoselenica/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="$HOME/.local/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/renatoselenica/.lmstudio/bin"
# End of LM Studio CLI section

