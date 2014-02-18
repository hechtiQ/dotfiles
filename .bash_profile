#backgroundcolor = #1c1c1c
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias gc="git commit -a"
alias ga="git add $@"
alias gpush="git push $@"
alias gpull="git pull $@"
alias yumi="sudo yum install -y $@"
alias yumup="sudo yum update -y"
alias service="sudo service $@"

function tcode(){
if (tmux has-session -t coding 2>/dev/null); then
	tmux attach -t coding
else
	tmux new -s coding
fi
}

vman() {
	if [ $# -eq 0 ]; then
		/usr/bin/man
	else
		if man -w $* >/dev/null 2>/dev/null
		then
			/usr/bin/man $* | col -b | vim -c 'set ft=man nomod' -
		else
			echo No man page for $*
		fi
	fi
}
alias man='vman'
