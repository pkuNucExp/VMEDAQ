#!/bin/sh
cmd="../cmdvme/cmdvme"
BASEADDR=0x2000


${cmd} -ww ${BASEADDR}6008 0x1
${cmd} -ww ${BASEADDR}603A 0


# GEO 
${cmd} -ww ${BASEADDR}6004 10  #0-31

# Input Range 
# 0 -> 4V (default)
# 1 -> 10V
# 2 -> 8V
${cmd} -ww ${BASEADDR}6060 2


${cmd} -ww ${BASEADDR}6038 0


# ADC RESOLUTION
#    0 -> 2k (800ns convesion time)
#    1 -> 4k (1.6us conversion time)
#    2 -> 4k hires (3.2us conversion time)
#    3 -> 8k (6.4us conversion time)
#    4 -> 8k hires (12.5us conv. Time)
${cmd} -ww ${BASEADDR}6042 4


# enable/disbale thresholds
# 0 enable (default)
# 1 disbale  ->  threshold settings at 0x4000.. are ignored (assumed as 0)
${cmd} -ww ${BASEADDR}604C 0


# set multi event register
# bit [1..0] 
# 0(default), no multievent buffering, deny all gate signal until 0x6034 clears event
# 1, no berr signal
# 3, multievent buffering, after the number of readout words exceeds the number specified by 0x601A, the next end of event mark terminates transfer by emitting BERR.
# bit [2] 1: EOB 0: BERR(default)
${cmd} -ww ${BASEADDR}6036 0x3


${cmd} -ww ${BASEADDR}601A 0x1

${cmd} -ww ${BASEADDR}6010 0x0

# --------------------------------------------------------------------------

# Lower threshold
${cmd} -ww ${BASEADDR}4000 0
${cmd} -ww ${BASEADDR}4002 0
${cmd} -ww ${BASEADDR}4004 0
${cmd} -ww ${BASEADDR}4006 0
${cmd} -ww ${BASEADDR}4008 0
${cmd} -ww ${BASEADDR}400a 0
${cmd} -ww ${BASEADDR}400c 0
${cmd} -ww ${BASEADDR}400e 0
${cmd} -ww ${BASEADDR}4010 0
${cmd} -ww ${BASEADDR}4012 0
${cmd} -ww ${BASEADDR}4014 0
${cmd} -ww ${BASEADDR}4016 0
${cmd} -ww ${BASEADDR}4018 0
${cmd} -ww ${BASEADDR}401a 0
${cmd} -ww ${BASEADDR}401c 0
${cmd} -ww ${BASEADDR}401e 0
${cmd} -ww ${BASEADDR}4020 0
${cmd} -ww ${BASEADDR}4022 0
${cmd} -ww ${BASEADDR}4024 0
${cmd} -ww ${BASEADDR}4026 0
${cmd} -ww ${BASEADDR}4028 0
${cmd} -ww ${BASEADDR}402a 0
${cmd} -ww ${BASEADDR}402c 0
${cmd} -ww ${BASEADDR}402e 0
${cmd} -ww ${BASEADDR}4030 0
${cmd} -ww ${BASEADDR}4032 0
${cmd} -ww ${BASEADDR}4034 0
${cmd} -ww ${BASEADDR}4036 0
${cmd} -ww ${BASEADDR}4038 0
${cmd} -ww ${BASEADDR}403a 0
${cmd} -ww ${BASEADDR}403c 0
${cmd} -ww ${BASEADDR}403e 0
