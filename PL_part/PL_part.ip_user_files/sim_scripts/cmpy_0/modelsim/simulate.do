onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xbip_utils_v3_0_8 -L axi_utils_v2_0_4 -L xbip_pipe_v3_0_4 -L xbip_bram18k_v3_0_4 -L mult_gen_v12_0_13 -L cmpy_v6_0_14 -L xil_defaultlib -L secureip -lib xil_defaultlib xil_defaultlib.cmpy_0

do {wave.do}

view wave
view structure
view signals

do {cmpy_0.udo}

run -all

quit -force
