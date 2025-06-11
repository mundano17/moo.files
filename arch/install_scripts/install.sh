#post mounting
pacstrap -K /mnt base linux linux-firmware
genfstab -U /mnt >>/mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc
echo "LANG=en_US.UTF-8" >/etc/locale.conf
locale-gen
echo epictimus | /etc/hostname
mkinitcpio -P
passwd
bootctl install

# de shit
echo installing basic stuff for networking/desktop_environment/etc
pacman -S networkmanager

#setting up a new user
