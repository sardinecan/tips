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
PS1+="\[${green}\]=> \[${reset}\]";

export PS1;

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias github='cd /Volumes/data/Github'
alias gdp='cd /Volumes/data/Github/gdp'
alias gdpsources='cd /volumes/data/Github/gdp/sources'
alias horel='cd /Volumes/data/Github/horel'
alias condorcet='cd /Volume/data/Github/condorcet'
alias durival='cd /Volume/data/Github/durival'
alias ..='cd ..'
alias ...='cd ../..'

#export PATH=$PATH:/usr/local/mysql/bin
export PATH="/usr/local/mysql/bin:$PATH"
export PATH=$PATH:/Volumes/data/Github/TEIC/Stylesheets/bin
