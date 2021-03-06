# ~/.bash_profile

[ -f ~/.bashrc ] && source ~/.bashrc

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;

# Make nvim the default editor.
export EDITOR='nvim';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='500';
export HISTFILESIZE="${HISTSIZE}";

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

