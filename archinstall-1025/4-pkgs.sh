#!/bin/bash
echo "安装一些其他软件“
echo "####安装办公软件，注意/tmp问题"
mkdir /home/manjaro/tmp
export TMPDIR=/home/manjaro/tmp 
yaourt  wps-office   #选择中文版
yaourt  wps-office-fonts   #  fonts
##wttr 天气预报  slock锁屏软件 
yaourt parole bc stardict sdcv  sl slock wudao-dict  neofetch screenfetch wttr musikcube
##Ncdu（图形界面磁盘分析器）
pacman -S ncdu 
## screem-message 在屏幕上显示东西的软件 命令是sm
yaourt -S screen-message
###  录屏软件simplescreenrecorder，显示键盘按键输入的软件screenkey 分屏软件tumx mlocate   
#locate 设置
