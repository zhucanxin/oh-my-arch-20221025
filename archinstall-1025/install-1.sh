# boot
echo "#### boot"
sleep 2
pacman -S grub-bios  os-prober
#mkdir /boot/EFI
#mount /dev/sda1 /boot/EFI
#os-prober
#grub-install --target=i386-pc /dev/sda
#grub-mkconfig -o /boot/grub/grub.cfg
#mkinitcpio -p linux
#设置网络
#pacman -S networkmanager
#systemctl enable NetworkManager
#sudo wifi-menu
echo "install alsa"
sleep 2
#pacman -S alsa-utils pulseaudio-alsa 
#### 安装一些软件
pacman -S ranger bash-completion pcmanfm w3m moc firefox firefox-i18-zh-cn wget file-roller plocate cronie at 
#### 安装解码器
pacman -S mplayer gst-libav gst-plugins-bad gst-plugins-base gst-plugins-ugly
####安装输入法
pacman -S fcitx fcitx-configtool fcitx-gtk fcitx-qt fcitx-sougoupinyin
####安装字体
pacman -S wqy-microhei    wqy-microhei-lite    wqy-bitmapfont   wqy-zenhei    ttf-arphic-ukai    ttf-arphic-uming    adobe-source-han-sans-cn-fonts
#### 安装桌面环境等
pacman -S xorg xorg-twm xorg-xclock xterm xorg-xinit mesa gvfs gvfs-afc 
####安装xfce
pacman -S xfce4  slim slim-themes archlinux-themes-slim xdg-user-dirs 
echo "exec startxfce4" >> /etc/skel/.xinitrc 
cp /etc/skel/.xinitrc /home/manjaro/.xinitrc
chmod +x /home/manjaro/.xinitrc
systemctl enable slim.service

sleep 5

exit

########## archiso
umount -l /mnt
shutdown -h now
