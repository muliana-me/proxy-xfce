#!/bin/bash

if [[ $EUID > 0 ]]; then

echo "must be run as root or sudo."
exit 1

fi

if [ $# -ne 2 ]; then

echo -e "need 2 arguments. \n$ sudo ./proxyon.sh host port"
exit 1

else

gsettings set org.gnome.system.proxy mode 'manual';
gsettings set org.gnome.system.proxy.http host \'$1\';
gsettings set org.gnome.system.proxy.http port $2;

grep PATH /etc/environment > a.t;

printf \
"http_proxy=http://$1:$2/
https_proxy=http://$1:$2/
ftp_proxy=http://$1:$2/
no_proxy=\"localhost,127.0.0.1,localaddress,.localdomain.com\"
HTTP_PROXY=http://$1:$2/
HTTPS_PROXY=http://$1:$2/
FTP_PROXY=http://$1:$2/
NO_PROXY=\"localhost,127.0.0.1,localaddress,.localdomain.com\"" >> a.t;

cat a.t > /etc/environment;
rm -rf a.t;

if [[ ! -e /etc/apt/apt.conf.d/95proxies ]]; then
	touch /etc/apt/apt.conf.d/95proxies
fi

printf \
"Acquire::http::proxy \"http://$1:$2/\";
Acquire::ftp::proxy \"ftp://$1:$2/\";
Acquire::https::proxy \"https://$1:$2/\";" > /etc/apt/apt.conf.d/95proxies;

cat .gitconfig > .gitconfig-default;
cat .gitconfig > b.t;

printf \
"[http]
\tproxy = http://$1:$2
[https]
\tproxy = https://$1:$2
[credential]
\thelper = cache --timeout=86400
" >> b.t;

cat b.t > .gitconfig;
rm -rf b.t;

fi