#!/bin/bash
webname="";
echo "
options {
        directory       "/var/named";
};
zone "${webname}." IN {
        type master;
        file "${webname}.zone";
};
" > /etc/named.cnf
echo "
$TTL 1D
@       IN SOA  @ rname.invalid. (
                                        0       ; serial
                                        1D      ; refresh
                                        1H      ; retry
                                        1W      ; expire
                                        3H )    ; minimum
haha.com.       NS      ser
ser     A       192.168.4.10
*       A       192.168.4.20

" > /var/named/${webname}.zone
chown named:named /var/named/${webname}.zone  # user and group to named
