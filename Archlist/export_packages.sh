#!/bin/bash

pacman -Qqen > pacman.list
yay -Qqem > aur.list

echo "备份软件包信息完成"
