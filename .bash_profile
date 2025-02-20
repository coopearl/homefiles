# Set up the system, user profile, and related variables.
# /etc/profile will be sourced by bash automatically
# Set up the home environment profile.
if [ -f ~/.profile ]; then source ~/.profile; fi

# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then source ~/.bashrc; fi
export PS1="\\[\\e[1;32m\\]\\u \\[\\e[1;34m\\]\\w \\[\\e[0m\\]λ "
