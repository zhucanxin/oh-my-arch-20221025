# arch-install-script

自己用的Archlinux快速安装脚本
_（暂时不建议小白使用）_

> 注意：
为了节省安装时间（不喜欢长时间看那字小得可怜的tty），在安装前请务必**检查并改好脚本内容**，改好要挂载的分区，改好自己用户名，加上自己想用软件，毕竟每个人的电脑和需求都不一样。
另外我很久没有装过arch了，install脚本内容已经过时，请自行修改后使用。

### 安装
> 不清楚arch安装的萌新小白请参考熟悉安装过程
[Installation guide (简体中文)](https://wiki.archlinux.org/index.php/Installation_guide_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))
**清楚每一行的意义后再试试该脚本**

一共要执行3个脚本

1. `install` - 安装基本系统（联网并进入archiso后执行）

2. `setup` - 配置系统，安装常用软件、桌面环境，设置用户名（执行完`install`脚本后，chroot进安装好的系统里执行）

3. `conf_restore` - 还原配置文件及我自己的dotfiles（可选，重启成功进入系统后执行，建议用你自己的dotfile）

4. `windows-uts-setting.bat` - 将机器时间由地方时改成UTC，装windows双系统需要执行的脚本

5. `reinstall-grub` - grub重装脚本，用来识别并添加其他系统的grub引导项。系统完成安装后在arch-chroot后执行

#####  安装前注意

>1. 修改 `applist` ，这是要安装的软件列表脚本，可单独执行，请确认并修改自己要安装的软件。也可以等装完系统后再执行该脚本
>2. 修改 `install` `setup` 中要自行设定的变量（如分区挂载点，用户名等）
>3. 分区，不提供分区脚本，请自己先分好区再安装（脚本默认为uefi引导）
