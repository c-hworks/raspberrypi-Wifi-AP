#!/bin/sh/
echo "これから映像配信システムのインストールを開始します"
echo "キャンセルするには１０秒以内にCtrlとCキーを押してください"
sleep 10
cd ~
mkdir mjpg-streamer
cd mjpg-streamer
sudo apt-get install subversion libjpeg-dev imagemagick
svn co https://mjpg-streamer.svn.sourceforge.net/svnroot/mjpg-streamer mjpg-streamer
cd mjpg-streamer/mjpg-streamer
make
sudo make install
echo "インストール完了"

read -p "配信ソフトを起動しますか? (y/N): " yn
case "$yn" in [yY]*) ;; *) echo "何もしません." ; exit ;; esac

sh server.sh

