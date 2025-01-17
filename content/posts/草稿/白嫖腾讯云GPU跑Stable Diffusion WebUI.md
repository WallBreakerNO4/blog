---
title: 白嫖腾讯云GPU跑Stable Diffusion
date: 2024-12-21T00:27:00Z
draft: "true"
author: WallBreakerNO4
---
AI 绘画并不是一个离我们很远的话题，随着基于 diffusion 架构的 stable diffusion 的诞生，各式各样的绘图模型如井喷式诞生。如果想在本地跑 AIGC 的绘画软件，那么一块强大的 GPU 是必不可少的。但不是所有人都~~是臭打游戏的~~拥有一块 GPU，因此我在这里介绍如何白嫖腾讯云的免费 GPU 来运行 Stable Diffusion WebUI

> 感谢 [Linux Do](https://linux.do/t/topic/262176) 上的网友将这个白嫖的方法分享出来
## 准备

首先打开 https://ide.cloud.tencent.com/dashboard/gpu-workspace ，登录后便能进入到这一个界面（图中是我已经创建好的，请忽略）：
![image.png](https://image.wall-breaker-no4.xyz/imgs/202412210041980.png)

> 腾讯云在 Cloud Studio 中提供了一个月 10000 分钟的 GPU 时长（2025 年 1 月 1 日后），免费的 GPU 配置为 Tesla T4，拥有 16G 的显存。这用于跑 Stable Diffusion WebUI 已经绰绰有余了。
> 美中不足的是，这个在排除了系统自带占用后，只有 30G 的空间，稍微有点小

新建一个工作空间：
![image.png](https://image.wall-breaker-no4.xyz/imgs/202412210046512.png)

名称随便，能记住就行，模板选择 Pytorch：
![image.png](https://image.wall-breaker-no4.xyz/imgs/202412210047611.png)

进入新建好的工作空间 ~~VScode 换皮~~
![image.png](https://image.wall-breaker-no4.xyz/imgs/202412210122200.png)

将左侧的示例删除：
![image.png](https://image.wall-breaker-no4.xyz/imgs/202412210124619.png)

新建一个终端：
![image.png](https://image.wall-breaker-no4.xyz/imgs/202412210126986.png)
![image.png](https://image.wall-breaker-no4.xyz/imgs/202412210127485.png)

## 安装 WebUI

克隆项目（使用 Github Proxy 代理）到本地并进入 webui 文件夹：
```shell
git clone https://ghfast.top/https://github.com/lllyasviel/stable-diffusion-webui-forge.git
cd stable-diffusion-webui-forge
```
> Github Proxy 项目的域名很容易被墙，请去项目最新发布[地址](https://ghproxy.link/)查看可用域名，并将后续使用 Github Proxy 的域名替换

将自带的 pytorch 删除（版本太老了），创建 venv 并安装最新版的 pytorch：
```shell
pip uninstall torch torchvision torchaudio
python -m venv venv
source venv/bin/activate
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
```
>  可能会比较慢，但国内没有 pytorch 的镜像源了，只能这样嗯下

打开 `stable-diffusion-webui-forge/modules/launch_utils.py` 文件，将里面所有的 `https://github.com` 替换为 `https://ghfast.top/https://github.com`，在第一次启动 webui 安装插件时走镜像加速安装
![image.png](https://image.wall-breaker-no4.xyz/imgs/202412210146890.png)
>  使用 `ctrl + H` 进行替换

安装工作空间缺失的组件（`aria2` 是用于下载模型的，如果你喜欢使用 `wget` 的话就不用安装）：
```shell
apt update && apt install aria2 google-perftools bc libgl1 -y
```

修改 `stable-diffusion-webui-forge/webui-user.sh`，取消 `export COMMANDLINE_ARGS=""` 这一行的注释，并修改为：
```
export COMMANDLINE_ARGS="--listen --enable-insecure-extension-access --api --theme dark --cuda-malloc"
```
![image.png](https://image.wall-breaker-no4.xyz/imgs/202412210151109.png)

进入 `stable-diffusion-webui-forge/models/Stable-diffusion` 下载模型：
>  对于画二次元图片，我推荐 Laxhar Dream Lab 训练的 NoobAI-XL 系列模型：[Huggingface 地址](https://huggingface.co/Laxhar)，[Civitai 地址](https://civitai.com/models/833294/noobai-xl-nai-xl)

```shell
cd stable-diffusion-webui-forge/models/Stable-diffusion
# 由于 HuggingFace 被墙，使用 HF-mirror 下载
aria2c -x 16 -o NoobAI-XL-Vpred-v1.0.safetensors "https://hf-mirror.com/Laxhar/noobai-XL-Vpred-1.0/resolve/main/NoobAI-XL-Vpred-v1.0.safetensors?download=true"
# HuggingFace 下载链接
# aria2c -x 16 -o NoobAI-XL-Vpred-v1.0.safetensors "https://huggingface.co/Laxhar/noobai-XL-Vpred-1.0/resolve/main/NoobAI-XL-Vpred-v1.0.safetensors?download=true"
```

返回 webui 根目录，并启动 webui：
```shell
cd /workspace/stable-diffusion-webui-forge/
./webui.sh -f
```
> 由于是 root 身份，需要添加 `-f` 参数才能启动 webui

终端出现类似以下输出时，webui 便启动成功了
```
Running on local URL:  http://0.0.0.0:7860

To create a public link, set `share=True` in `launch()`.
Startup time: 47.7s (prepare environment: 12.1s, launcher: 0.6s, import torch: 12.2s, initialize shared: 0.1s, other imports: 0.5s, load scripts: 2.2s, initialize google blockly: 14.1s, create ui: 2.6s, gradio launch: 1.4s, add APIs: 1.7s).
```
![image.png](https://image.wall-breaker-no4.xyz/imgs/202412210226475.png)

## 访问 WebUI

由于腾讯云的这个工作空间并不提供外部访问端口的功能，我们需要使用内网穿透工具来访问 webui