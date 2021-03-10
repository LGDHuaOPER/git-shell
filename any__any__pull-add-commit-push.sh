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
echo "  - GIT_SHELL_CD_PARAM=${GIT_SHELL_CD_PARAM}"
cd $GIT_SHELL_CD_PARAM
echo -e "  - pwd = "
pwd
echo -e "\n"

# step2 - 询问使用哪个分支
echo -e "- Step 2"
read -p "? Which branch to use(default is master): " USER_GIT_USE_BRANCH
if [ -z $USER_GIT_USE_BRANCH ];then
  USER_GIT_USE_BRANCH=master
fi
echo "USER_GIT_USE_BRANCH=${USER_GIT_USE_BRANCH}"
echo -e "\n"

# step3 - 拉取代码
echo -e "- Step 3"
echo "- git pull"
git pull origin ${USER_GIT_USE_BRANCH}
# -e 开启转义
echo -e "  - git pull success! \n"

# step4 - 询问是否提交更新
echo -e "- Step 4"
read -p "? Submit update or not, Y/N(default is Y): " USER_GIT_SUBMIT_UPDATE
if [ -z $USER_GIT_SUBMIT_UPDATE ]
then
  echo "  - USER_GIT_SUBMIT_UPDATE=${USER_GIT_SUBMIT_UPDATE}"
elif [[ $USER_GIT_SUBMIT_UPDATE == "Y" || $USER_GIT_SUBMIT_UPDATE == "YES" || $USER_GIT_SUBMIT_UPDATE == "y" || $USER_GIT_SUBMIT_UPDATE == "yes" ]]
then
  echo "  - USER_GIT_SUBMIT_UPDATE=${USER_GIT_SUBMIT_UPDATE}"
else
  echo "USER_GIT_SUBMIT_UPDATE=${USER_GIT_SUBMIT_UPDATE}"
  echo "Don't submit update."
  exit
fi
echo -e "\n"

# step5 - 添加
echo -e "- Step 5"
echo "- git add"
git add -A
echo -e "  - git add success! \n"

# step6 - 询问提交信息
echo -e "- Step 6"
read -p "? Input commit message: " USER_GIT_COMMIT_MESSAGE
if [[ -z $USER_GIT_COMMIT_MESSAGE ]];then
  USER_GIT_COMMIT_MESSAGE="default commit mesage"
fi
USER_GIT_COMMIT_MESSAGE="${USER_GIT_COMMIT_MESSAGE%\"}"
USER_GIT_COMMIT_MESSAGE="${USER_GIT_COMMIT_MESSAGE#\"}"
echo "USER_GIT_COMMIT_MESSAGE=${USER_GIT_COMMIT_MESSAGE}"
echo -e "\n"

# step7 - 提交到历史区
echo -e "- Step 7"
echo "- git commit"
git commit -m "${USER_GIT_COMMIT_MESSAGE}"
echo -e "  - git commit success! \n"

# 去除首尾双引号
# "$opt" | tr -d '"'

# step8 - 提交到远端分支
echo -e "- Step 8"
echo "- git push"
git push origin ${USER_GIT_USE_BRANCH}
echo -e "  - git push success! \n"

exit 0
