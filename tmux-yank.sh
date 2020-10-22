# Resolve copy backend: pbcopy (OSX), reattach-to-user-namespace (OSX), xclip/xsel (Linux), or network service
# get data either form stdin or from file

is_app_installed() {
  type "$1" &>/dev/null
}

if is_app_installed clip.exe; then
  # WSL
  clip.exe
  exit;
fi

buf=$(cat "$@")
copy_backend=""
if is_app_installed reattach-to-user-namespace; then
  # tmux + macos
  copy_backend="reattach-to-user-namespace pbcopy"
elif is_app_installed pbcopy; then
  # macos
  copy_backend="pbcopy"
elif [ -n "${DISPLAY-}" ] && is_app_installed xsel; then
  copy_backend="xsel -i --clipboard"
elif [ -n "${DISPLAY-}" ] && is_app_installed xclip; then
  copy_backend="xclip -i -f -selection primary | xclip -i -selection clipboard"
elif [ -n "${DISPLAY-}" ] && is_app_installed xclipboard; then
  copy_backend="xclipboard -i -f -selection primary | xclipboard -i -selection clipboard"
fi


# If we set up remote copy-pasting, send it to port 19988
if [ "$(ss -n -4 state listening "( sport = 19988 )" | tail -n +2 | wc -l)" -eq 1 ]; then
  copy_backend="nc localhost 19988"
fi

# if copy backend is resolved, copy and exit
if [ -n "$copy_backend" ]; then
  printf "$buf" | eval "$copy_backend"
  exit;
fi
