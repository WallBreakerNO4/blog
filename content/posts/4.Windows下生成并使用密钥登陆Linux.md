---
title: Windows下生成并使用密钥登陆Linux
date: 2024-06-12T00:00:00Z
draft: false
author: WallBreakerNO4
---


### 生成密钥

命令：`$ ssh-keygen -t rsa`
生成的私钥以 `.pub` 结尾，内容类似如下：

```
ssh-rsa AAAAB3NzaC1yc...D4J6QDEnOtzMCIk= zhifa@Wall-PC
```

---

### 上传密钥

登陆 Linux，打开 `~/.ssh/authorized_keys` ，并把公钥文件中的内容复制到其中

---

### 设置权限

使用 `chmod` 将 `authorized_keys` 文件权限设置为 `664`

---

### 调整 openSSH 选项

以 `root` 身份打开 `/etc/ssh/sshd_config` ，更改以下几项：

```
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication no
```

重启 `sshd` 服务

`$ sudo systemctl restart sshd.service`

---

### Windows 设置

打开 `.ssh/` 文件夹下的 `config` 文件，添加类似如下内容

```
Host tx   #别名
	User wall   #登陆用户名
	Hostname wall-breaker-no4.xyz   #服务器地址
	PreferredAuthentications publickey   #使用密钥登陆
	IdentityFile C:\Users\zhifa\.ssh\tx_rsa   #私钥地址
```
