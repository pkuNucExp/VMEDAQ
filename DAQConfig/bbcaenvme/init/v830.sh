#!/bin/sh
cmd="../cmdvme/cmdvme"
BASEADDR=0x5000

echo "V830 /"
# Scaler GEO address 
${cmd} -ww ${BASEADDR}1110 30



${cmd} -ww ${BASEADDR}1122 0x1 


${cmd} -ww ${BASEADDR}110c 0x11
${cmd} -ww ${BASEADDR}110a 0x01


#Set enable channel  这里设置开启路数
${cmd} -lw ${BASEADDR}1100 0x000000ff


${cmd} -ww ${BASEADDR}110a 0x30
