########## archiso
# check net
echo "check net"
ping -c 3 baidu.com
echo "#####fdisk /dev/sda mount  "
#fdisk /dev/sda
# 分区: efi(550M), swap, ext4(剩余)，先分再改类型
# g(一次)
# n(三次) +550M +2G remain
# t(change type二次，第三个不用变) 分区1->类型1 分区2->类型19
# w

#mkfs.fat -F32 /dev/sda1
#mkswap /dev/sda2
#swapon /dev/sda2
mkfs.ext4 /dev/sda6
mount /dev/sda6 /mnt

echo "#####pacman -Syy archlinux-keyring"
pacman -Syy archlinux-keyring
pacman -Syy
echo "#####pacstrap base "
pacstrap /mnt base-devel base linux linux-firmware vim zsh dhcpcd git netctl wpa_supplicant dialog  reflector  
reflector --country China --save /etc/pacman.d/mirrorlist 
echo "#####genfstab -U /mnt > /mnt/etc/fstab"
genfstab -U /mnt > /mnt/etc/fstab
########## chroot
echo "#####chroot"
arch-chroot /mnt
######finish base install
