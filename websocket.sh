#!/bin/bash
cleae
echo Installing Websocket-SSH-OPENVPN
sleep 1
echo Cek Hak Akses...
sleep 0.5
cd
#Install system auto run
wget -O /etc/systemd/system/xws-ssh.service "https://raw.githubusercontent.com/demonk1992/down/main/xws-ssh.service"
chmod +x /etc/systemd/system/xws-ssh.service
# Ws-ovpn.service
wget -O /etc/systemd/system/ws-ovpn.service "https://raw.githubusercontent.com/demonk1992/down/main/ws-ovpn.service"
chmod +x /etc/systemd/system/ws-ovpn.service
#Install Websocket-SSH

wget -O /usr/local/bin/ws-ssh "https://raw.githubusercontent.com/demonk1992/down/main/ws-ssh"
chmod +x /usr/local/bin/ws-ssh
wget -O /usr/local/bin/ws-ovpn "https://raw.githubusercontent.com/demonk1992/down/main/ws-ovpn"
chmod +x /usr/local/bin/ws-ovpn

#Enable & Start ws-ssh service
systemctl enable ws-ssh.service
systemctl start ws-ssh.service

#Enable & Start ws-ovpn service
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service
