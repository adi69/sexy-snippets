# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
PLATFORM=$(uname)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jonathan"
plugins=(zsh-syntax-highlighting)

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

source $ZSH/oh-my-zsh.sh
source ~/.bash_profile

# Source aliases
alias define='python ~/Documents/Projects/ShellDictionary/ShellDictionary.py'
alias gitac='python /Users/apple/Documents/Projects/Snippets/git-add-commit/git_add_commit.py'
alias proj='/Users/apple/Documents/Projects'
alias gitpom='git push origin master'
alias myinstance='ssh -p 1811 aditya.bhardwaj@54.169.13.123'
alias py='python'
alias google='python ~/Documents/Projects/Snippets/open_google/googler.py'
alias gitss='git status'
alias notes='~/Documents/Projects/Snippets/notes'
alias down='~/Downloads'
alias doc='~/Documents'
alias imdb='python /Users/apple/Documents/Projects/experiments/Popcorn/main.py'
alias lstype='python /Users/apple/Documents/Projects/snippets/ls-group-by-type/lstype.py'

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
eval "$(thefuck --alias)"
