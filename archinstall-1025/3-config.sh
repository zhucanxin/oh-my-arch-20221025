#!/bin/bash
echo "添加其他系统"
sudo os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "####安装输入法"
sudo pacman -S fcitx5-im fcitx5-chinese-addons  fcitx5-lua fcitx5-nord fcitx5-material-color   
echo "####安装输入法的插件"
yaourt -S vim-fcitx

cp config/.xinitrc ~ 
cp config/.bashrc ~
cp config/.zshrc ~
sudo cp config/slim.conf /etc
cp -r config/.vim ~
cp -rP config/.config/zsh  ~/.config
cp -r config/.oh-my-zsh ~
cp .xprofile ~/.xprofile
####安装字体
echo "####安装字体"
sudo pacman -S wqy-microhei    wqy-microhei-lite    wqy-bitmapfont   wqy-zenhei    ttf-arphic-ukai    ttf-arphic-uming    adobe-source-han-sans-cn-fonts
###设置locate的设置
sed -i 's/RUNEPATHS = \"\/afs \/media/RUNEPATHS = \"\/afs /' /etc/updatedb.conf
###安装中文man
yaourt man-pages-zh
#### 安装一些软件
sudo pacman -S ranger bash-completion pcmanfm w3m moc firefox firefox-i18-zh-cn     wget file-roller plocate cronie at ntfs-3g stardict sdcv
yaourt -S dingtalk-electron chromium wechat-uos icalingua++ slock 
##6，每次挂载ntfs都要密码咋弄？
##编辑/usr/share/polkit-1/actions/org.freedesktop.Udisks2.policy
##把与id="org.freedesktop.udisks2.filesystem-mount-system"对应的
##<allow_active>auth_admin_keep</allow_active>改为<allow_active>yes</allow_active>
 #### 安装解码器
sudo pacman -S mplayer gst-libav gst-plugins-bad gst-plugins-base gst-plugins-ugly

