### Steps to install WSL

1. Verify WSL installation:
```powershell title="PowerShell"
wsl --list --online
```
> This command will list available Linux distributions that you can install

* Update the Linux kernel:
```powershell title="PowerShell"
wsl --update
```

* Set WSL 2 as Default Version
```powershell title="PowerShell"
wsl --set-default-version 2
```

* Install WSL distribution:
```powershell title="PowerShell"
wsl --install --distribution Ubuntu-22.04
```

!!! note
    Once the distribution is installed you'll be prompted to add a new user.

    The naming convention doesn't allow capital letters.

!!! warning

    An error will show if you don't follow this naming convention:

    **adduser**: Please enter a username matching the regular expression configured
    via the NAME_REGEX[_SYSTEM] configuration variable.  Use the `--force-badname'
    option to relax this check or reconfigure NAME_REGEX.

### Fork dotfiles repo

1. Fork this repo `mlasalmo/dotfiles-xps`.

    [Fork Repository :octicons-repo-16:](https://github.com/mlasalmo/dotfiles/fork){ .md-button }

* Clone `<GITHUB_USER>/dotfiles` repo in your personal space.
```sh
git clone https://github.com/<GITHUB_USER>/dotfiles ~/.dotfiles
```

* [Generate Github SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

* [Add generated SSH keys to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

* [Generate GPG key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

* [Add generated GPG key to your GitHub account](https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account)

* Install KeePassXC

!!! Note

    Note from KeePassXC [Download page](https://keepassxc.org/download/#windows)

    We have received some reports of silent crashing starting with 2.7.9.
    This is immediately fixed by reinstalling the MSVC Redistributable.

  Open a PowerShell terminal and run:

```powershell title="PowerShell"
winget install KeePassXCTeam.KeePassXC
winget install Microsoft.VCRedist.2015+.x64
```

* Save all the keys in KeePassXC

* Connect USB devices to WSL
> Optional, in case you have a Yubikey and want to add extra layer of security.

    [Microsoft Learn Documentation](https://learn.microsoft.com/en-us/windows/wsl/connect-usb)
