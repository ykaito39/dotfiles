autoload -U compinit promptinit
compinit				#補完機能
promptinit				#プロンプトカラー

alias ls='ls --color=auto'	#ls色付け
setopt autopushd            # cdの履歴表示、cd - で一つ前のディレクトリへ
setopt auto_cd              # ディレクトリ名のみでcd
export EDITOR=vim           # エディタはvim

# # Tab、矢印キーなどを使って補完候補を視覚的に選択できるようになる
zstyle ':completion:*' menu selecT


# 履歴
HISTFILE=~/.zsh_history # historyファイル
HISTFILESIZE=1000000
HISTSIZE=1000000 # ファイルサイズ
SAVEHIST=1000000 # saveする量
setopt hist_ignore_dups # 重複を記録しない
setopt hist_reduce_blanks # スペース排除
setopt share_history # 履歴ファイルを共有
setopt EXTENDED_HISTORY # zshの開始終了を記録

# history 操作
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# プロンプトを変更
PROMPT="%F{white}[${USER}@${HOST%%.*}%(!.#.$)](^о^)<%f${reset_color} "
RPROMPT="[%~]"
setopt transient_rprompt	#次コマンド実行でrpromptを消す
#function chpwd() { pwd }
# プロンプトに現在地を表示できるようになる
#prompt walters



# Ruby
export RSENSE_HOME=/usr/src/rsense-0.3

[[ -d ~/.rbenv  ]] && \
	  export PATH=${HOME}/.rbenv/bin:${PATH} && \
	    eval "$(rbenv init -)"

# startup command
xmodmap /home/ell/.Xmodmap
