#btrfs auto mounting and install perhaps (gonna take a whole lotta time in this one)




#post mounting
pacstrap -K /mnt base linux linux-firmware btrfs-progs intel-ucode vim sudo sof-firmware base-devel
genfstab -U /mnt >>/mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
echo "LANG=en_US.UTF-8" >/etc/locale.conf
locale-gen
read -p "Enter hostname: " hostname
echo "${hostname}" >/etc/hostname
mkinitcpio -P

#root password
echo "Setting root password"
passwd

#setting up sudo
echo "Setting up sudo"
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

#setting up a new user
read -p "Enter new username: " username
useradd -m -G wheel "${username}"
passwd "${username}"

#systemd boot
echo "Installing systemd-boot" 
bootctl install

# bare minimum neccessities
echo "enabling multilib"
sed -i '/^\[multilib\]/,/^$/s/^#//' /etc/pacman.conf
pacman -Syu

echo "installing network tools"
pacman -S networkmanager
systemctl enable NetworkManager

# TODO double check this
echo "Installing pipewire"
pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber
echo "Enabling pipewire services"
systemctl enable pipewire pipewire-pulse pipewire-pulse.socket
systemctl enable wireplumber

echo "installing fonts"
pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji 

echo "exiting chroot"
exit
umount -R /mnt
echo "Rebooting the system"
reboot
