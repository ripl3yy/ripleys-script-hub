#!/bin/bash
#set -e
echo
echo "########################"
echo "    Checking for git    "
echo "########################"
      sleep 1
      sudo pacman -S --needed git
      sleep 1
echo "################################"
echo "  Done! Running the next step.  "
echo "################################"
      sleep 3
echo
tput setaf 3
echo "################################################"
echo "#       Ripley's Easy Arch Script (REAS)       #"
echo "################################################"
tput sgr0
echo
echo "Select which to install first."
echo
echo "1. Packages via pacman"
echo "2. Packages via Flatpak"
echo "3. Clone wallpapers"
echo "4. Install Starship prompt"
echo "5. Install yay."
echo "6. All of the above (primarily for fresh Arch installs)"
echo
echo "Type your selection. To exit, just close this window or press Ctrl + C."
echo

while :; do

read CHOICE

case $CHOICE in

    1 )
      echo
      echo "########################################"
      echo "     Installing packages via pacman     "
      echo "########################################"
            sleep .5
            sudo pacman -Syyu
            sleep 2
            sudo pacman -S --noconfirm discord flatpak-kcm discover packagekit-qt5 flatpak steam btop neofetch
            sleep 1
      echo "###########################################"
      echo "  Done! Make sure to restart your system!  "
      echo "###########################################"
            exit
        ;;

    2 )
      echo
      echo "#########################################"
      echo "     Installing packages via Flatpak     "
      echo "#########################################"
            sleep .5
            flatpak install flathub com.spotify.Client com.github.tchx84.Flatseal io.github.alainm23.planify md.obsidian.Obsidian com.heroicgameslauncher.hgl com.github.unrud.VideoDownloader org.vinegarhq.Vinegar net.davidotek.pupgui2
            sleep 1
      echo "###########################################"
      echo "  Done! Make sure to restart your system!  "
      echo "###########################################"
            exit
        ;;

    3 )
      echo
      echo "##########################################"
      echo "           Cloning Wallpapers             "
      echo "##########################################"
            sleep 1
            cd ~ && git clone https://github.com/ripl3yy/wallpapers
            sleep .5
            mv ~/wallpapers ~/Pictures
            sleep .5
            rm -rf ~/Pictures/wallpapers/README.md
      echo "############################################################"
      echo "   Done! Wallpapers can be found in your Pictures folder!   "
      echo "############################################################"
            exit

      ;;

          4 )
      echo
      echo "##########################################"
      echo "        Installing Starship Prompt        "
      echo "##########################################"
            sleep 1
            curl -sS https://starship.rs/install.sh | sh
            sleep 2
            if ! [ -e ~/.bashrc ]; then
                touch ~/.bashrc
            fi
            sleep 2
            echo "eval \"\$(starship init bash)\"" >> ~/.bashrc
            sleep 1
      echo "######################################"
      echo "   Done! Close terminal and reopen!   "
      echo "######################################"
            exit

      ;;

          5 )
      echo
      echo "######################"
      echo "    Installing yay    "
      echo "######################"
            sleep 1
            pacman -S --needed git base-devel
            cd ~ && git clone https://aur.archlinux.org/yay.git
            sleep 1
            cd yay
            makepkg -si
            sleep 1
      echo "######################################"
      echo "   Done! Close terminal and reopen!   "
      echo "######################################"
            exit

      ;;

          6 )
      echo
      echo "################################################################"
      echo "  Installing packages, getting wallpapers, setting up Starship  "
      echo "################################################################"
            sleep .5
            sudo pacman -Syyu
            sleep 2
            sudo pacman -S --noconfirm discord flatpak-kcm discover packagekit-qt5 flatpak steam btop neofetch
            sleep 1
            cd ~ && git clone https://github.com/ripl3yy/wallpapers
            sleep .5
            mv ~/wallpapers ~/Pictures
            sleep .5
            rm -rf ~/Pictures/wallpapers/README.md
            sleep 2
            curl -sS https://starship.rs/install.sh | sh
            sleep 2
            if ! [ -e ~/.bashrc ]; then
                touch ~/.bashrc
            fi
            sleep 2
            echo "eval \"\$(starship init bash)\"" >> ~/.bashrc
            sleep 1
            pacman -S --needed git base-devel
            cd ~ && git clone https://aur.archlinux.org/yay.git
            sleep 1
            cd yay
            makepkg -si
            sleep 1
            flatpak install flathub com.spotify.Client com.github.tchx84.Flatseal io.github.alainm23.planify md.obsidian.Obsidian com.heroicgameslauncher.hgl com.github.unrud.VideoDownloader org.vinegarhq.Vinegar net.davidotek.pupgui2
            sleep 1
      echo "#####################################################################"
      echo "  Done! Restart system and find wallpapers in your Pictures folder!  "
      echo "#####################################################################"
            exit
      ;;
esac
done
