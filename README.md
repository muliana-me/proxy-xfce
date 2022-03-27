# Custom Proxy For Xfce Environment
System-wide proxies in *Xfce* must be set via environment variables, with this script you dont need to change them manually. This script will change all proxy settings in `org.gnome.system.proxy` `/etc/environment` `/etc/apt/apt.conf.d/95proxies` and `.gitconfig` file.

> This script only works for *Xfce* environment.

## Requirements
* [Git](https://git-scm.com/downloads)

## Installation
Make sure you have [Git](https://git-scm.com/downloads) installed.
```
$ git clone https://github.com/muliana-me/proxy-xfce
$ cd proxy-xfce
$ chmod +x proxyon.sh proxyoff.sh
```

## How To Use
**Turn On**
```
$ cd proxy-xfce
$ sudo ./proxyon.sh host port
Reboot your system
```
*Example*
```
$ sudo ./proxyon.sh 169.254.1.1 8080
OR
$ sudo ./proxyon.sh myproxy.server.com 8080
```
**Turn Off**
```
$ cd proxy-xfce
$ sudo ./proxyoff.sh
Reboot your system
```

> `/etc/environment` file requires a reboot to reload. Reboot after using the script to make sure the changes take effect.