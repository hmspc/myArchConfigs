#!/bin/sh

sudo pacman -S git go vim curl zsh reflector rofi otf-fira-code otf-fira-sans otf-fire-mono ttf-dejavu chromium feh vlc flameshot kitty rxvt-unicode
[ $? -ne 0 ] && exit 1
cd /tmp
git clone https://aur.archlinux.org/yay.git
[ $? -ne 0 ] && exit 2
cd yay
makepkg -si
[ $? -ne 0 ] && exit 3

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
[ $? -ne 0 ] && exit 4

cp xinitrc ~/.xinitrc
cp -r i3 ~/.config
cp bashrc .bashrc
cp zshrc .zshrc
cp -r dracula/* ~/.oh-my-zsh/themes
cp Xresources ~/.Xresources
sudo reflector --verbose --country 'France' -l 10 -p https --sort rate --save /etc/pacman.d/mirrorlist

