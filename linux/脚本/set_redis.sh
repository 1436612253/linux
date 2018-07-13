#!/bin/bash
port=6530  #set port

sed  -i '/^port/c port $port ' /etc/redis/6379.conf  #set port
sed -n '/; extension_dir = ".\/"/ c  ; extension_dir = "$path"' php.ini 
iqn.2018-07.com.cliet:localhost.localdomain
