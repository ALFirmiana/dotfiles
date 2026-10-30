# ---- 历史 ----
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY

# ---- 环境 ----
export EDITOR=nvim
export http_proxy=http://127.0.0.1:7890
export https_proxy=$http_proxy
export no_proxy=localhost,127.0.0.1,::1,opencode.ai,.opencode.ai

# ---- 补全 ----
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
autoload -Uz compinit && compinit -u

zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*' group-name ''

zstyle ':completion:*' list-colors 'di=1;34' 'ln=1;36' 'ex=1;32' 'or=1;31' \
                                    'so=1;35' 'pi=33' 'bd=1;33' 'cd=1;33'

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt COMPLETE_IN_WORD ALWAYS_TO_END

# ---- 别名 ----
alias vim=nvim
alias dsh=dsh-tui

# ---- 函数 ----
# yazi：退出后切到 yazi 里停留的目录
yy() {
  local tmp=$(mktemp -t yazi-cwd.XXXXXX)
  yazi "$@" --cwd-file="$tmp"
  local cwd=$(<"$tmp")
  [[ -n $cwd && $cwd != $PWD && -d $cwd ]] && builtin cd -- "$cwd"
  command rm -f -- "$tmp"
}

# ---- 提示符 ----
eval "$(starship init zsh)"

# ---- 插件 ----
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
