# Path to your oh-my-zsh installation.
export ZSH=/Users/rwu1997/.oh-my-zsh

ZSH_THEME="robbyrussell"

# User configuration

export PATH="/Users/rwu1997/.gem/ruby/2.2.3/bin:/usr/local/Cellar/shopify-ruby/2.2.3-shopify_2/lib/ruby/gems/2.2.0/bin:/opt/rubies/2.2.3p172-shopify/bin:/Users/rwu1997/.nvm/versions/node/v5.7.0/bin:/Users/rwu1997/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

#sublime text alias quick command
sublime() {
	open $1 -a "Sublime Text"
}
alias sub=sublime

colhex() {
	python ~/Desktop/Programming/python-script-tools/rgb_to_hex.py $1 $2 $3
}

#converts decimal to hex
alias rgbhex=colhex

alias rm="rm -iv"
alias mv="mv -iv"
alias cp="cp -iv"

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

alias gitamend="git commit -a --amend --no-edit; git push --force"
alias gitco="git checkout"
