`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/14 21:24:04
// Design Name: 
// Module Name: rom0
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


module rom0(
    input clk,
    input rst_n,
    input [29:0] input_time,
	output  chinal1_begin ,	
	output  chinal2_begin,
	// output  chinal3_begin ,	
	// output  chinal4_begin,
    output [15:0] chinal1_out_data,
    output [15:0] chinal2_out_data
	// output [15:0] chinal3_out_data,
    // output [15:0] chinal4_out_data
    );
 reg chinal1_begin;	
 reg chinal2_begin;
 // reg chinal3_begin ;	
 // reg chinal4_begin;
reg [12:0]addr0=0;
wire [15:0]dout0;
reg [12:0]addr1=0;
wire [15:0]dout1;
// reg [12:0]addr2=0;
// wire [15:0]dout2;
// reg [12:0]addr3=0;
// wire [15:0]dout3;
reg [9:0]time1=0;
reg [9:0]time2=0;
reg [9:0]time3=0;	
reg china2_begin_en=0;
 reg china3_begin_en=0;
 reg china4_begin_en=0;
reg [2:0]addr_cnt;
dist_mem_gen_0 rom_0(
.a(addr0),
.spo(dout0)
);

dist_mem_gen_0 rom_1 (
.a(addr1),
.spo(dout1)
);
// dist_mem_gen_0 rom_2(
// .a(addr2),
 // .spo(dout2)
 // );
// dist_mem_gen_0 rom_3(
// .a(addr3), 
// .spo(dout3)
// );

 always @(posedge clk) begin
	 if((addr0>=0)) 
	 begin
	 chinal1_begin <= 1'b1;	
	 chinal2_begin<= 1'b1;
	 // chinal3_begin <= 1'b1;	
	 // chinal4_begin<= 1'b1;
	 end
	 else begin
	 chinal1_begin <= 1'b0;
	 chinal2_begin <= 1'b0;
	 // chinal3_begin <= 1'b0;
	 // chinal4_begin <= 1'b0;
	 end
 end

 

always @(posedge clk ) begin
if(addr_cnt==0)
begin
 if((addr0==time1)&&(addr0>1))
 china2_begin_en=1;
 end
 else
 china2_begin_en=0;
end 
 
 always @(posedge clk  ) begin
 if(addr_cnt==1)
begin
  if((addr0==time2)&&(addr0>1))
 china3_begin_en=1;
 end
 else
  china3_begin_en=0;
end
 
  always @(posedge clk ) begin
if(addr_cnt==3'd2)
  begin
  if((addr0==time3)&&(addr0>1))
 china4_begin_en=1;
 end
 else
china4_begin_en=0;
 end

 always @(posedge clk or negedge rst_n ) begin
if(!rst_n)
addr0=0;
    else if(addr0<13'd4096) begin
        addr0= addr0 + 1'b1;
      end
    else    begin
        addr0= 0;
    end
end
always@(posedge clk or negedge rst_n )
  if(!rst_n)
addr_cnt=0;
 else if(addr0==13'd4096)
 addr_cnt<=addr_cnt+1'b1;
 else if(addr_cnt>2)
 addr_cnt<=0;


always @(posedge clk or negedge rst_n ) begin
if(!rst_n)
addr1=0;
 else if(((china2_begin_en==1)||(china4_begin_en==1)||(china3_begin_en==1))) 
  addr1= addr1 + 1'b1;
else  begin
  addr1=0;
  end
end

// always @(posedge clk or negedge rst_n ) begin
// if(!rst_n)
// addr1=0;
 // else  if((china3_begin_en==1)&&(addr1<14'd4096)) 
  // addr1= addr1 + 1'b1;
// else  begin
  // addr1=0;
  // end
// end

// always @(posedge clk or negedge rst_n ) begin
// if(!rst_n)
// addr1=0;
// else  if((china4_begin_en==1)&&(addr1<14'd4096)) 
  // addr1= addr1 + 1'b1;
// else  begin
  // addr1=0;
  // end
// end

assign chinal1_out_data=dout0;
assign chinal2_out_data=dout1;
// assign chinal3_out_data=dout2;
// assign chinal4_out_data=dout3;
 
always@(posedge clk )
 begin
 time1<=input_time[9:0];
 time2<=input_time[19:10];
 time3<=input_time[29:20];
end
endmodule
