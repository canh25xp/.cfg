# pwsh-like aliases
alias cls=clear
alias where=which
# Shorten aliases, convenient aliases
alias lgit=lazygit
alias what='type -a'
alias wtf='type -a'
alias nmutt=neomutt
alias mail=neomutt
alias la='ls -A' # Include hidden files
alias ll='ls -AlF'
alias path='echo -e ${PATH//:/\\n}' # Print path in newline each
alias cz=chezmoi
alias man=batman
alias cht=cht.sh

# dotfiles manage
alias cfg='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Neovim profiles
alias lvim="NVIM_APPNAME=nvim-lazy nvim"
alias kvim="NVIM_APPNAME=nvim-kickstart nvim"

# Open Nvim and enter Neotree
ntree() {
	nvim -c "Neotree position=current"
}

# cd on exit
cdx() {
	# `command` is needed in case `lfcd` is aliased to `lf`
	cd "$(command lf -print-last-dir "$@")"
}

# bat help
alias bathelp='bat --plain --language=help'
help() {
	"$@" --help 2>&1 | bathelp
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# Useless in WSL
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	if [ -x "$(command -v eza)" ]; then
		alias ls='eza --icons -1 --hyperlink --time-style relative'
	else
		alias ls='ls --color=auto -1'
	fi
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi
