#!/bin/sh

echo "ネットワーク設定実行中・・・しばらくお待ちください"
sudo ifup wlan0
sleep 2
sudo ifdown wlan0
sleep 1
sudo ifup wlan0
echo "ネットワーク設定　・・・完了"

echo "AP化しています・・・"
sudo systemctl start hostapd
sleep 1
sudo systemctl start isc-dhcp-server
sleep 5
sudo systemctl start isc-dhcp-server
echo "AP化　・・・成功"

echo "映像配信システム　起動します"
cd mjpg-streamer
cd mjpg-streamer-experimental
sh start.sh

