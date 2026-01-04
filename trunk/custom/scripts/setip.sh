#!/bin/sh
lanip=$1
defaultfile=$2
dicfile=$3
oc1=${lanip%%.*}
x=${lanip#*.*}
oc2=${x%%.*}
x=${x#*.*}
oc3=${x%%.*}
dhcpfrom=$oc1"."$oc2"."$oc3".2"
dhcpto=$oc1"."$oc2"."$oc3".254"
sed -i "s/\"192.168.0.1\"/\"$lanip\"/g" $defaultfile
sed -i "s/\"192.168.0.2\"/\"$dhcpfrom\"/g" $defaultfile
sed -i "s/\"192.168.2.254\"/\"$dhcpto\"/g" $defaultfile
sed -i "s/192.168.0.1/$lanip/" $dicfile
