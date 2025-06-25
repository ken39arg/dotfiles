#!/bin/zsh
export EDITOR=vim
export SVN_EDITOR=vim
export LANG=ja_JP.UTF-8
export SHELL=/bin/zsh

# 単語として認識したい文字
export WORDCHARS='*?-[]~¥!#%^(){}<>|`@#%^*()+:?'

# default mask
umask 002

# vi key bind
# bindkey -v
# emacs key bind
bindkey -e

# !! IOMPORTANT !!
autoload -U compinit
compinit -u

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zhistory

#################################################
# オプション設定
# わからないときは man zshoptions
# http://www.ayu.ics.keio.ac.jp/~mukai/translate/zshoptions.html
#################################################
# 補完時に文字列末尾へカーソル移動
setopt ALWAYS_TO_END
# コマンド名がディレクトリ時にcdする
setopt AUTO_CD
# あいまい補完時に候補表示
setopt AUTO_LIST
# cd時に自動的にpushdする
setopt AUTO_PUSHD
# サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt AUTO_RESUME
# BEEPを使わない
setopt NO_BEEP
# cshスタイルのヒストリ拡張を使う
setopt BANG_HIST
# リダイレクション時の自動削除/生成を抑制。
# 削除時は `>!'  または `>|'
# 作成時は `>>!' または `>>|'
setopt NO_CLOBBER
# カーソルの位置に補なうことで単語を完成させようとする。
setopt COMPLETE_IN_WORD
# 自動修正機能(候補を表示)
setopt CORRECT
# 全引数にスペルミス訂正を試みる
setopt CORRECT_ALL
# = のファイル名生成が利用される(`Filename Expansion' を参照のこと)。
setopt EQUALS
# `#' `~' `^' といった文字をファイル名生成のパターンの一部として扱う。
setopt EXTENDED_GLOB
# コマンドの開始時のタイムスタンプ(エポックからの秒数)と実行時間(秒単位)をヒストリに含める。
setopt EXTENDED_HISTORY
# Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_FLOW_CONTROL
# シェル関数やスクリプトの source 実行時に、 $0 を一時的にその関数／スクリプト名にセットする。
setopt FUNCTION_ARGZERO
# `.' で開始するファイル名にマッチさせるとき、先頭に明示的に `.' を指定する必要がなくなる
setopt GLOB_DOTS
# 同一コマンドヒストリの場合に、古いものを削除
setopt HIST_IGNORE_ALL_DUPS
# ヒストリ追加時に先頭余白削除
setopt HIST_IGNORE_SPACE
# ヒストリ追加時に余白削除
setopt HIST_REDUCE_BLANKS
# シェル終了時に起動中ジョブにHUPシグナルを送らない
setopt NO_HUP
# <C-d>でログアウトしない
setopt IGNORE_EOF
# 対話的なシェルでもコメントを有効にする
setopt INTERACTIVE_COMMENTS
# 曖昧な補完の時にビープ音を発しない
setopt NO_LIST_BEEP
# 補完リストなるべく少ない行数に
setopt LIST_PACKED
# 補完候補を種別表示(ls -F)
setopt LIST_TYPES
# ジョブリストがデフォルトでロングフォーマット
setopt LONG_LIST_JOBS
# = 以降も補完 (--prefix=/usr等)
setopt MAGIC_EQUAL_SUBST
# バックグラウンドジョブ状態の即時報告
setopt NOTIFY
# 数値ファイル名マッチ時は数値順にソート
setopt NUMERIC_GLOB_SORT
# 補完リストその他でもASCII(7ビット)以上の文字(8ビット)文字を表示 
# (マルチバイト文字補完)
setopt PRINT_EIGHT_BIT
# プロンプトで変数拡張、コマンド置換、計算拡張が実行
setopt PROMPT_SUBST
# 同ディレクトリの複数のコピーをpushしない。
setopt PUSHD_IGNORE_DUPS
# コマンド履歴ファイルを共有する
setopt SHARE_HISTORY
# zsh line editor を利用
setopt ZLE
##################################################
# オプション設定解除
##################################################
# 全てのバックグラウンドジョブを低優先度で実行
unsetopt BG_NICE

# completion color
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

# PROMPT
#################################################
# 色一覧
#################################################
# 00: なにもしない
# 01: 太字化
# 04: 下線
# 05: 点滅
# 07: 前背色反転
# 08: 表示しない
# 22: ノーマル化
# 24: 下線なし
# 25: 点滅なし
# 27: 前背色反転なし
# 30: 黒(前景色)
# 31: 赤(前景色)
# 32: 緑(前景色)
# 33: 茶(前景色)
# 34: 青(前景色)
# 35: マゼンタ(前景色)
# 36: シアン(前景色)
# 37: 白(前景色)
# 39: デフォルト(前景色)
# 40: 黒(背景色)
# 41: 赤(背景色)
# 42: 緑(背景色)
# 43: 茶(背景色)
# 44: 青(背景色)
# 45: マゼンタ(背景色)
# 46: シアン(背景色)
# 47: 白(背景色)
# 49: デフォルト(背景色)

#################################################
# プロンプト表示フォーマット
# http://zsh.sourceforge.net/Doc/Release/zsh_12.html#SEC40
#################################################
# %% %を表示
# %) )を表示
# %l 端末名省略形
# %M ホスト名(FQDN)
# %m ホスト名(サブドメイン)
# %n ユーザー名
# %y 端末名
# %# rootなら#、他は%を表示
# %? 直前に実行したコマンドの結果コード
# %d ワーキングディレクトリ %/ でも可
# %~ ホームディレクトリからのパス
# %h ヒストリ番号 %! でも可
# %a The observed action, i.e. "logged on" or "logged off".
# %S (%s) 反転モードの開始/終了 %S abc %s とするとabcが反転
# %U (%u) 下線モードの開始/終了 %U abc %u とするとabcに下線
# %B (%b) 強調モードの開始/終了 %B abc %b とするとabcを強調
# %t 時刻表示(12時間単位、午前/午後つき) %@ でも可
# %T 時刻表示(24時間表示)
# %* 時刻表示(24時間表示秒付き)
# %w 日表示(dd) 日本語だと 曜日 日
# %W 年月日表示(mm/dd/yy)
# %D 年月日表示(yy-mm-dd)

##
##  <- これエスケープ {C-v ESC}
##

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
PROMPT='%{[33m%}%B%n%#%{[m%}%b '
#RPROMPT='%{[33m%}%B[%60<..<%~]%{[m%}%b'
RPROMPT="%1(v|%F{green}%1v%f|)"'%{[33m%}%B[%60<..<%~]%{[m%}%b'
SPROMPT='%{[34m%} %BCurrenct> '¥''%r'¥'' [Yes, No, Abort, Edit]%{[m%}%b '

# autoload
#bindkey '^R' history-incremental-search-backward
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward


export SCREENDIR=${HOME}/.screen

###########################
## functions
###########################
# alc 検索
function alc() {
  if [ $# != 0 ]; then
    w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa" | less +37
  else
    w3m "http://www.alc.co.jp/" | less +37
  fi
}

export SCREENDIR=${HOME}/.screen

###########################
## alias
###########################
#
# Command
#
case `uname` in
Darwin*|FreeBSD*)
  alias ls='ls -aFGw'
  ;;
Linux*)
  alias ls='ls -aF --color'
  ;;
esac

alias ll='ls -l'
alias du='du -h'
alias df='df -h'

alias view='vim -R'
alias rm='rm -i'
alias gr="grep -rn --color --exclude='*.svn*' --exclude='*.swp' --exclude='*.o' --exclude='*.so' --exclude='.svn'"

alias diff='colordiff'

alias vimclean='find . -name "*.swp" | xargs rm && find . -name "*\~" | xargs rm'

alias gitc=`which git`
alias git='nocorrect git'

#
# my selection
#

function sgrep()
{
  grep -rn `echo $1 | nkf -s` $2 | nkf -w
}


#
# 環境別ファイルの読み込み
#
if [ -f ~/.zshrc.local ]; then
	source ~/.zshrc.local 
fi

if [[ -s $HOME/.rvm/scripts/rvm ]] then
  source $HOME/.rvm/scripts/rvm
fi

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export GOROOT=$(go env GOROOT)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(direnv hook zsh)"

ghq-jump() {
    local selected_dir=$(ghq list -p | fzf --height=20 --layout=reverse --border --black)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N ghq-jump
bindkey '^]' ghq-jump

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

