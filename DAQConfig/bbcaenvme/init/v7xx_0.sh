#!/bin/sh
cmd="../cmdvme/cmdvme"
BASEADDR=0x1000

###用户可能需要修改的参数为BASEADDR/GEO,阈值设置在pedo文件

## GEO
${cmd} -ww ${BASEADDR}1002 0  # 0-31


${cmd} -ww ${BASEADDR}1006 0x80 
${cmd} -ww ${BASEADDR}1008 0x80
${cmd} -ww ${BASEADDR}1010 0x24

# MCST/CBLT control 
# 0x0 DISABLE
# 0x1 LAST BOARD
# 0x2 FIRST BOARD
# 0x3 MID BOARD
${cmd} -ww ${BASEADDR}101a 0x1



#0x1032 Bit Set 2 Register
#0x1034 Bit Clear 2 Register
# OVER RANGE SUPPERSSION DISABLE : all the data are written into the output buffer
# STEP TH =2 / Another option is 16
# x2 0-510    x16 0-4080
${cmd} -ww ${BASEADDR}1032 0x108

# LOW THRESHOLD enable
${cmd} -ww ${BASEADDR}1034 0x10


${cmd} -ww ${BASEADDR}1032 0x1000

####################################

${cmd} -ww ${BASEADDR}1080	0x00
${cmd} -ww ${BASEADDR}1082	0x00
${cmd} -ww ${BASEADDR}1084	0x00
${cmd} -ww ${BASEADDR}1086	0x00
${cmd} -ww ${BASEADDR}1088	0x00
${cmd} -ww ${BASEADDR}108a	0x00
${cmd} -ww ${BASEADDR}108c	0x00
${cmd} -ww ${BASEADDR}108e	0x00
${cmd} -ww ${BASEADDR}1090	0x00
${cmd} -ww ${BASEADDR}1092	0x00
${cmd} -ww ${BASEADDR}1094	0x00
${cmd} -ww ${BASEADDR}1096	0x00
${cmd} -ww ${BASEADDR}1098	0x00
${cmd} -ww ${BASEADDR}109a	0x00
${cmd} -ww ${BASEADDR}109c	0x00
${cmd} -ww ${BASEADDR}109e	0x00
${cmd} -ww ${BASEADDR}10a0	0x00
${cmd} -ww ${BASEADDR}10a2	0x00
${cmd} -ww ${BASEADDR}10a4	0x00
${cmd} -ww ${BASEADDR}10a6	0x00
${cmd} -ww ${BASEADDR}10a8	0x00
${cmd} -ww ${BASEADDR}10aa	0x00
${cmd} -ww ${BASEADDR}10ac	0x00
${cmd} -ww ${BASEADDR}10ae	0x00
${cmd} -ww ${BASEADDR}10b0	0x00
${cmd} -ww ${BASEADDR}10b2	0x00
${cmd} -ww ${BASEADDR}10b4	0x00
${cmd} -ww ${BASEADDR}10b6	0x00
${cmd} -ww ${BASEADDR}10b8	0x00
${cmd} -ww ${BASEADDR}10ba	0x00
${cmd} -ww ${BASEADDR}10bc	0x00
${cmd} -ww ${BASEADDR}10be	0x00



#-------------------------------------------------------------------------------

## V792
#0x1060 read/write /  Iped Register
#This register allows to program on 8 bits the $I_{1}$ current to set the QDC pedestal(common for all channels). 
#${cmd} -ww ${BASEADDR}1060  180  #60-255 参数与Iped(uA)对应关系查表

#-------------------------------------------------------------------------------

## V775
# 0x1060, read/write / Full Scale Range register
# A write access to this register allows the User to select the Full Scale Range from 140 ns (35 ps LSB) to 1200 ns (300 ps LSB) with 8 bit resolution.
# The 0xFF value corresponds to 35 ps LSB while the 0x1E value correspond to 300 ps LSB with a non-linear interpolation for intermediate values; the LSB is given by the formula:
# T_{LSB} = 8.9(ns) / N
# The LSB is proportional to 1/N, where N is the Full Scale Range register content, because it is inversely to the current to be integrated.
# If N (counts) = 0xFF, TLSB is 35 ps (FSR = 0.143 µs);
# If N (counts) ounts = 0x1E TLSB is 297 ps (FSR = 1.21 µs);
# It is recommended not to set the Full Scale Range register with values smaller than 0x18.
#${cmd} -ww ${BASEADDR}1060  180    #24-255 参数与LSB对应关系可自行计算或者查图

#Allows to select Common Start or Common Stop mode.
#${cmd} -ww ${BASEADDR}1032 0x400  #Common Stop mode
#${cmd} -ww ${BASEADDR}1034 0x400  #Common Start mode
