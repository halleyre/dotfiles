export EDITOR=hx

alias hgit='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias nrebuild='sudo nixos-rebuild --flake ~/.config/nixos#$(hostname)'

eval "$(starship init bash)"

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
. <(carapace _carapace)

eval "$(zoxide init bash)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

function _edit() {
	local tmp="$(mktemp -t "readline.XXXXXX")"
	echo $READLINE_LINE > $tmp
	$EDITOR $tmp
	READLINE_LINE=$(cat $tmp)
	READLINE_POINT=${#READLINE_LINE}
	rm -f -- "$tmp"
}
bind -x '"\C-x\C-x":_edit'
