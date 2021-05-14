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

PROJECT_NAME="dist"
echo -e "- PROJECT_NAME = ${PROJECT_NAME}\n"

# step2 - 询问是否使用root direction
echo -e "- Step 2"
read -p "? Use or not root direction, Y/N(default is Y): " USE_ROOT_DIRECTION
if [ -z $USE_ROOT_DIRECTION ]
then
  echo -e "  - USE_ROOT_DIRECTION=${USE_ROOT_DIRECTION}\n"
elif [[ $USE_ROOT_DIRECTION == "Y" || $USE_ROOT_DIRECTION == "YES" || $USE_ROOT_DIRECTION == "y" || $USE_ROOT_DIRECTION == "yes" ]]
then
  echo -e "  - USE_ROOT_DIRECTION=${USE_ROOT_DIRECTION}\n"
else
  echo -e "  - USE_ROOT_DIRECTION=${USE_ROOT_DIRECTION}\n  - Don't use root direction.\n"
  # step3 - 压缩
  echo -e "- Step 3"
  echo -e "- cd ./${PROJECT_NAME}"
  cd ./${PROJECT_NAME}
  echo -e "  - pwd = "
  pwd
  echo -e "  - cd ./${PROJECT_NAME}\n  - success!\n"
  echo -e "- tar -cvf ../${PROJECT_NAME}.tar *"
  tar -cvf ../${PROJECT_NAME}.tar *
  echo -e "  - tar -cvf ../${PROJECT_NAME}.tar *\n  - success!\n"
  exit 0
fi

# step3 - 压缩
echo -e "- Step 3"
echo -e "- tar -cvf ${PROJECT_NAME}.tar ./${PROJECT_NAME}"
tar -cvf ${PROJECT_NAME}.tar ./${PROJECT_NAME}
echo -e "  - tar -cvf ${PROJECT_NAME}.tar ./${PROJECT_NAME}\n  - success!\n"

exit 0
