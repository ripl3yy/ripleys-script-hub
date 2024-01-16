#!/bin/bash
#set -e
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
echo "4. All of the above (primarily for fresh Arch installs)"
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
			sudo pacman -S --noconfirm xf86-video-amdgpu libvdpau-va-gl vulkan-swrast libva-vdpau-driver discord flatpak-kcm discover packagekit-qt5 flatpak steam btop
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
            flatpak install flathub com.spotify.Client com.github.tchx84.Flatseal io.github.alainm23.planify com.microsoft.Edge md.obsidian.Obsidian com.heroicgameslauncher.hgl
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
			cd ~
			sleep .5
			git clone https://github.com/ripl3yy/wallpapers
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
      echo "################################################################"
      echo "  Installing packages, getting wallpapers, setting up Starship  "
      echo "################################################################"
			sleep .5
			sudo pacman -S --noconfirm xf86-video-ati vulkan-radeon lib32-vulkan-radeon libvdpau-va-gl vulkan-swrast libva-vdpau-driver discord flatpak-kcm discover packagekit-qt5 flatpak steam btop
			sleep 1
			git clone https://github.com/ripl3yy/wallpapers
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
			flatpak install flathub com.spotify.Client com.github.tchx84.Flatseal io.github.alainm23.planify com.microsoft.Edge md.obsidian.Obsidian com.heroicgameslauncher.hgl
			sleep 1
      echo "#####################################################################"
      echo "  Done! Restart system and find wallpapers in your Pictures folder!  "
      echo "#####################################################################"
            exit
      ;;
esac
done
