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

# step2 - 询问使用哪个分支
echo -e "- Step 2"
DEFAULT_USER_GIT_USE_BRANCH=`git rev-parse --abbrev-ref HEAD`
read -p "? Which branch to use(default is ${DEFAULT_USER_GIT_USE_BRANCH}): " USER_GIT_USE_BRANCH
if [ -z $USER_GIT_USE_BRANCH ];then
  USER_GIT_USE_BRANCH=${DEFAULT_USER_GIT_USE_BRANCH}
fi
echo -e "  - USER_GIT_USE_BRANCH=${USER_GIT_USE_BRANCH}\n  - success!\n"

# step3 - 拉取代码
echo -e "- Step 3"
echo -e "- git pull --rebase"
git pull --rebase
# -e 开启转义
echo -e "  - git pull --rebase\n  - success!\n"

# step4 - 询问是否提交更新
echo -e "- Step 4"
read -p "? Submit update or not, Y/N(default is Y): " USER_GIT_SUBMIT_UPDATE
if [ -z $USER_GIT_SUBMIT_UPDATE ]
then
  echo -e "  - USER_GIT_SUBMIT_UPDATE=${USER_GIT_SUBMIT_UPDATE}"
elif [[ $USER_GIT_SUBMIT_UPDATE == "Y" || $USER_GIT_SUBMIT_UPDATE == "YES" || $USER_GIT_SUBMIT_UPDATE == "y" || $USER_GIT_SUBMIT_UPDATE == "yes" ]]
then
  echo -e "  - USER_GIT_SUBMIT_UPDATE=${USER_GIT_SUBMIT_UPDATE}"
else
  echo -e "  - USER_GIT_SUBMIT_UPDATE=${USER_GIT_SUBMIT_UPDATE}"
  echo -e "  - Don't submit update."
  exit 0
fi
echo -e "\n"

# step5 - 提交到 master 分支
echo -e "- Step 5"
echo -e "- git push origin HEAD:refs/for/${USER_GIT_USE_BRANCH}"
git push origin HEAD:refs/for/${USER_GIT_USE_BRANCH}
echo -e "  - git push origin HEAD:refs/for/${USER_GIT_USE_BRANCH}\n  - success!\n"

exit 0
