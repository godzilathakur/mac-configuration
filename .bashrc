
export PROMPT_COMMAND="echo -n \[\$(date +%H:%M:%S)\]\ "
alias ctags='/usr/local/bin/ctags'
export HISTTIMEFORMAT="%d/%m/%y %T "
alias glog='git log --pretty=oneline --abbrev-commit'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias mmdc='~/./node_modules/.bin/mmdc'
