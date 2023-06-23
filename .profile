# Fixes sudo -i. When sudoing .profile doesn't get sourced, so all
# environmental variables should be put to .zshenv which is loaded by zsh
source ~/.config/zsh/profile
