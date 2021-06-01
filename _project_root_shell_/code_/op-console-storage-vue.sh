#!/bin/bash
#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# $0 是命令行里面的执行文件 
# ${BASH_SOURCE} 才是当前执行文件

filename=`basename $BASH_SOURCE .sh`
echo -e "filename=${filename}"
echo -e bash code_.sh ${filename}
bash code_.sh ${filename}

exit 0
