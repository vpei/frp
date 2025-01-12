#!/bin/bash

OS_type="$(uname -m)"
case "$OS_type" in
  x86_64|amd64)
    OS_type='amd64'
    ;;
  i?86|x86)
    OS_type='386'
    ;;
  aarch64|arm64)
    OS_type='arm64'
    ;;
  arm*)
    OS_type='arm'
    ;;
  *)
    echo 'OS type not supported'
    exit 2
    ;;
esac

echo $OS_type
frp_ver='0.51.3'
echo $frp_ver

download_link="https://ghproxy.com/https://github.com/fatedier/frp/releases/download/v${frp_ver}/frp_${frp_ver}_linux_${OS_type}.tar.gz"

# wget "$download_link" -O frp.zip && unzip -d /frp/ frp.zip && rm -rf /frp.zip && mv /frp/frpc /usr/bin/frpc && rm -rf /frp/ && chmod 0777 /usr/bin/frpc
cd / && wget "$download_link" -O frp.tar.gz && tar -xf frp.tar.gz && rm -rf /frp.tar.gz && mv /frp_${frp_ver}_linux_${OS_type}/frpc /usr/bin/frpc && rm -rf /frp_${frp_ver}_linux_${OS_type}/ && chmod 0777 /usr/bin/frpc

/usr/bin/frpc -c /etc/frp/frpc.ini
