# Resolve copy backend: pbcopy (OSX), reattach-to-user-namespace (OSX), xclip/xsel (Linux), or network service
# get data either form stdin or from file

buf=$(cat "$@")
copy_backend=""
if is_app_installed pbcopy; then
  copy_backend="pbcopy"
elif is_app_installed reattach-to-user-namespace; then
  copy_backend="reattach-to-user-namespace pbcopy"
elif [ -n "${DISPLAY-}" ] && is_app_installed xsel; then
  copy_backend="xsel -i --clipboard"
elif [ -n "${DISPLAY-}" ] && is_app_installed xclip; then
  copy_backend="xclip -i -f -selection primary | xclip -i -selection clipboard"
elif [ -n "${DISPLAY-}" ] && is_app_installed xclipboard; then
  copy_backend="xclipboard -i -f -selection primary | xclipboard -i -selection clipboard"
elif [ "$(ss -n -4 state listening "( sport = 19988 )" | tail -n +2 | wc -l)" -eq 1 ]; then
  copy_backend="nc localhost 19988"
fi
# if copy backend is resolved, copy and exit
if [ -n "$copy_backend" ]; then
  printf "$buf" | eval "$copy_backend"
  exit;
fi
