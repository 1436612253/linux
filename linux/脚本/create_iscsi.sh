#!/bin/bash
#this is install and set targetd
store="/dev/"  #add dev down iscsi dev
ip_server="192.168.4.10" #set ip
host=`hostname`
setdate=`date +%Y-%m`  ##get system date





if [ -n "$1" ]
then
read -p "请输入你要使用作为iscsi分区 && 磁盘" store
read -p "请输入你要共享的ip输入1为使用默认网卡ip" ip_server
read -p "请输入你的主机名输入1为默认主机名" host
fi
if [ ip_server -eq  1 ]
then
ip_server=ifconfig |sed -n '2p' |awk '{print $2}'
fi
if [ $host -eq 1 ]
then
host=`hostname`
fi
yok=`yum list |grep targetcli |wc -l`  #see yum in targetd return 0 && other
if [ $yok -ne 0  ] ;then
yum -y install targetcli
else
echo "yum not targetcli package"
exit 1
fi
sleep 1    #wait for install targetd
echo "
backstores/block create iscsi_store $store
iscsi/ create iqn.${setdate}.con.server:ser
iscsi/iqn.${setdate}.con.server:ser/tpg1/luns create /backstores/block/iscsi_store
iscsi/iqn.${setdate}.con.server:ser/tpg1/acls create iqn.${setdate}.com.cliet:${host}
iscsi/iqn.${setdate}.con.server:ser/tpg1/portals/ delete 0.0.0.0 3260
iscsi/iqn.${setdate}.con.server:ser/tpg1/portals/ create $ip_server
" > .install.tar    #add iscsi the file
targetcli < .install.tar  #set iscsi
rm -f .install.tar

