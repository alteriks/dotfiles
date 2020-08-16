## How to install

```yaml
Universal: 
 sudo curl -fLo /bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && 
 sudo chmod a+x /bin/yadm &&
 yadm clone https://github.com/alteriks/dotfiles.git

Mac: 
 brew install yadm &&
 yadm clone https://github.com/alteriks/dotfiles.git

Arch (fresh install):
 pacman -Syu sudo git --noconfirm &&
 sudo curl -fLo /bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && 
 sudo chmod a+x /bin/yadm &&
 yadm clone https://github.com/alteriks/dotfiles.git

Arch (AUR with yay): 
 yay -Syu yadm-git &&
 yadm clone https://github.com/alteriks/dotfiles.git

Debian UNSTABLE/Ubuntu 20.04+: 
 sudo apt install yadm &&
 yadm clone https://github.com/alteriks/dotfiles.git
```
yadm submodule update --init --recursive

## Updates
This repository is regurlarly being updated. To update to the latest version of my dotfiles, run:
```bash
yadm pull
```

## Errors
### When cloning
If you encounter any error when cloning, run 
```bash
yadm stash
