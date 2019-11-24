`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/29 12:52:08
// Design Name: 
// Module Name: chinal1_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module chinal1_tb();
reg clk;
reg rst_n;
reg [29:0]input_time=0;
//reg [44:0] max_viual=0;
//reg [44:0] abs_viual;
wire [9:0] max_time;
//reg [44:0] max1_viual=0;
//reg [44:0] abs1_viual;
wire [9:0] max1_time;
//reg [44:0] max2_viual=0;
//reg [44:0] abs2_viual;
wire [9:0] max2_time;
// wire [15:0] chinal2_out_data;
// wire [15:0] chinal1_out_data;
// wire [15:0] chinal3_out_data;
// wire [15:0] chinal4_out_data;
// // wire[15:0]chinal1_input_real;
// // wire[15:0] chinal2_input_real;
// // wire[15:0]chinal3_input_real;
// // wire[15:0] chinal4_input_real;
// wire chinal1_en;
// wire chinal2_en;
// wire chinal3_en;
// wire chinal4_en;
// wire[44:0] ifft1_output_img;
// wire[44:0] ifft1_output_real;
// wire[44:0] ifft2_output_img;
// wire[44:0] ifft2_output_real;
// wire[44:0] ifft3_output_img;
// wire[44:0] ifft3_output_real;
// wire[7:0]ifft1_tlast_cnt;
// wire[7:0]ifft2_tlast_cnt;
// wire[7:0]ifft3_tlast_cnt;
// wire[15:0] ifft1_output_tuser;
// wire[15:0] ifft2_output_tuser;
// wire[15:0] ifft3_output_tuser;
// wire[7:0] multipler_cnt_talst;
// wire[7:0] multipler1_cnt_talst;
// wire[7:0] multipler2_cnt_talst;
// wire[33:0]ifft1__input_real;
// wire[33:0]ifft1__input_imag;
// wire[33:0]ifft2__input_real;
// wire[33:0]ifft2__input_imag;
// wire[33:0]ifft3__input_real;
// wire[33:0]ifft3__input_imag;
// wire ifft1_output_tvalid;
// wire ifft2_output_tvalid;
// wire ifft3_output_tvalid;
// rom0 rom_0(
    // . clk(clk),
    // . rst_n(rst_n),
    // .  input_time(input_time),
	// . chinal1_begin(chinal1_en) ,	
	// . chinal2_begin(chinal2_en),
    // . chinal3_begin(chinal3_en) ,	
	// . chinal4_begin(chinal4_en),
    // . chinal1_out_data(chinal1_out_data),
    // . chinal2_out_data(chinal2_out_data),
	// . chinal3_out_data(chinal3_out_data),
    // . chinal4_out_data(chinal4_out_data)
    // );

// fft_to_multipler multipler0(
// .clk(clk),
// .rst_n(rst_n),
// .chinal1_input_real(chinal1_out_data),
// .chinal2_input_real(chinal2_out_data),
// .chinal3_input_real(chinal3_out_data),
// .chinal4_input_real(chinal4_out_data),
// .chinal1_en(chinal1_en),
// .chinal2_en(chinal2_en),
// .chinal3_en(chinal3_en),
// .chinal4_en(chinal4_en),
// .ifft1_output_img (ifft1_output_img ),
// .ifft1_output_real(ifft1_output_real),
// .ifft2_output_img (ifft2_output_img ),
// .ifft2_output_real(ifft2_output_real),
// .ifft3_output_img (ifft3_output_img ),
// .ifft3_output_real(ifft3_output_real),
// .ifft1_tlast_cnt(ifft1_tlast_cnt),
// .ifft2_tlast_cnt(ifft2_tlast_cnt),
// .ifft3_tlast_cnt(ifft3_tlast_cnt),
// . ifft1_output_tuser(ifft1_output_tuser),
// . ifft2_output_tuser(ifft2_output_tuser),
// . ifft3_output_tuser(ifft3_output_tuser),
// . multipler_cnt_talst (multipler_cnt_talst ),
// . multipler1_cnt_talst(multipler1_cnt_talst),
// . multipler2_cnt_talst(multipler2_cnt_talst),
// .ifft1__input_real(ifft1__input_real),
// .ifft1__input_imag(ifft1__input_imag),
// .ifft2__input_real(ifft2__input_real),
// .ifft2__input_imag(ifft2__input_imag),
// .ifft3__input_real(ifft3__input_real),
// .ifft3__input_imag(ifft3__input_imag),
// .ifft1_output_tvalid(ifft1_output_tvalid),
// .ifft2_output_tvalid(ifft2_output_tvalid),
// .ifft3_output_tvalid(ifft3_output_tvalid),
// . ifft_data_tlast(ifft_data_tlast),
// . ifft1_data_tlast(ifft1_data_tlast),
// . ifft2_data_tlast(ifft2_data_tlast)
    // );
	
pl_top  pl0(
.clk(clk),
.rst_n(rst_n),
.input_time(input_time),
.chinal1_time(max_time),
.chinal2_time(max1_time),
.chinal3_time(max2_time)
    );

 integer n=0;
  integer n1=0;
   integer n2=0;
initial begin
	clk = 0;
	rst_n = 0;	
#60 rst_n=1;
input_time={10'd683,10'd683,10'd721};
// i<=1;
#110000;
// $fclose(w1_file);
// $fclose(w2_file);
// $fclose(w3_file);
// $fclose(w4_file);
#1000;
$stop;
end

 always #10 clk = ~clk;







// //取abs
// always@(posedge clk or negedge rst_n)
// if((ifft1_tlast_cnt==1)||(ifft1_tlast_cnt==0))//&&(ifft1_output_real[44]==0)
// begin
// case(ifft1_output_real[44])
// 1'b0:abs_viual<=ifft1_output_real;
// 1'b1:abs_viual<=(~ifft1_output_real+35'd1);//负数归0
// endcase

// end

// always@(posedge clk or negedge rst_n)
// if((ifft2_tlast_cnt==1)||(ifft2_tlast_cnt==0))//&&(ifft1_output_real[44]==0)
// begin
// case(ifft2_output_real[44])
// 1'b0:abs1_viual<=ifft2_output_real;
// 1'b1:abs1_viual<=(~ifft2_output_real+35'd1);//负数归0
// endcase

// end

// always@(posedge clk or negedge rst_n)
// if((ifft3_tlast_cnt==1)||(ifft3_tlast_cnt==0))//&&(ifft1_output_real[44]==0)
// begin
// case(ifft3_output_real[44])
// 1'b0:abs2_viual<=ifft3_output_real;
// 1'b1:abs2_viual<=(~ifft3_output_real+35'd1);//负数归0
// endcase

// end

// // ////////找最大值////


// always@(posedge clk)
// if((n<4095)&&(!ifft_data_tlast))
// begin
// n <=n+1;
 // if(((ifft1_tlast_cnt==1)||(ifft1_tlast_cnt==0))&&(max_viual<abs_viual))//&&(ifft1_output_real[44]==0)
 // begin
// max_viual<=abs_viual;
// max_time<=n;
// end

// else begin
// max_viual<=max_viual;
// max_time<=max_time;
    // end
// end
// else begin
// max_time<=0;
// max_viual<=0;
// n<=0;
// end

// always@(posedge clk)
// if((n1<4095)&&(!ifft1_data_tlast))
// begin
// n1 <=n1+1;
 // if(((ifft2_tlast_cnt==1)||(ifft2_tlast_cnt==0))&&(max1_viual<abs1_viual))//&&(ifft1_output_real[44]==0)
 // begin
// max1_viual<=abs1_viual;
// max1_time<=n1;
// end

// else begin
// max1_viual<=max1_viual;
// max1_time<=max1_time;
    // end
// end
// else begin
// max1_time<=0;
// max1_viual<=0;
// n1<=0;
// end

// always@(posedge clk)
// if((n2<4095)&&(!ifft2_data_tlast))
// begin
// n2 <=n2+1;
 // if(((ifft3_tlast_cnt==1)||(ifft3_tlast_cnt==0))&&(max2_viual<abs2_viual))//&&(ifft1_output_real[44]==0)
 // begin
// max2_viual<=abs2_viual;
// max2_time<=n2;
// end

// else begin
// max2_viual<=max2_viual;
// max2_time<=max2_time;
    // end
// end
// else begin
// max2_time<=0;
// max2_viual<=0;
// n2<=0;
// end

endmodule
