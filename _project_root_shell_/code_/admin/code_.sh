#!/bin/bash
#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

echo -e "\$1="
echo -e "$1\n"

# step1 - 使用 VSCode 打开项目
echo -e "- Step 1"
echo -e "\n"
echo -e "  - pwd="
pwd
echo -e "\n"
echo -e "  - cd ../../../"
cd ../../../
echo -e "\n"
echo -e "  - pwd="
pwd
echo -e "\n"
echo -e "  - ls -l"
ls -l
echo -e "\n"

# step2 - 询问是否打开项目
echo -e "- Step 2"
read -p "? Open project or not, Y/N(default is Y): " USER_OPEN_PROJECT
if [ -z $USER_OPEN_PROJECT ]
then
  echo -e "  - USER_OPEN_PROJECT=${USER_OPEN_PROJECT}"
elif [[ $USER_OPEN_PROJECT == "Y" || $USER_OPEN_PROJECT == "YES" || $USER_OPEN_PROJECT == "y" || $USER_OPEN_PROJECT == "yes" ]]
then
  echo -e "  - USER_OPEN_PROJECT=${USER_OPEN_PROJECT}"
else
  echo -e "  - USER_OPEN_PROJECT=${USER_OPEN_PROJECT}"
  echo -e "  - Don't open project."
  exit 0
fi
echo -e "\n"

echo -e "  - code $1"
code $1

exit 0
