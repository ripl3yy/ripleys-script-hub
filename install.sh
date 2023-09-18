#! /bin/bash
timedatectl


mkfs.ext4 /dev/nvme0p3
mkswap /dev/nvme0p2
mkfs.fat -F 32 /dev/nvme0p1


mount /dev/nvme0p3 /mnt
mount --mkdir /dev/nvme0p1 /mnt/boot/efi
swapon /dev/nvme0p2


pacstrap -K /mnt base linux linux-firmware base-devel grub efibootmgr


genfstab -U /mnt >> /mnt/etc/fstab


###

arch-chroom /mnt


ln -sf /usr/share/zoneinfo/Region/City /etc/localtime/America/Chicago /etc/localtime


hwclock --systohc


echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf


echo "archie" > /etc/hostname


mkinitcpi -P


useradd -G wheel,video,audio -m ripley


grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg


sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

### left to do:
#       passwd
