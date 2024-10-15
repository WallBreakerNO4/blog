---
title: Tailscale 进阶使用教程 - MagicDNS、子网路由和自建中转
date: 2024-07-31T15:42:00Z
draft: "true"
author: WallBreakerNO4
---

在上一篇文章中，我介绍了 Tailscale 的搭建方法，同时说明了选择 Tailscale 的原因。在这篇文章中，我将介绍几个 Tailscale 的进阶玩法。

## Subnet routes（子网路由）

假设你有好几台设备，上边都部署了一些服务。这些设备在同一个局域网内，你希望你在外网时可以访问在这些设备上的服务。正常情况下，我们需要在每一台设备上都安装 tailscale 客户端，才能实现这样的需求。我们注意到，这些设备都在同一局域网（网段）下，因此我们可以使用 tailscale 自带的 subnet routes 来优化我们的组网。

> Subnet routes 的[官方文章](https://tailscale.com/kb/1019/subnets)
> 太长不看版：Subnet routes（子网路由）是通过 Tailscale 连接远程网络（子网）的方法。配置 subnet routes 后，设备可以通过 Tailscale VPN 访问其他设备所在的本地网络，无需直接连接。

假设我们的局域网配置如下图，局域网 IP 段为 `192.168.1.0/24`，**自己配置时请替换为实际 IP 段**

![tailscale subnet.drawio.png](https://image.wall-breaker-no4.xyz/imgs/202410111635185.png)

我们可以将 tailscale 安装在任意一个设备上，在成功加入 tailscale 网络后，可以通过以下命令来添加子网

> 如果你用的路由器运行着 openwrt，那么可以参考 openwrt 的[官方文章](https://openwrt.org/docs/guide-user/services/vpn/tailscale/start) 来安装 tailscale

```shell
sudo tailscale set --advertise-routes="192.168.1.0/24"
```

然后去 [tailscale 控制台](https://login.tailscale.com/admin/machines)，找到对应的设备，找到编辑路由设置
![image.png](https://image.wall-breaker-no4.xyz/imgs/202410111644921.png#center)
最后将刚刚添加的子网勾选并保存
![image.png](https://image.wall-breaker-no4.xyz/imgs/202410111648375.png#center)
现在 tailscale 网络里的所有设备（配置为子网路由网关的设备除外）访问 `192.168.1.0/24` 这个网段的流量都会被路由到这个设备，这样便实现了子网路由

## 自建中转

前文说到，tailscale 需要良好的 NAT 环境才能打洞成功并直连。但在部分情况下，tailscale 无法成功打洞。在这种情况下，tailscale 会选择使用 derp 来中转流量，也就是类似传统 VPN 的形式

> 你可以使用这个 [python 工具](https://pypi.org/project/yapystun/)来测试你所在的网络是什么 NAT 环境
> 基本上，我们需要在 P2P 连接中需要至少有一个客户端拥有 Full Cone NAT 或者更好的公网 IP 才能打洞成功

![image.png](https://image.wall-breaker-no4.xyz/imgs/20240620000934.png#center)

> 这并不是回退到 derp，tailscale 会在一开始就使用 derp 来建立连接中转流量，并在打洞成功后使用 P2P 连接，这保证了 tailscale 在各种网络环境下的可用性

**但是**，tailscale 在国内并没有并没有 derp 节点。而由于我大清自有国情，这些在海外的节点的连接质量并不好，因此我们需要自建 derp 节点来改善我们在两个客户端都没有良好 NAT 类型时的连接质量