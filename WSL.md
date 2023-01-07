## Install WSL

From https://learn.microsoft.com/en-us/windows/wsl/install:

1. Run `wsl --install` in Command Prompt
2. Restart computer
3. Open "Windows Subsystem for Linux"
4. Configure username + password

## Windows Terminal

1. Install [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=en-ca&gl=ca&rtc=1)
2. Settings > > Startup Default: Profile = Ubuntu, Default Terminal = Windows Terminal
3. Settings > Interaction: Automatically copy selection to clipboard

## Enable systemctl

From https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/, add the following to `/etc/wsl.conf`:
```
[boot]
systemd=true
```

Then restart wsl in Command prompt `wsl.exe --shutdown`.

## Dotfiles

Follow README from [`richardwu/dotfiles`](https://github.com/richardwu/dotfiles)

## Mounting secondary drive to WSL

From [this tutorial](https://learn.microsoft.com/en-us/windows/wsl/wsl2-mount-disk#mounting-a-partitioned-disk):

1. Run `GET-CimInstance -query "SELECT * from Win32_DiskDrive"` in Command Prompt
2. Get `\\.\PHYSICALDRIVE*` name for target drive
3. Run `wsl --mount \\.\PHYSICALDRIVEX --bare` in Command Prompt
4. In Windows Terminal w/ WSL:
   - `lsblk` to show all devices (a new one should have been added)
   - `mkdir /mnt/<NAME>` then `mount -o defaults /dev/<sdXXY> /mnt/<NAME>` to access it from within WSL

