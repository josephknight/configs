#!/bin/bash
cp .bashrc .bashrc-preconfigs-backup
mkdir ~/jk-configs-tmp
git clone --no-checkout https://github.com/josephknight/configs.git ~/jk-configs-tmp
mv ~/jk-configs-tmp/.git/ ~/
rmdir jk-configs-tmp/
cd ~
git reset --hard HEAD
ls -a

