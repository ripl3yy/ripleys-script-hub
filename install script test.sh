echo
tput setaf 3
echo "###############################################################################"
echo "#                      Ripley's Post-Install Arch Script                      #"
echo "###############################################################################"
tput sgr0
echo
echo "Select which to install first."
echo
echo "1.  Packages via pacman"
echo "2.  Packages via Flatpak"
echo "3.  Clone wallpapers"
echo
echo "Type your selection. To exit, just close this window."
echo

while :; do

read CHOICE

case $CHOICE in

    1 )
      echo
      echo "##########################################"
      echo "     Installing Programs via pacman     "
      echo "##########################################"
			sleep 3
			sudo pacman -S --noconfirm xf86-video-amdgpu libvdpau-va-gl vulkan-swrast libva-vdpau-driver discord flatpak-kcm discover packagekit-qt5 flatpak
			sleep 3
      echo "#######################################"
      echo "                 Done!                 "
      echo "#######################################"
            exit
        ;;

    2 )
      echo
      echo "##########################################"
      echo "    Installing Programs via Flatpak     "
      echo "##########################################"
            sleep 3
            flatpak install flathub com.spotify.Client com.github.tchx84.Flatseal io.github.alainm23.planify
            sleep 3
      echo "#######################################"
      echo "                 Done!                 "
      echo "#######################################"
            exit
        ;;

    4 )
      echo
      echo "##########################################"
      echo "           Cloning Wallpapers             "
      echo "##########################################"
			sleep 3
			git clone https://github.com/ripl3yy/arch-stuff
			sleep 3
      echo "#######################################"
      echo "                 Done!                 "
      echo "#######################################"
            exit

      ;;
esac
done
