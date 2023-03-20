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
	read -p "Continuar com a instalação? [s/n]: " -e -i s resposta
	if [[ "$resposta" = 's' ]]; then
 echo ""
 sleep 5;
 echo "Iniciando instalação" 
 echo "" 
# clear;
echo "Atualizando portas Dropbear...";
sleep 5;
porta=8000;
sed -i "s/DROPBEAR_PORT=8080/DROPBEAR_PORT=$porta/g" /etc/default/dropbear >/dev/null 2>&1
sed -i 's/-p 8000 -p 7777/-p 7777/g' /etc/default/dropbear >/dev/null 2>&1
service dropbear restart;
sleep 5;
#clear;
    cd /root;
    rm -rf proxy3.js;
echo "Atualizando porta do proxy atual...";
sleep 2;
	wget https://raw.githubusercontent.com/KRATOSvpn/update-proxy/main/proxy3.js && chmod +x proxy3.js;
	clear;
echo "Instalando novo proxy...";
sleep 2;
	wget https://raw.githubusercontent.com/KRATOSvpn/update-proxy/main/proxy4.js && chmod +x proxy4.js;
	clear;
	echo "netstat -tlpn | grep -w 8080 > /dev/null || screen -dmS nodews node /root/proxy4.js" >> /etc/autostart
    rm -rf proxy4_install.sh;
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-20s\n' "Proxy instalado!" ; tput sgr0


echo "FIM!";
sleep 2;
fi
exit
