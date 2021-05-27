#!/bin/bash
#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# step1 - git status
echo -e "- Step 1"
echo -e "- git status --show-stash --verbose --untracked-files --column"
git status --show-stash --verbose --untracked-files --column
echo -e "  - git status --show-stash --verbose --untracked-files --column\n  - success!\n"

exit 0
