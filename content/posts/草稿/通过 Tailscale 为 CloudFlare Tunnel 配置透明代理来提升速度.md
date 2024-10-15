---
title: 通过 Tailscale 为 CloudFlare Tunnel 配置代透明理来提升速度
date: 2024-07-30T16:07:00Z
draft: "true"
author: WallBreakerNO4
---

> CloudFlare 为什么被称为云计算领域的神？在讨论这个问题之前，我想先说说其他云服务提供商相较于 CloudFlare 究竟差在了哪里...

好了，不开玩笑了 (‾◡◝)，但 CloudFlare 确实提供了很多实用且免费的服务给我们这些平民玩家，如免费的 Worker 和 CDN ~~虽然在国内是减速器~~，以及本文标题提及的 CloudFlare Tunnel。

## CloudFlare Tunnel 是什么

这是官方的产品介绍：[官方文章](https://www.cloudflare.com/zh-cn/products/tunnel/)
省流：你可以理解成这是一个类似 frp 的内网穿透服务，你可以将你部署在内网的 http 服务穿透到公网上。不同的是 CloudFlare 在上面集成了 CDN 服务，并且提供了自动 https。最关键的是，只要你将域名托管到 CloudFlare 上，你就可以免费的使用这个服务。

### BUT!

CloudFlare 在国内访问速度不佳是众所周知的事 ~~CloudFlare 减速器~~。
![image.png](https://image.wall-breaker-no4.xyz/imgs/20240730160252.png#center)
同样的道理，由于使用 CloudFlare Tunnel 的先决条件是在内网的机器能访问到 CloudFlare Tunnel Endpoint，然而在国内去访问这些 Endpoint 并不稳定。导致访问速度慢，甚至服务掉线。

因此我想到是否可以通过给 Tunnel 添加前置代理的方法来提升速度与稳定性，在一番搜索之后找到这篇[文章](https://blog.xmgspace.me/archives/cloudflare-tunnel-via-proxy.html)。然而文章中指出：CloudFlare 官方的态度是不会支持 HTTP/Socks 前置代理 [链接](https://github.com/cloudflare/cloudflared/issues/350#issuecomment-1706842883)。因此，那篇文章中是使用了 V2ray + IPtables 手写路由达成了透明代理。

受到文章启发，结合本人已经搭建好的 Tailscale 网络，我想到可以使用 Tailscale 的 Subnet routers（子网路由）功能来简单的实现透明代理。

