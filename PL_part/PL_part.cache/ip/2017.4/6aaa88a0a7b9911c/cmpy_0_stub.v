// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Nov 20 00:41:42 2019
// Host        : DESKTOP-CH10RHM running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cmpy_0_stub.v
// Design      : cmpy_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "cmpy_v6_0_14,Vivado 2017.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(aclk, aresetn, s_axis_a_tvalid, s_axis_a_tuser, 
  s_axis_a_tlast, s_axis_a_tdata, s_axis_b_tvalid, s_axis_b_tuser, s_axis_b_tlast, 
  s_axis_b_tdata, m_axis_dout_tvalid, m_axis_dout_tuser, m_axis_dout_tlast, 
  m_axis_dout_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_a_tvalid,s_axis_a_tuser[15:0],s_axis_a_tlast,s_axis_a_tdata[63:0],s_axis_b_tvalid,s_axis_b_tuser[15:0],s_axis_b_tlast,s_axis_b_tdata[63:0],m_axis_dout_tvalid,m_axis_dout_tuser[31:0],m_axis_dout_tlast,m_axis_dout_tdata[111:0]" */;
  input aclk;
  input aresetn;
  input s_axis_a_tvalid;
  input [15:0]s_axis_a_tuser;
  input s_axis_a_tlast;
  input [63:0]s_axis_a_tdata;
  input s_axis_b_tvalid;
  input [15:0]s_axis_b_tuser;
  input s_axis_b_tlast;
  input [63:0]s_axis_b_tdata;
  output m_axis_dout_tvalid;
  output [31:0]m_axis_dout_tuser;
  output m_axis_dout_tlast;
  output [111:0]m_axis_dout_tdata;
endmodule
