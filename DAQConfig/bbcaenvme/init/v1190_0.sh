#!/bin/sh

cmd="../cmdvme/cmdvme"
BASEADDR=0x4000
opt=""


echo "load tdc setting ..."

# set geometry
#0x100E, read/write, D16
${cmd} $opt -ww ${BASEADDR}100e 20  #0-31
#N.B.: The VME std. versions(V1190 A/B) use this register ONLY for data identification during CBLT operation 
sleep 0



${cmd} $opt -ww ${BASEADDR}1014 1
sleep 0


${cmd} $opt -ww ${BASEADDR}1016 1
sleep 0


${cmd} $opt -ww ${BASEADDR}1000 0x0029  
sleep 1


${cmd} $opt -ww ${BASEADDR}100a 0
sleep 0


${cmd} $opt -ww ${BASEADDR}1022 5  #1-32735
sleep 1


echo "set trigger matting mode..."
${cmd} $opt -qn ${BASEADDR}0000 0x0000 
sleep 1
echo "done"

# Set Window Width (1=25ns, 16=400ns)
#Default setting: 0x14 -> 500 ns
# 10.5us = 10500ns = 420
# 15.5us = 15500ns = 620
# 40.5us = 15500ns = 1620
${cmd} $opt -qw ${BASEADDR}0000 0x1000 240
sleep 1

# Set Window Offset (-2048 to +40, 1=25ns, -4=-100ns)
#Default setting: 0xFFD8 -> -1 μs
# -4us  = -4000ns  = -160
# -10us = -10000ns = -400
# -15us = -15000ns = -600
# -40us = -15000ns = -1600
${cmd} $opt -qw ${BASEADDR}0000 0x1100 -248
sleep 1

# Set Edge Detection (1=trailing, 2=leading, 3=both)
${cmd} $opt -qw ${BASEADDR}0000 0x2200 2
sleep 1

${cmd} $opt -qw ${BASEADDR}0000 0x1200 8
sleep 1


${cmd} $opt -qw ${BASEADDR}0000 0x1300 4
sleep 1


${cmd} $opt -qn ${BASEADDR}0000 0x1400
sleep 1


${cmd} $opt -qn ${BASEADDR}0000 0x3000
sleep 0


${cmd} $opt -ww ${BASEADDR}1024 0x1



