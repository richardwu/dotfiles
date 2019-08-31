which launchctl > /dev/null
if [ $? -eq 0 ]; then
  # setup pbcopy launchd service for MacOS
  echo "enabling pbcopy launchd service for remote copy-pasting"
  launchctl load local.pbcopy.plist
  launchctl start local.pbcopy
  crontab -l | { cat; echo "@reboot launchctl start local.pbcopy"; } | crontab -
else
  which systemctl > /dev/null
  if [ $? -ne 0 ]; then
    echo "requires systemd or launchd to configure remote copy-pasting"
    exit 1
  fi

  # setup xclip systemd service for Linux

  ln -s xclip.socket /etc/systemd/system/xclip.socket
  ln -s xclip@.service /etc/systemd/system/xclip@.service

  # enable xclip service on startup
  sudo systemctl enable xclip.socket
  # start xclip service for now
  sudo systemctl start xclip.socket
fi

