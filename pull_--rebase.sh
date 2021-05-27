#!/bin/bash
#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# step1 - git pull
echo -e "- Step 1"
echo -e "- git pull --rebase"
git pull --rebase
echo -e "  - git pull --rebase\n  - success!\n"

exit 0
