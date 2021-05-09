#!/bin/bash
#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# step1 - 询问切换哪个目录
echo -e "- Step 1"
DEFAULT_GIT_SHELL_CD_PARAM="./"
read -p "? Where do you want to switch directories(default is ${DEFAULT_GIT_SHELL_CD_PARAM}): " GIT_SHELL_CD_PARAM
if [ -z $GIT_SHELL_CD_PARAM ];then
  GIT_SHELL_CD_PARAM=${DEFAULT_GIT_SHELL_CD_PARAM}
fi
GIT_SHELL_CD_PARAM="${GIT_SHELL_CD_PARAM%\"}"
GIT_SHELL_CD_PARAM="${GIT_SHELL_CD_PARAM#\"}"
echo -e "  - GIT_SHELL_CD_PARAM=${GIT_SHELL_CD_PARAM}"
cd $GIT_SHELL_CD_PARAM
echo -e "  - pwd = "
pwd
echo -e "  - cd $GIT_SHELL_CD_PARAM\n  - success!\n"

# step2 - 列举stash
echo -e "- Step 2"
echo -e "- git stash list"
git stash list
echo -e "  - git stash list\n  - success!\n"

# step3 - 询问使用哪个index
echo -e "- Step 3"
DEFAULT_STASH_INDEX=0
read -p "? Which branch to use(default is ${DEFAULT_STASH_INDEX}): " STASH_INDEX
if [ -z $STASH_INDEX ];then
  STASH_INDEX=${DEFAULT_STASH_INDEX}
fi
echo -e "  - STASH_INDEX=${STASH_INDEX}\n  - success!\n"

# step4 - 应用stash
echo -e "- Step 4"
echo -e "- git stash drop stash@{${STASH_INDEX}}"
git stash drop stash@{${STASH_INDEX}}
echo -e "  - git stash drop stash@{${STASH_INDEX}}\n  - success!\n"

exit 0
