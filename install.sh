#!/bin/bash

# 仓库链接
repository_url="https://github.com/manateelazycat/lsp-bridge.git"
# 目标目录设置在home目录下的指定子目录
target_directory="$HOME/lsp-bridge"

# 检查目标目录是否存在，如果不存在则创建
if [ ! -d "$target_directory" ]; then
    mkdir -p "$target_directory"
fi

# 克隆仓库到目标目录
git clone --depth 1 "$repository_url" "$target_directory"
if [ $? -eq 0 ]; then
    echo "Repository cloned successfully into $target_directory"
else
    echo "Failed to clone repository"
fi
