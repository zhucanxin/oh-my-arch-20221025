#### 进入arch-chroot /mnt 之后的安装
echo "#### 进入arch-chroot /mnt 之后的安装"
echo "#### timedatectl "
hwclock --systohc --utc
timedatectl set-ntp true
timedatectl set-timezone Asia/Shanghai
timedatectl status
#ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# locale
echo "###### locale"
sed -ei 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/;s/#zh_CN.GB18030 GB18030/zh_CN.GB18030 GB18030/;s/#zh_CN.GBK GBK/zh_CN.GBK GBK/;s/#zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/;s/#zh_CN GB2312/zh_CN GB2312/'  /etc/locale.gen
sed -ei 's/#en_US.UTF-8 UTF-8\|#zh_CN.GB18030 GB18030\|#zh_CN.GBK GBK\|#zh_CN.UTF-8 UTF-8\|#zh_CN GB2312/{s/#//}'  /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
# host
echo "##### hostname"
echo "archlinux" > /etc/hostname
#echo "127.0.0.1    localhost
#::1          localhost
#127.0.1.1    arch.localdomain    arch" | tee -a /etc/hosts

# user
echo "##### root passwd"
passwd
echo "##### useradd manjaro"
useradd -m -g users -G wheel -s /bin/bash manjaro
#usermod -aG wheel,audio,video,optical,storage manjaro
echo "##### passwd manjaro"
passwd manjaro
echo "##### sudoers\n取消注释%wheel ALL=(ALL) ALL"
pacman -S sudo vim
visudo
# 取消注释：%wheel ALL=(ALL) ALL

# boot
echo "##### grub "
pacman -S grub  os-prober
#mkdir /boot/EFI
#mount /dev/sda1 /boot/EFI
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub
#echo "##### 再次grub again"
#os-prober
#grub-mkconfig -o /boot/grub/grub.cfg
#设置网络
echo "##### 设置网络"
#pacman -S networkmanager
#systemctl enable NetworkManager
systemctl enable dhcpcd 
sudo wifi-menu
pacman -S alsa-utils pulseaudio-alsa 
echo -e "[archlinuxcn]\nServer = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf
pacman -Syy archlinuxcn-keyring
pacman -S yaourt
### 安装X桌面环境等
echo "#### 安装X桌面环境等"
pacman -S xorg xorg-twm xorg-xclock xterm xorg-xinit xorg-server xorg-server-common xorg-server-devel mesa gvfs gvfs-afc 
####安装xfce
echo "####安装xfce"
pacman -S xfce4 slim slim-themes archlinux-themes-slim xdg-user-dirs 
####  xinitrc 
echo "####  xinitrc"
echo "exec startxfce4" >> /home/manjaro/.xinitrc 
chmod +x /home/manjaro/.xinitrc
systemctl enable slim.service

echo "finish anzhung"
exit
########## archiso
#umount -l /mnt
#shutdown -h now
