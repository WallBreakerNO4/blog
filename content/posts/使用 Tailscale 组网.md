---
title: 使用 Tailscale 组网
date: 2024-08-01T15:42:00Z
draft: "false"
author: WallBreakerNO4
---

今年年初，我购入了属于自己的 NAS，并在将其作为 HomeLab ~~All In Boom~~ 搭建了许多服务。
![image.png](https://image.wall-breaker-no4.xyz/imgs/202403222130140.png#center)

> 部分自建的服务

在宿舍的局域网内访问这些服务自然是十分方便的。但平常在校内上课时想访问 NAS 上的服务，就需要一番配置了。

## 内网穿透

内网穿透主要有两种：**公网 IP 中转** or **打洞直连**。这两种方式各有其优缺点：

- 公网 IP 中转：

  - 优点：对网络环境（准确说是 NAT 类型）没有要求
  - 缺点：需要公网 IP，如果宿舍没有公网 IP 的话则需要中转服务器
    ![image.png](https://image.wall-breaker-no4.xyz/imgs/20240620000934.png#center)

- 打洞直连：
  - 优点：无需公网 IP
  - 缺点：需要至少一个客户端有良好的 NAT 类型
    ![image.png](https://image.wall-breaker-no4.xyz/imgs/20240620000945.png#center)

> 图片引用自 Tailscale [官方文档](https://tailscale.com/kb/1151/what-is-tailscale)

---

在~~会同职业寄术学院~~ UIC 一期宿舍内有三家运营商，分别是电信、移动和联通。其中联通是唯一一家同时提供 PPPoE 拨号和 IPv6 服务。我在搬到一期宿舍前还听说联通可以申请到公网 IP，因此选择了联通。然而现在联通也申请不到公网 IP 了，令人感慨。

> ~~得出结论，警惕 [@Steven](https://blog.steven53.top/) 的电信诈骗~~

在最开始，我选择了使用 WireGuard + 腾讯云轻量服务器作为中转来提供宿舍的内网穿透。这套方案最开始运作的很好，但用久了就暴露出了一些问题：

- 配置复杂：WireGuard 的配置文件比较复杂，而在多个设备上管理配置文件简直不是人干的事。这个问题在添加新设备到 WireGuard 网络时尤为突出
- 带宽低：由于网络的所有流量都需要经过腾讯云中转，而国内服务器的的带宽懂的都懂
  ![image.png](https://image.wall-breaker-no4.xyz/imgs/20240617145838.png#center)

因此，我最后选择的方案为使用 Tailscale 打洞组网

## Tailscale 是什么

> Tailscale 是一种 VPN 服务，使用 WireGuard 协议创建安全的点对点网状网络。它简化了远程访问，通过加密连接设备，不需要复杂配置、中央网关或手动端口转发。Tailscale 通过避免中心化、降低延迟、维持网络间连接连续性，提高了速度、稳定性和可靠性。适用于开发者、小型企业和需要安全、可扩展网络解决方案的大型企业。
>
> _[原文](https://tailscale.com/kb/1151/what-is-tailscale) 使用 ChatGPT 总结_

个人选择 Tailsale 而不是 ZeroTier 是因为以下三个原因：

- ZeroTier 会默认维护本地设备与每一个 peer 之间的连接，这导致了较大的开销。而 Tailscale 只会在有流量的时候才建立连接。
- [@Steven](https://blog.steven53.top/) 告诉我当切换网络环境时（比如校内 WiFi 不稳定想用流量时），需要重启 ZeroTier 服务来重新建立连接。而 Tailscale 并不需要重启服务，甚至不会让上层服务（如 SSH）断开。
- [~~HCC 指定 IDC 提供商~~ ⑤ 导](https://ecwuuuuu.com/) 的鼎立推荐
- 开箱即用，但也提供了详细的配置以满足自定义需求

## 使用准备

- 多台需要互联的设备
  - ~~_只有一台设备也用不上组 VPN 吧_~~
- 良好的网络环境
  - 指良好的 NAT /防火墙环境，这会影响 Tailscale 能否打洞成功
  - Tailscale 官方关于 NAT 穿透的文章：[# How NAT traversal works](https://tailscale.com/blog/how-nat-traversal-works)
- Google、Microsoft、Github 或 Apple 账号
  - Tailscale 本身不支持注册账号，需要通过第三方 SSO 登录
  - 个人推荐 Github 或 Microsoft 账号

## 开始使用 Tailscale

打开 https://login.tailscale.com/start ，使用你准备的账号登录

![image.png](https://image.wall-breaker-no4.xyz/imgs/20240626140646.png)

> 同意授权

![image.png](https://image.wall-breaker-no4.xyz/imgs/20240625150719.png)

> 成功登录的画面

根据官方的指导在自己的设备上安装 Tailscale，详情可见官方[文档](https://tailscale.com/kb/1347/installation)

---

在安装完成后可以在管理界面看到注册成功的节点，同时 Tailscale 会自动为你的设备分配一个在 `100.64.0.0/10` 内的地址

> 关于为啥是这个地址可以参考官方[文档](https://tailscale.com/kb/1015/100.x-addresses)

![image.png](https://image.wall-breaker-no4.xyz/imgs/20240705174054.png)

> 设备上线后引导界面会显示设备

![image.png](https://image.wall-breaker-no4.xyz/imgs/20240730175813.png)

> 登陆的设备都会在 Tailscale [后台](https://login.tailscale.com/admin/machines)显示出来

现在，设备之间已经可以互相访问了，我们可以 ping 一下试试

![image.png](https://image.wall-breaker-no4.xyz/imgs/20240731114914.png#center)

> 注意到这里并没有 ping 设备在 Tailscale 网络内的 IP，而是 ping 了一个域名，并被解析成了设备的 IP。这是由于 Tailscale 默认启动了 MagicDNS 这个功能，其可以将设备名解析成 Tailscale 内的 IP 地址，这样就不用去记每个设备的 IP 了。
>
> MagicDNS 还有很多扩展玩法，如搭建广告过滤 DNS 来为所有设备去除广告。详情请参阅 Tailscale 官方[文档](https://tailscale.com/kb/1081/magicdns)。

如果能正常 ping 通的话，说明 Tailscale 已经配置好了。

## 尾巴

以上只是 Tailscale 最基本的用法，也是其开箱即用特性的体现。在下一篇文章中，我将介绍 Tailscale 的进阶玩法。
