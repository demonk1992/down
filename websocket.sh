#!/bin/bash
cleae
echo Installing Websocket-SSH AUTOSCRIPT BY HABLESSH
sleep 1
echo Cek Hak Akses...
sleep 0.5
cd
#Install system auto run
wget -O /etc/systemd/system/ws-ssh.service https://raw.githubusercontent.com/Aantonberkentod/AutoScriptSSH/main/ws-ssh.service && chmod +x /etc/systemd/system/ws-ssh.service
wget -O /etc/systemd/system/ws-ovpn.service https://raw.githubusercontent.com/Aantonberkentod/AutoScriptSSH/834e18746c6a3d822aef0a65cc9f3ec470bb6e52/ws-ovpn.service && chmod +x /etc/systemd/system/ws-ovpn.service
#Install Websocket-SSH

wget -O /usr/local/bin/ws-ssh https://raw.githubusercontent.com/Aantonberkentod/AutoScriptSSH/main/ws-ssh && chmod +x /usr/local/bin/ws-ssh
wget -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/Aantonberkentod/AutoScriptSSH/main/ws-ovpn && chmod +x /usr/local/bin/ws-ovpn

#Enable & Start ws-ssh service
systemctl enable ws-ssh.service
systemctl start ws-ssh.service

#Enable & Start ws-ovpn service
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service
