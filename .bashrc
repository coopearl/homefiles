# Bash initialization for interactive non-login shells and
# for remote shells (info "(bash) Bash Startup Files").

# Export 'SHELL' to child processes.  Programs such as 'screen'
# honor it and otherwise use /bin/sh.
export SHELL

if [[ $- != *i* ]]
then
    # We are being invoked from a non-interactive shell.  If this
    # is an SSH session (as in "ssh host command"), source
    # /etc/profile so we get PATH and other essential variables.
    [[ -n "$SSH_CLIENT" ]] && source /etc/profile

    # Don't do anything else.
    return
fi

# Source the system-wide file.
[ -f /etc/bashrc ] && source /etc/bashrc

alias ls='ls -p --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

PS1='\u@\h \w${GUIX_ENVIRONMENT:+ [env]}\$ '
alias ff="fastfetch"
alias kb="bash ~/scripts/keyboardfix.sh"
