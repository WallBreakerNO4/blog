---
title: 如何为Docker添加代理
date: 2024-06-13T15:15:00Z
draft: "false"
author: WallBreakerNO4
---
前段时间，我帮朋友搭建了一个我的世界服务器，并计划使用 Docker 来管理它。然而，在安装过程中，我发现镜像总是无法拉取。经过查阅资料，我发现可以通过配置 Docker Daemon 使用代理来拉取镜像。考虑到最近各个镜像站都撤掉了 Docker Hub 的镜像，我认为配置代理来访问 Docker Hub 可能是未来在大陆使用 Docker 的最佳方式。

## 为 Docker Daemon 配置代理

首先，创建配置文件：

```shell
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo nano /etc/systemd/system/docker.service.d/proxy.conf
```

在配置文件中填入以下内容：

```conf
[Service]
Environment="HTTP_PROXY=http://[proxy server]:[port]/"
Environment="HTTPS_PROXY=http://[proxy server]:[port]/"
Environment="NO_PROXY=localhost,127.0.0.1,::1,.local,.localdomain,192.168.0.0/16,172.16.0.0/12,10.0.0.0/8,100.64.0.0/10"
```

我们需要重启 Docker Daemon 服务以使配置生效：

```shell
sudo systemctl daemon-reload
sudo systemctl restart docker
```

现在，已经可以正常的拉取镜像
## 参考

> [Docker Daemon Systemd 配置文档](https://docs.docker.com/config/daemon/systemd/#httphttps-proxy)