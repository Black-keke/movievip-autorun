#!/bin/bash

# 获取脚本开始执行的时间
START_TIME=$(date +%s)
echo "【$(date)】🎬 Codespaces 启动成功，开始执行 MovieVIP 任务..."

# 运行你的电影脚本
cd /workspaces/movievip-autorun
echo "正在运行 MovieVIP.py..."
python3 MovieVIP.py

# 计算已经运行的时间
END_TIME=$(date +%s)
ELAPSED_TIME=$((END_TIME - START_TIME))
REMAINING_TIME=$((300 - ELAPSED_TIME)) # 300秒=5分钟

echo "【$(date)】✅ 主任务执行完毕，已运行 $ELAPSED_TIME 秒"

# 如果运行时间不足5分钟，则等待至5分钟
if [ $REMAINING_TIME -gt 0 ]; then
    echo "等待剩余 ${REMAINING_TIME} 秒以达到5分钟运行时长..."
    sleep $REMAINING_TIME
    echo "✅ 已完成5分钟运行时长"
else
    echo "⚠️  任务已运行超过5分钟，立即关闭"
fi

# 最终关闭Codespace
echo "【$(date)】🛑 正在关闭 Codespaces..."
CODESPACE_NAME=$(echo $CODESPACE_NAME | tr -d '\n')
curl -s -X DELETE "https://$GITHUB_API_TOKEN@api.github.com/user/codespaces/$CODESPACE_NAME"
