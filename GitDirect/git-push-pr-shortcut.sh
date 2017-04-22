#aliases
alias gitac='python /Users/adi/Documents/projects/sexy-snippets/git-add-commit/git_add_commit.py'
alias gpo='git push origin'
alias gco='git checkout'
alias gitss='git status'

#pull request shortcuts
function pr {
    currentBranch=$(git branch | grep '^*' | sed 's/* //');
    repoPath=$(currentRepoPath);
    if [ -z $1 ]
    then
        echo "Raising PR on development branch";
        open https://github.com/$repoPath/compare/development...$currentBranch\?expand\=1;
    else
        echo "Raising PR on $1 branch";
        open https://github.com/$repoPath/compare/$1...$currentBranch\?expand\=1;
    fi
}

function currentRepoPath {
    local remotePath=$(git config --get remote.origin.url);
    local startIndex=0;
    if [[ $remotePath == git* ]]
    then
        startIndex=16;
    else
        startIndex=20;
    fi
    echo $remotePath | cut -c$startIndex- | rev | cut -c5- | rev;
}

function pushpr {
    currentBranch=$(git branch | grep '^*' | sed 's/* //');
    repoPath=$(currentRepoPath);
    git push origin $currentBranch;
    pr $1;
}
