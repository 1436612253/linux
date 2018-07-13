#!/bin/bash
#input ip sername and setdate
#see server configure input 
serip="";
serhost="";
setdate="";
yum_ok=`yum list | grep iscsi-initiator-utils.i686`  #install iscsi_client
if [ $yum_ok -ne 0 ]
then
yum -y install iscsi-initiator-utils.i686
else
echo "in yum not iscsi-initiator-utils.i686"
fi
echo "InitiatorName=iqn.${setdate}.com.cliet:${serverhost}" > /etc/iscsi/initiatorname.iscsi
systemctl restart iscsid
systemctl enable iscsid
iscsiadm --mode discoverydb --type sendtargets --portal $serhost --discover 
systemctl restart iscsi
