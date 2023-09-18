#! /bin/bash


sudo pacman -S --needed git base-devel btop xorg-server xorg-apps flatpak firefox htop



git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si



yay -S sddm-git plasma-desktop plasma-wayland-session alacritty \ #DE
    uwufetch pipes.sh \ #cosmetcs
    discord-screenaudio spotify \ #leasure
    brave-bin kdenlive-git wine-stable appimagelauncher \ #utilities
    nano visual-studio-code-bin \ #editors


flatpak install TuxPusher Steam osu! bottles "OBS Studio" Grapejuice



curl -sS https://starship.rs/install.sh | sh



if ! [ -e ~/.bashrc ]; then
    touch ~/.bashrc
fi



echo "eval \"\$(starship init bash)\"" >> ~/.bashrc



sudo systemctl enable sddm.service



git clone https://github.com/pipeseroni/pipes.sh.git && cd pipes.sh
sudo make install
cd ~
if [ -e pipes.sh ]; then
    rm -rf pipes.sh
fi
