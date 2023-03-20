#!/bin/bash
clear
tput setaf 3 ; tput bold ; printf '%5s%s%-20s\n' "Créditos: @oKRATOS" ; tput sgr0
echo -e "\033[1;31m≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥\033[0m"
tput setaf 7 ; tput smul ; tput bold ; printf '%35s%s%-20s\n' "Update proxy port" ; tput sgr0
echo -e "\033[1;31m≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤\033[0m"
	echo ""
	echo "Este é um script experimental. Use por sua conta e risco!"
	echo "Este script irá mudar a porta 8080 do dropbear para um proxy em node"
	echo "este script só funciona caso voce ja tenha baixado as dependencias do node"
	echo ""
	read -p "Continuar com a instalação? [s/n]: " -e -i n resposta
	if [[ "$resposta" = 's' ]]; then
 echo ""
 apt update -y && apt upgrade -y;
 sleep 5;
 echo "Iniciando instalação" 
 echo "" 
 clear;
echo "Atualizando portas Dropbear...";
sleep 5;
porta=8000;
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear >/dev/null 2>&1
sed -i "s/DROPBEAR_PORT=22/DROPBEAR_PORT=$porta/g" /etc/default/dropbear >/dev/null 2>&1
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 7777"/g' /etc/default/dropbear >/dev/null 2>&1
sed -i 's/DROPBEAR_BANNER=""//g' /etc/default/dropbear >/dev/null 2>&1
sed -i "$ a DROPBEAR_BANNER=\"/etc/bannerssh\"" /etc/default/dropbear;
grep -v "^PasswordAuthentication yes" /etc/ssh/sshd_config >/tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >>/etc/ssh/sshd_config
grep -v "^PermitTunnel yes" /etc/ssh/sshd_config >/tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
echo "PermitTunnel yes" >>/etc/ssh/sshd_config
echo "/bin/false" >>/etc/shells
service dropbear restart;
sleep 5;
clear;
    cd /root;
    rm -rf proxy3.js;
	wget https://raw.githubusercontent.com/KRATOSvpn/update-proxy/main/proxy3.js && chmod +x proxy3.js;
	wget https://raw.githubusercontent.com/KRATOSvpn/update-proxy/main/proxy4.js && chmod +x proxy4.js;
	echo "netstat -tlpn | grep -w 8080 > /dev/null || screen -dmS nodews node /root/proxy4.js" >> /etc/autostart
    rm -rf proxy4_install.sh;
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-20s\n' "Proxy instalado!" ; tput sgr0


echo "FIM!";
sleep 5;
fi
exit
