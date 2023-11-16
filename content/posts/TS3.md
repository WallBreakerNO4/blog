+++
title = 'TeamSpeak 3 客户端使用教程'
date = 2023-11-16T17:19:00Z
draft = false
+++

## 0x00 | 前言 | 什么是 TeamSpeak 3？

TeamSpeak 3 （下文简称为 TeamSpeak 3）是一款开源的 VoIP（语音聊天）软件，其提供了免费且开源的服务端与客户端。相比于其他我们常用的聊天软件，如国内常见的 `KOOK（原开黑啦）`和国外常见的 `Discord`，其最大的优点是其资源占用低。

如下图所见，在 `KOOK`、`Discord`、`Tim` 和 `TeamSpeak 3` 这四款语音软件中，TeamSpeak 3 对内存的占用是最低的，仅有 77.2MB。

![image.png](https://s2.loli.net/2022/09/10/c7HWAZLaNC4S1P6.png)

因此，在电脑性能相对不高，内存容量相对不富裕时，TeamSpeak 3 无疑是绝佳的选择。

***

## 0x01 | 下载

***重要：此教程中所需的所有文件我都在国内的网盘中提供了一份，若你无法访问官网的话可以退而求其次从我的网盘链接中下载***

打开 TeamSpeak 3 [官网](https://www.teamspeak.com/zh-CN/downloads/)并下载 Windows 64 位版本客户端 （官网在墙外，打开速度可能较慢，这里提供下载好的客户端在国内网盘的[镜像](https://wallbreakerno4.lanzouj.com/ihFUq0bfn5rc)）。

![image.png](https://s2.loli.net/2022/09/10/kFIcUKC1QBSRVer.png)

下载好的文件应如下图所示。

![image.png](https://s2.loli.net/2022/09/10/MjzovhZ7U92e1JW.png)

## 0x02 | 安装

双击打开安装包。

![image.png](https://s2.loli.net/2022/09/10/wyM9n4OtS7UZ6XJ.png)

拉到最底部并同意协议。

![image.png](https://s2.loli.net/2022/09/10/qtiTj5opWwGCNSM.png)

选哪个都无所谓，但是我推荐选 `Install just for me`。

![image.png](https://s2.loli.net/2022/09/10/ImT698fJKZEDFGV.png)

选一个安装位置（我就直接用默认的位置了）。

![image.png](https://s2.loli.net/2022/09/10/6OAQixNVzX7l1mC.png)

选择用户资料保存位置，就按照软件推荐的默认选择`Save in user own files`就行了。

![image.png](https://s2.loli.net/2022/09/10/OMbz8WiN5xcYeRF.png)

选择是否安装游戏内显示（显示谁在说话），这边选择不安装。

![image.png](https://s2.loli.net/2022/09/10/GVyb8SvxQgeKd3P.png)

安装完毕。

![image.png](https://s2.loli.net/2022/09/10/x1kLBiORep7q5oC.png)

## 0x03 | 第一次启动

打开 TeamSpeak 3 客户端，第一次打开会弹出一个又臭又长的 EULA（用户协议）。滑到最底下并选择 `I accept`。

![image.png](https://s2.loli.net/2022/09/10/RN7YahTcUr9SZCl.png)

第一次打开时会弹出一个广告界面，将其关闭。

![image.png](https://s2.loli.net/2022/09/10/2pvl6F1snkXoq7x.png)

第一次打开时TeamSpeak 3 客户端会让我们登陆。由于是使用我自己搭建的服务器而不是官方的服务器，因此这里选择`Continue without logging in`。

![image.png](https://s2.loli.net/2022/09/10/2eWs1HGzVDBjhv9.png)

起一个用户名

![image.png](https://s2.loli.net/2022/09/10/S16IJuCy4azUKc3.png)

## 0x04 | 汉化

TeamSpeak 3 是默认没有中文的，因此我们需要手动汉化（当然如果你想锻炼英语能力也可以跳至 0x05）。在 GitHub 上有为 TeamSpeak 3 客户端汉化的[项目](https://github.com/jitingcn/TeamSpeak3-Translation_zh-CN)，该项目以插件的形式将 TeamSpeak 3 客户端汉化。在`Releases`界面并下载[最新版](https://github.com/jitingcn/TeamSpeak3-Translation_zh-CN/releases)（此文件也同样在国内网盘中提供了[镜像](https://wallbreakerno4.lanzouj.com/ihFUq0bfn5rc)）

![image.png](https://s2.loli.net/2022/09/10/5eHBMaJxul9vSUP.png)

下载下来的文件如图。这是一个`.TeamSpeak 3_translation`后缀的文件，由于我们安装好了 TeamSpeak 3，因此其被系统正确识别了用什么软件打开，我们只要双击打开就行了。

![image.png](https://s2.loli.net/2022/09/11/VGyqf1Bv6hkDTj8.png)

TeamSpeak 3 会跳出一个检查插件的界面。点击`Install`即可完成汉化。

![image.png](https://s2.loli.net/2022/09/11/QWT4ifz6xcSjCRv.png)

点击`Yes`

![image.png](https://s2.loli.net/2022/09/11/7WEea9CLSXKRhpj.png)

在托盘处右键 TeamSpeak 3 客户端图标，点击`Quit`手动退出 TeamSpeak 3 客户端

![image.png](https://s2.loli.net/2022/09/11/xkpIWAVXj8zTGrm.png)

启动 TeamSpeak 3 客户端，现在已经汉化成功了

![image.png](https://s2.loli.net/2022/09/11/PpoGC6zv7jLS3hY.png)

## 0x05 | 连接服务器

`连接`->`连接服务器`

![image.png](https://s2.loli.net/2022/09/11/qgKsdOWiV8pB6bF.png)

在`服务器别名或地址`处填写`ts.wall-breaker-no4.xyz`，取一个 ID（用自己常用的昵称就好），然后点击`连接`

![image.png](https://s2.loli.net/2022/09/11/bjZ2ont9hsyIDQF.png)

恭喜你成功加入了我的服务器

![image.png](https://s2.loli.net/2022/09/11/Fk8ImVcwXrqpbTC.png)

***

## 0x06 | 其他设置

### 设置最小化方式

TeamSpeak 3 客户端与常见如`KOOK`和`Discord`在最小化的逻辑上有所不同，若直接点击右上角的`X`，就直接断开连接退出，而不是退至后台运行。其需要设置才能退至后台运行

进入`工具`->`设置`

![image.png](https://s2.loli.net/2022/09/11/zyt1NRoWPQ8SlkY.png)

进入`风格`一栏，将`关闭到状态栏`的复选框勾上，并点击`OK`或`Apply`来保存设置

![image.png](https://s2.loli.net/2022/09/11/iXMmE7Khjr3vsVB.png)

现在你便可以像点击关闭键来将 TeamSpeak 3 客户端在后台运行

### 自启动

进入`工具`->`设置`->`应用程序`，将`开机时自动启动TeamSpeak`的复选框勾上，并点击`OK`或`Apply`来保存设置

![image.png](https://s2.loli.net/2022/09/11/gtlvje7QrymnD2N.png)

### 启动时自动连接服务器

`书签`->`书签管理器`

![image.png](https://s2.loli.net/2022/09/11/52yDZr6mdJIhBvG.png)

点击`新建书签`

![image.png](https://s2.loli.net/2022/09/11/sxEd57NPFWhz6Zm.png)

填写`书签名`和`昵称`，在`服务器别名或地址`处填入`ts.wall-breaker-no4.xyz`，然后点击`进阶选项`

![image.png](https://s2.loli.net/2022/09/11/bRwrfX5sLn4alcJ.png)

将`启动时连接此服务器`的复选框勾上，并点击`OK`或`Apply`来保存设置

![image.png](https://s2.loli.net/2022/09/11/cIP2Denl76ZAqEs.png)

## 0x07 | 写在最后

这篇文章是我学习 Markdown 后写的第一篇文章。现在回看，无论是排版上还是文笔上都还是有许多不足的。不过作为我的第一篇文章，我还是决定一笔不改把他搬到我的博客上，望各位读者见谅。