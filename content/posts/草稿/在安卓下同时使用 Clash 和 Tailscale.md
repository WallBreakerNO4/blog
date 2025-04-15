---
title: 在安卓下同时使用 Clash 和 Tailscale
date: 2024-06-19T23:49:00Z
draft: "true"
author: WallBreakerNO4
---
在之前的文章中，我们已经成功搭建了 Tailscale 网络，并在各个设备上安装了相应的客户端来访问网络。但我们注意到一点：在安卓系统上，同时只能运行一个 VPN 服务，因此 Tailscale 无法与 Clash 同时运行。而且不像 WireGuard，Clash 内核并没有提供对 Tailscale 的支持。
> Clash 对 WireGuard 的支持： https://en.clash.wiki/premium/userspace-wireguard.html

在 Google 了一番之后，我发现这个项目：[Magisk Tailscaled](https://github.com/Magisk-Modules-Alt-Repo/Magisk-Tailscaled)，