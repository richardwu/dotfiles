which git > /dev/null
if [ $? -ne 0 ]; then
  echo 'Requires git. Exiting.'
  exit 1
fi

if [ $# -ne 2 ]; then
  echo 'Usage: ./config-git.sh <git name> <git email>'
  exit 2
fi

gitname="$1"
gitemail="$2"

# Set up git user info.
git config --global --unset-all user.name
git config --global user.name "$gitname"
git config --global user.email "$gitemail"

# Set up miscellaneous settings.
git config --global color.ui true
git config --global credential.helper osxtoolchain
git config --global push.default simple

# Set up aliases.
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.st status

# Global gitignore file.
git config --global core.excludesfile ~/.gitignore_global
