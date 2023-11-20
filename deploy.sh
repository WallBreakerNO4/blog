#!/bin/bash

# 执行hugo -F命令
hugo -F

# 添加所有更改到Git仓库
git add .

# 获取本地时间并格式化为YYYY-MM-DD HH:mm:ss
commit_time=$(date +"%Y-%m-%d %H:%M:%S")

# 使用本地时间作为备注来进行git commit
git commit -m "Update site at $commit_time"

# 推送到远程仓库
git push
