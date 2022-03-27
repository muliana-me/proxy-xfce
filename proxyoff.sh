#!/bin/bash

if [[ $EUID > 0 ]]; then

echo "must be run as root or sudo"
exit 1

else

gsettings set org.gnome.system.proxy mode 'none';

grep PATH /etc/environment > a.t;
cat a.t > /etc/environment;
rm -rf a.t;

unset http_proxy;
unset https_proxy;
unset ftp_proxy;
unset HTTP_PROXY;
unset HTTPS_PROXY;
unset FTP_PROXY;

printf "" > /etc/apt/apt.conf.d/95proxies;

cat .gitconfig-default > .gitconfig;
rm -rf .gitconfig-default;

fi