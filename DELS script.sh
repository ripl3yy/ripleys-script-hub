#!/bin/bash
#set -e

# Main menu
main_menu() {
    clear
    tput setaf 4
    echo "################################################"
    echo "#       DJ RKB's Easy Linux Script (DELS)      #"
    echo "################################################"
    tput sgr0
    echo
    echo "Select which to install first."
    echo
    echo "1. Install packages via apt"
    echo "2. Install packages via Flatpak"
    echo "3. Install WINE/Winetricks"
    echo "4. Install hyfetch via apt (requires setup, do this last)"
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
            sudo apt update
            sudo apt install steam mangohud
            echo "Packages installed successfully!"
            sleep 3
            ;;

      # Install via Flatpak
        2 )
            clear
            echo "Installing packages via Flatpak..."
            flatpak install flathub com.github.tchx84.Flatseal com.heroicgameslauncher.hgl net.davidotek.pupgui2 com.obsproject.Studio com.brave.Browser net.pcsx2.PCSX2 com.bambulab.BambuStudio
            echo "Flatpaks installed successfully!"
            sleep 3
            ;;

      # Install WINE/Winetricks
        3 )
            clear
            echo "Installing WINE/Winetricks..."
            sudo dpkg --add-architecture i386
            sleep 1
            sudo mkdir -pm755 /etc/apt/keyrings
            wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -
            sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources
            sleep 1
            sudo apt update
            sudo apt install --install-recommends winehq-stable winetricks
            sleep 2
            echo "WINE/Winetricks installed successfully!"

     # Install hyfetch
        4 )
            clear
            echo "Installing hyfetch via apt..."
            sudo apt install hyfetch
            echo "hyfetch installed successfully!"
            sleep 3
            ;;

        * )
            clear
            echo "Invalid option. Please try again."
            sleep 2
            ;;
    esac
done
