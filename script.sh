#!/bin/bash
#set -e

# Check for git once
clear
echo "Checking for git..."
sleep 1
sudo pacman -S --noconfirm --needed git
echo "Done!"
sleep 3

# Main menu
main_menu() {
    clear
    tput setaf 4
    echo "################################################"
    echo "#       Ripley's Easy Arch Script (REAS)       #"
    echo "################################################"
    tput sgr0
    echo
    echo "Select which to install first."
    echo
    echo "1. Essential packages via pacman"
    echo "2. Essential packages via Flatpak"
    echo "3. Clone wallpapers"
    echo "4. Install Starship prompt"
    echo "5. Install yay"
    echo "6. All of the above (primarily for fresh installs)"
    tput setaf 2
    echo "Type your selection. To exit, just close this window or press Ctrl + C."
    tput sgr0
    echo
}

while :; do
    clear
    main_menu

    echo "Please enter your choice:"
    read CHOICE

    case $CHOICE in

      # Install via pacman
        1 )
            clear
            echo "Installing packages via pacman..."
            sudo pacman -Syyu
            sleep 2
            sudo pacman -S --noconfirm discord flatpak-kcm discover packagekit-qt5 flatpak steam btop neofetch xdg-desktop-portal ffmpegthumbs
            echo "Packages installed successfully!"
            sleep 3
            ;;

      # Install via Flatpak
        2 )
            clear
            echo "Installing packages via Flatpak..."
            flatpak install flathub com.spotify.Client com.github.tchx84.Flatseal com.heroicgameslauncher.hgl com.github.unrud.VideoDownloader org.vinegarhq.Vinegar net.davidotek.pupgui2 io.mrarm.mcpelauncher com.obsproject.Studio
            sleep 1
            echo "Flatpaks installed successfully!"
            sleep 3
            ;;

      # Clone wallpapers
        3 )
            clear
            echo "Cloning wallpapers..."
            sleep 1
            cd ~ && git clone https://github.com/ripl3yy/wallpapers
            sleep 1
            mv ~/wallpapers ~/Pictures
            sleep .5
            rm -rf ~/Pictures/wallpapers/README.md
            echo "Wallpapers cloned! Check your pictures folder!"
            sleep 3
            ;;

      # Install Starship prompt
        4 )
            clear
            echo "Installing Starship prompt..."
            curl -sS https://starship.rs/install.sh | sh
            sleep 1
            if ! [ -e ~/.bashrc ]; then
                touch ~/.bashrc
            fi
            sleep 1
            echo 'eval "$(starship init bash)"' >> ~/.bashrc
            echo "Starship prompt installed! Restart terminal."
            sleep 3
            ;;

      # Install yay
        5 )
            clear
            echo "Installing yay..."
            pacman -S --needed git base-devel
            cd ~ && git clone https://aur.archlinux.org/yay.git
            sleep 1
            cd yay
            makepkg -si
            sleep 1
            echo "Done! Close terminal and reopen."
            sleep 3
            ;;

      # Install everything
        6 )
            clear
            echo "Installing via pacman & flatpak, getting wallpapers, setting up Starship..."
            sudo pacman -Syyu
            sudo pacman -S --noconfirm discord flatpak-kcm discover packagekit-qt5 flatpak steam btop neofetch xdg-desktop-portal-gtk ffmpegthumbs kdenlive
            sleep 1
            cd ~ && git clone https://github.com/ripl3yy/wallpapers
            mv ~/wallpapers ~/Pictures
            rm -rf ~/Pictures/wallpapers/README.md
            sleep 2
            curl -sS https://starship.rs/install.sh | sh
            sleep 0.5
            if ! [ -e ~/.bashrc ]; then
                touch ~/.bashrc
            fi
            sleep 1
            echo 'eval "$(starship init bash)"' >> ~/.bashrc
            sleep 1
            flatpak install flathub com.spotify.Client com.github.tchx84.Flatseal com.heroicgameslauncher.hgl com.github.unrud.VideoDownloader net.davidotek.pupgui2 io.mrarm.mcpelauncher com.obsproject.Studio
            echo "Done! Restart system and find wallpapers in your Pictures folder!"
            sleep 3
            ;;
        * )
            clear
            echo "Invalid option. Please try again."
            sleep 2
            ;;
    esac
done
