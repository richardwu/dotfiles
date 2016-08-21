# Path to your oh-my-zsh installation.
export ZSH=/Users/rwu1997/.oh-my-zsh
export P_HOME=$HOME/Desktop/Programming

ZSH_THEME="robbyrussell"

# User configuration

export PATH="/Users/rwu1997/.gem/ruby/2.2.3/bin:/usr/local/Cellar/shopify-ruby/2.2.3-shopify_2/lib/ruby/gems/2.2.0/bin:/opt/rubies/2.2.3p172-shopify/bin:/Users/rwu1997/.nvm/versions/node/v5.7.0/bin:/Users/rwu1997/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/rwu1997/anaconda2/bin:$PATH"

source $ZSH/oh-my-zsh.sh
alias zshrc="vim ~/.zshrc"

#sublime
alias sub="open $1 -a \"Sublime Text\""

#override file commands
alias rm="rm -iv"
alias mv="mv -iv"
alias cp="cp -iv"

#Shopify dev stuff
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
alias ffs="dev down && dev up && dev server"

#Git
alias gitamend="git commit -a --amend --no-edit; git push --force"

