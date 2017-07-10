#Customize color
red=$(tput setaf 1);
orange=$(tput setaf 220);
blue=$(tput setaf 38);
green=$(tput setaf 71);
white=$(tput setaf 15);
bold=$(tput bold);
reset=$(tput sgr0);


parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[${bold}\]\n";
PS1+="\[${red}\]\u";
PS1+="\[${white}\] @ ";
PS1+="\[${blue}\]\h";
PS1+="\[${white}\] in ";
PS1+="\[${green}\]\W";
PS1+="\[${orange}\] \$(parse_git_branch)";
PS1+="\n";
PS1+="\[${green}\]➜ \[${reset}\]";

export PS1;

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias github='cd /Volumes/Data/github'
alias gdp='cd /Volumes/Data/github/gdp'
alias gdpsources='cd /Volumes/Data/github/gdp/sources'
alias horel='cd /Volumes/Data/github/horel'
alias durival='cd /Volumes/Data/github/durival'
alias tips='cd /Volumes/Data/github/tips'
alias bitbucket='cd /Volumes/Data/bitbucket'
alias lettrescondorcet='cd /Volumes/Data/bitbucket/lettresCondorcet'
alias plumitifscondorcet='cd /Volumes/Data/bitbucket/plumitifsCondorcet'
alias ..='cd ..'
alias ...='cd ../..'

#export PATH=$PATH:/usr/local/mysql/bin
export PATH="/usr/local/mysql/bin:$PATH"
export PATH=$PATH:/Volumes/Data/github/teic/stylesheets/bin
export PATH=$PATH:/Volumes/Data/basex/bin
export PATH=:$PATH:/Volumes/Data/github/tips/tools/scripts/bin
export PATH=$ANT_HOME/bin:$PATH
