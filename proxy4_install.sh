#!/bin/bash
clear
tput setaf 3 ; tput bold ; printf '%5s%s%-20s\n' "Créditos: @oKRATOS" ; tput sgr0
echo -e "\033[1;31m≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥\033[0m"
tput setaf 7 ; tput smul ; tput bold ; printf '%35s%s%-20s\n' "Update proxy port" ; tput sgr0
echo -e "\033[1;31m≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤≤\033[0m"
	echo ""
	echo "Este script irá mudar a porta 8080 do dropbear para um proxy em node"
	echo ""
	read -p "Continuar com a instalação? [s/n]: " -e -i s resposta
	if [[ "$resposta" = 's' ]]; then
 echo ""
 sleep 2;
 echo "Iniciando instalação" 
 echo "" 
# clear;
echo "Atualizando portas Dropbear...";
sleep 2;
porta=8000;
sed -i "s/DROPBEAR_PORT=8080/DROPBEAR_PORT=$porta/g" /etc/default/dropbear >/dev/null 2>&1
sed -i 's/-p 8000 -p 7777/-p 7777/g' /etc/default/dropbear >/dev/null 2>&1
service dropbear restart;
sleep 2;
#clear;
    cd /root;
    rm -rf proxy3.js;
echo "Atualizando porta do proxy atual...";
sleep 2;
	wget https://raw.githubusercontent.com/KRATOSvpn/update-proxy/main/proxy3.js && chmod +x proxy3.js;
	clear;
echo "Instalando novo proxy...";
sleep 2;
	wget https://github.com/CassianoDev/sshProxy/releases/download/v1.1/sshProxy_linux_amd64 && mv sshProxy_linux_amd64 sshProxy && chmod +x sshProxy && ./sshProxy -addr :8080 -dstAddr 127.0.0.1:22
	clear;
	echo "#!/bin/bash" > /etc/autostart
	echo "clear" >> /etc/autostart
	echo "#INICIO AUTOMATICO" >> /etc/autostart
	echo "netstat -tlpn | grep -w 80 > /dev/null || screen -dmS nodews node /root/proxy3.js" >> /etc/autostart
	echo "netstat -tlpn | grep -w 8080 > /dev/null || screen -S proxy -dm ./sshProxy -addr :8080 -custom_handshake "200 " -dstAddr 127.0.0.1:22" >> /etc/autostart
    rm -rf proxy4_install.sh;
    pkill screen && /etc/autostart
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-20s\n' "Proxy instalado!" ; tput sgr0


echo "FIM!";
sleep 2;
fi
exit
