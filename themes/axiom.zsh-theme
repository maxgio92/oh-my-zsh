function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function battery {
    ~/.oh-my-zsh/bin/battery.sh
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo ''
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function hg_prompt_info {
    hg prompt --angle-brackets "\
    < on <branch>>\
    < at <tags|, >>\
    <status|modified|unknown><update><
    patches: <patches|join( → )>>" 2>/dev/null
}

local return_status="%{$fg[red]%}%(?..✘)%{$reset_color%}"

setopt promptsubst
PROMPT='%{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}$(hg_prompt_info) $(git_prompt_info) $(virtualenv_info)'
RPROMPT='$(battery)'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

