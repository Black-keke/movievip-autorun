#!/bin/bash

echo "【$(date)】🎬  Codespaces 启动成功，开始执行 MovieVIP 任务..."

# 运行你的电影脚本
cd /workspaces/movievip-autorun
python3 MovieVIP.py

# 任务完成，重要：让容器自动停止以节省额度。
echo "【$(date)】✅ 任务执行完毕，正在关闭 Codespaces..."
CODESPACE_NAME=$(echo $CODESPACE_NAME | tr -d '\n')
curl -s -X DELETE "https://$GITHUB_API_TOKEN@api.github.com/user/codespaces/$CODESPACE_NAME"
