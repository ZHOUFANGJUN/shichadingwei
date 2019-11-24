onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Ifft_1 -L xbip_utils_v3_0_8 -L axi_utils_v2_0_4 -L c_reg_fd_v12_0_4 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_4 -L xbip_dsp48_addsub_v3_0_4 -L xbip_addsub_v3_0_4 -L c_addsub_v12_0_11 -L c_mux_bit_v12_0_4 -L c_shift_ram_v12_0_11 -L xbip_bram18k_v3_0_4 -L mult_gen_v12_0_13 -L cmpy_v6_0_14 -L floating_point_v7_0_14 -L xfft_v9_0_14 -L xil_defaultlib -L secureip -O5 xil_defaultlib.Ifft_1

do {wave.do}

view wave
view structure

do {Ifft_1.udo}

run -all

endsim

quit -force
