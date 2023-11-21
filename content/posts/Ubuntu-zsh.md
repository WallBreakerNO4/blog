---
title: 在Ubuntu上安装zsh以及高亮、自动补全插件
date: 2023-11-22T00:00:00Z
draft: false
author: WallBreakerNO4
---
记录一下如何在 Ubuntu 上安装 zsh，以及高亮、自动补全插件和自定义主题
## 安装 zsh

~~~shell
sudo apt install zsh git fonts-font-awesome
~~~
## 安装 Oh My Zsh

> Oh My Zsh will not make you a 10x developer... But you may feel like one!

~~~shell
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
~~~

## 安装插件和主题
### 语法高亮

```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### 自动补全

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### 安装主题

```shell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### 配置文件

打开 `~/.zshrc`
~~~shell
nano ~/.zshrc
~~~

把 `ZSH_THEME` 改成 `powerlevel10k/powerlevel10k`：
![image.png](https://image.wall-breaker-no4.xyz/imgs/202311220011285.png#center)

在 `plugins` 处加上 `zsh-syntax-highlighting` 和 `zsh-autosuggestions`（用空格隔开）：
![image.png](https://image.wall-breaker-no4.xyz/imgs/202311220013082.png#center)
#### 配置代理

~~~shell
export https_proxy=http://192.168.20.50:17890;export http_proxy=http://192.168.20.50:17890;export all_proxy=socks5://192.168.20.50:17890
~~~

### 应用更改

~~~shell
source ~/.zshrc
~~~

## 总结

配置 zsh 不难，基本上复制粘贴就行了