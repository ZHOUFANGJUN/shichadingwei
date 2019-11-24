`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/20 15:27:56
// Design Name: 
// Module Name: pl_top
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


module pl_top(
input clk,
input rst_n,
input [29:0]input_time,
output reg [9:0]chinal1_time,
output reg [9:0] chinal2_time,
output reg [9:0] chinal3_time
    );
reg [44:0] max_viual=0;
reg [44:0] abs_viual;
reg [9:0] max_time=0;
reg [44:0] max1_viual=0;
reg [44:0] abs1_viual=0;
reg [9:0] max1_time=0;
reg [44:0] max2_viual=0;
reg [44:0] abs2_viual=0;
reg [9:0] max2_time=0;
wire [15:0] chinal2_out_data;
wire [15:0] chinal1_out_data;
wire chinal1_en;
wire chinal2_en;
wire[44:0] ifft1_output_img;
wire[44:0] ifft1_output_real;
wire[7:0]ifft_tlast_cnt;
wire[15:0] ifft1_output_tuser;
wire[7:0] multipler_cnt_talst;
wire[33:0]ifft1__input_real;
wire[33:0]ifft1__input_imag;
wire ifft1_output_tvalid;	
	
rom0 rom_0(
    . clk(clk),
    . rst_n(rst_n),
    . input_time(input_time),
	. chinal1_begin(chinal1_en) ,	
	. chinal2_begin(chinal2_en),
    // . chinal3_begin(chinal3_en) ,	
	// . chinal4_begin(chinal4_en),
    . chinal1_out_data(chinal1_out_data),
    . chinal2_out_data(chinal2_out_data)
	// . chinal3_out_data(chinal3_out_data),
    // . chinal4_out_data(chinal4_out_data)
    );

fft_multiper_ifft multipler1(
.clk(clk),
.rst_n(rst_n),
.chinal1_input_real(chinal1_out_data),
.chinal2_input_real(chinal2_out_data),
.chinal1_en(chinal1_en),
.chinal2_en(chinal2_en),

.ifft1_output_img (ifft1_output_img ),
.ifft1_output_real(ifft1_output_real),
.ifft_tlast_cnt(ifft_tlast_cnt),
. ifft1_output_tuser(ifft1_output_tuser),
. multipler_cnt_talst (multipler_cnt_talst ),
.ifft1__input_real(ifft1__input_real),
.ifft1__input_imag(ifft1__input_imag),
.ifft1_output_tvalid(ifft1_output_tvalid),
. ifft_data_tlast(ifft_data_tlast)
    );

 integer n=0;
  integer n1=0;
   integer n2=0;
   


//取abs
always@(posedge clk )
 if((ifft_tlast_cnt==8'd2))//&&(ifft1_output_real[44]==0)
 begin
case(ifft1_output_real[44])
1'b0:abs_viual<=ifft1_output_real;
1'b1:abs_viual<=(~ifft1_output_real+35'd1);//负数归0
endcase
end
else
abs_viual<=0;

always@(posedge clk )
 if((ifft_tlast_cnt==0))//&&(ifft1_output_real[44]==0)
begin
case(ifft1_output_real[44])
1'b0:abs1_viual<=ifft1_output_real;
1'b1:abs1_viual<=(~ifft1_output_real+35'd1);//负数归0
endcase
end
else 
abs1_viual<=0;

always@(posedge clk )
 if((ifft_tlast_cnt==1))//&&(ifft1_output_real[44]==0)
begin
case(ifft1_output_real[44])
1'b0:abs2_viual<=ifft1_output_real;
1'b1:abs2_viual<=(~ifft1_output_real+35'd1);//负数归0
endcase
end
else 
abs2_viual<=0;

// ////////找最大值////


always@(posedge clk)
if((n<4096)&&(!ifft_data_tlast))
begin
n <=n+1;
 if(((ifft_tlast_cnt==8'd2))&&(max_viual<abs_viual)&&(n<1024))//&&(ifft1_output_real[44]==0)
 begin
max_viual<=abs_viual;
max_time<=n;
end
else begin
max_viual<=max_viual;
max_time<=max_time;
    end
end
else begin
max_time<=0;
max_viual<=0;
n<=0;
end

always@(posedge clk)
if((n1<4096)&&(!ifft_data_tlast))
begin
n1 <=n1+1;
 if(((ifft_tlast_cnt==0))&&(max1_viual<abs1_viual)&&(n1<1024))//&&(ifft1_output_real[44]==0)
 begin
max1_viual<=abs1_viual;
max1_time<=n1;
end

else begin
max1_viual<=max1_viual;
max1_time<=max1_time;
    end
end
else begin
max1_time<=0;
max1_viual<=0;
n1<=0;
end

always@(posedge clk)
if((n2<4096)&&(!ifft_data_tlast))
begin
n2 <=n2+1;
 if(((ifft_tlast_cnt==1))&&(max2_viual<abs2_viual)&&(n2<1024))//&&(ifft1_output_real[44]==0)
 begin
max2_viual<=abs2_viual;
max2_time<=n2;
end

else begin
max2_viual<=max2_viual;
max2_time<=max2_time;
    end
end
else begin
max2_time<=0;
max2_viual<=0;
n2<=0;
end

always@(posedge clk or negedge rst_n)
if(!rst_n)  begin
chinal1_time<=0;
end
else if((ifft_tlast_cnt==8'd2)&&(ifft1_output_tuser==4092))//&&(ifft1_output_real[44]==0)
begin
chinal1_time<=max_time;
end

always@(posedge clk or negedge rst_n)
if(!rst_n)  begin
chinal2_time<=0;
end
else if((ifft_tlast_cnt==0)&&(ifft1_output_tuser==4092))//&&(ifft1_output_real[44]==0)
begin
chinal2_time<=max1_time;

end

always@(posedge clk or negedge rst_n)
if(!rst_n)  begin
chinal3_time<=0;
end
else if((ifft_tlast_cnt==1)&&(ifft1_output_tuser==4092))//&&(ifft1_output_real[44]==0)
begin
chinal3_time<=max2_time;
end

endmodule
