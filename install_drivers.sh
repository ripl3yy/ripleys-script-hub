#!/bin/bash

# Function to install AMD drivers on Debian-based systems
install_amd_debian() {
    echo "Installing AMD drivers on a Debian-based system..."
    sudo apt update
    sudo apt install -y firmware-amd-graphics libgl1-mesa-dri libglx-mesa0 mesa-vulkan-drivers xserver-xorg-video-all
    echo "AMD drivers installed successfully on Debian-based system."
}

# Function to install AMD drivers on Arch-based systems
install_amd_arch() {
    echo "Installing AMD drivers on an Arch-based system..."
    sudo pacman -Syu
    sudo pacman -S --noconfirm lib32-mesa amdvlk lib32-amdvlk vulkan-icd-loader lib32-vulkan-icd-loader
    echo "AMD drivers installed successfully on Arch-based system."
}

# Function to install AMD drivers on OpenSUSE Tumbleweed system
install_amd_opensuse() {
    echo "Installing AMD drivers for an OpenSUSE Tumbleweed system..."
    sudo zypper refresh
    sudo zypper install -y kernel-firmware-amdgpu xf86-video-amdgpu
    echo "AMD drivers installed successfully on OpenSUSE-based system."
}

# Function to install Nvidia drivers on Debian-based systems
install_nvidia_debian() {
    echo "Installing Nvidia drivers on a Debian-based system..."
    sudo apt update
    sudo apt install -y nvidia-driver firmware-misc-nonfree
    echo "Nvidia drivers installed successfully on Debian-based system."
}

# Function to install Nvidia drivers on Arch-based systems
install_nvidia_arch() {
    echo "Installing Nvidia drivers on an Arch-based system..."
    sudo pacman -Syu
    sudo pacman -S --noconfirm nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
    echo "Nvidia drivers installed successfully on Arch-based system."
}

# Function to install Nvidia drivers on OpenSUSE Tumbleweed systems
install_nvidia_opensuse() {
    echo "Installing Nvidia drivers for an OpenSUSE Tumbleweed system..."
    sudo zypper refresh
    sudo zypper install -y openSUSE-repos-Tumbleweed-NVIDIA
    echo "Nvidia drivers installed successfully on an OpenSUSE Tumbleweed system."
}

# Main menu
echo "Select the type of graphics drivers to install:"
select driver in "AMD" "Nvidia" "Quit"; do
    case $driver in
        AMD)
            echo "Select your Linux distribution:"
            select distro in "Debian-based" "Arch-based" "OpenSUSE-based" "Quit"; do
                case $distro in
                    "Debian-based")
                        install_amd_debian
                        break
                        ;;
                    "Arch-based")
                        install_amd_arch
                        break
                        ;;
                    "OpenSUSE-based")
                        install_amd_opensuse
                        break
                        ;;
                    Quit)
                        echo "Exiting..."
                        break 2
                        ;;
                    *)
                        echo "Invalid option. Please try again."
                        ;;
                esac
            done
            ;;
        Nvidia)
            echo "Select your Linux distribution:"
            select distro in "Debian-based" "Arch-based" "OpenSUSE-based" "Quit"; do
                case $distro in
                    "Debian-based")
                        install_nvidia_debian
                        break
                        ;;
                    "Arch-based")
                        install_nvidia_arch
                        break
                        ;;
                    "OpenSUSE Tumbleweed")
                        install_nvidia_opensuse
                        break
                        ;;
                    Quit)
                        echo "Exiting..."
                        break 2
                        ;;
                    *)
                        echo "Invalid option. Please try again."
                        ;;
                esac
            done
            ;;
        Quit)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done