#!/bin/bash

# Function to install AMD drivers on Debian-based systems
install_amd_debian() {
    echo "Installing AMD drivers for Debian..."
    sudo apt update
    sudo apt install -y firmware-amd-graphics libgl1-mesa-dri libglx-mesa0 mesa-vulkan-drivers xserver-xorg-video-all
    echo "AMD drivers installed successfully! Please restart."
}

# Function to install AMD drivers on Arch
install_amd_arch() {
    echo "Installing AMD drivers on Arch..."
    sudo pacman -Syu
    sudo pacman -S --noconfirm lib32-mesa amdvlk lib32-amdvlk vulkan-icd-loader lib32-vulkan-icd-loader
    echo "AMD drivers installed successfully! Please restart"
}

# Function to install AMD drivers on OpenSUSE Tumbleweed
install_amd_opensuse() {
    echo "Installing AMD drivers for OpenSUSE Tumbleweed..."
    sudo zypper refresh
    sudo zypper install -y kernel-firmware-amdgpu xf86-video-amdgpu
    echo "AMD drivers installed successfully! Please restart."
}

# Function to install Nvidia drivers on Debian
install_nvidia_debian() {
    echo "Installing Nvidia drivers for Debian..."
    sudo apt update
    sudo apt install -y nvidia-driver firmware-misc-nonfree
    echo "Nvidia drivers installed successfully! Please restart."
}

# Function to install Nvidia drivers on Arch
install_nvidia_arch() {
    echo "Installing Nvidia drivers for Arch..."
    sudo pacman -Syu
    sudo pacman -S --noconfirm nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
    echo "Nvidia drivers installed successfully! Please restart."
}

# Function to install Nvidia drivers on OpenSUSE Tumbleweed
install_nvidia_opensuse() {
    echo "Installing Nvidia drivers for OpenSUSE Tumbleweed..."
    sudo zypper refresh
    sudo zypper install -y openSUSE-repos-Tumbleweed-NVIDIA
    echo "Nvidia drivers installed successfully! Please restart."
}

# Function to install Nvidia drivers on Fedora
install_nvidia_fedora() {
    echo "Installing Nvidia drivers for Fedora..."
    sudo dnf upgrade --refresh
    sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora39/x86_64/cuda-fedora39.repo
    sudo dnf install kernel-headers kernel-devel tar bzip2 make automake gcc gcc-c++ pciutils elfutils-libelf-devel libglvnd-opengl libglvnd-glx libglvnd-devel acpid pkgconfig dkms
    sudo dnf module install nvidia-driver:latest-dkms
    echo "Nvidia drivers installed successfully! Please restart."
}

# Main menu
echo "Select the type of graphics drivers to install:"
select driver in "AMD" "Nvidia" "Quit"; do
    case $driver in
        AMD)
            echo "Select your Linux distribution:"
            select distro in "Debian" "Arch" "OpenSUSE Tumbleweed" "Fedora" "Quit"; do
                case $distro in
                    "Debian")
                        install_amd_debian
                        break
                        ;;
                    "Arch")
                        install_amd_arch
                        break
                        ;;
                    "OpenSUSE Tumbleweed")
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
            select distro in "Debian" "Arch" "OpenSUSE Tumbleweed" "Fedora" "Quit"; do
                case $distro in
                    "Debian")
                        install_nvidia_debian
                        break
                        ;;
                    "Arch")
                        install_nvidia_arch
                        break
                        ;;
                    "OpenSUSE Tumbleweed")
                        install_nvidia_opensuse
                        break
                        ;;
                    "Fedora")
                        install_nvidia_fedora
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
