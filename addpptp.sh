#!/bin/bash
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
PUBLIC_IP=$(wget -qO- ipv4.icanhazip.com);
else
PUBLIC_IP=$IP
fi
until [[ $VPN_USER =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		echo "Checking Vps"                                                                                   
                curl -o.html https://icanhazip.com                                                                    
                sleep 0.5
                clear
                read -rp "Username: " -e VPN_USER
		CLIENT_EXISTS=$(grep -w $VPN_USER /var/lib/premium-script/data-user-pptp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "Akun sudah ada, silahkan masukkan password lain."
			exit 1
		fi
	done
read -p "Password: " VPN_PASSWORD
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
clear

# Add or update VPN user
cat >> /etc/ppp/chap-secrets <<EOF
"$VPN_USER" pptpd "$VPN_PASSWORD" *
EOF

# Update file attributes
chmod 600 /etc/ppp/chap-secrets*
echo -e "### $VPN_USER $exp">>"/var/lib/premium-script/data-user-pptp"
cat <<EOF

INFORMASI AKUN PPTP
================================
PPTP VPN

Server IP    : $PUBLIC_IP
Host         : $domain
Username     : $VPN_USER
Password     : $VPN_PASSWORD
Expired On   : $exp

By Haweng
=================================
EOF
