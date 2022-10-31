########## archiso
# check net
ping google.com
ping baidu.com
timedatectl set-ntp true
timedatectl status
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
pacstrap /mnt base linux linux-firmware vim zsh dhcpcd git netctl wpa_supplicant dialog bc sdcv stardict catfish reflector  
genfstab -U /mnt >> /mnt/etc/fstab

########## chroot
arch-chroot /mnt

timedatectl set-ntp true
timedatectl set-timezone Asia/Shanghai
timedatectl status
#ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

# locale
sudo sed 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen | sudo tee -a temp && sudo mv temp /etc/locale.gen
locale-gen
# host
echo "archlinux" > /etc/hostname
#echo "127.0.0.1    localhost
#::1          localhost
#127.0.1.1    arch.localdomain    arch" | tee -a /etc/hosts

# user
passwd
useradd -m -g users -G wheel -s /bin/bash manjaro
passwd manjaro
#usermod -aG wheel,audio,video,optical,storage manjaro
#pacman -S sudo vim
visudo
# 取消注释：%wheel ALL=(ALL) ALL

# boot
pacman -S grub  os-prober
#mkdir /boot/EFI
#mount /dev/sda1 /boot/EFI
grub-install --target=i386_pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
os-prober
#设置网络
#pacman -S networkmanager
#systemctl enable NetworkManager
sudo wifi-menu
pacman -Syy archlinux-keyring alsa-utils pulseaudio-alsa 
#### 安装一些软件
pacman -S ranger bash-completion pcmanfm w3m moc firefox firefox-i118-zh-cn wget file-roller plocate cronie at 
#### 安装解码器
pacman -S mplayer gst-libav gst-plugins-bad gst-plugins-base gst-plugins-ugly
####安装输入法
sudo pacman -S fcitx fcitx-fonfigtool fcitx-gtk fcitx-qt fcitx-sougoupinyin
####安装字体
pacman -S wqy-microhei    wqy-microhei-lite    wqy-bitmapfont   wqy-zenhei    ttf-arphic-ukai    ttf-arphic-uming    adobe-source-han-sans-cn-fonts
#### 安装桌面环境等
pacman -S xorg xorg-twm xorg-xclock xterm xorg-xinit mesa gvfs gvfs-afc 
####安装xfce
pacman -S xfce4 xfce4-goodies slim slim-themes archlinux-themes-slim xdg-user-dirs 
echo "exec startxfce4" >> /etc/skel/.xinitrc 
cp /etc/skel/.xinitrc /home/manjaro/.xinitrc
chmod +x /home/manjaro/.xinitrc
systemctl enable slim.service



exit

########## archiso
umount -l /mnt
shutdown -h now
