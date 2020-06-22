`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:31:43 06/22/2020 
// Design Name: 
// Module Name:    multiplier_8bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module multiplier_8bit(
    input [3:0] y,
    input [3:0] x,
	 //input clk,
    output [7:0] out
    );



//************************stage 1 *********************************
wire Z30 , Z21 , s1_ha1_sum , s1_ha1_Cout;
wire Z31 , Z22 , s1_ha2_sum , s1_ha2_Cout;

assign Z30 = x[3] & y[0];
assign Z21 = x[2] & y[1];
assign Z31 = x[3] & y[1];
assign Z22 = x[2] & y[2];
HA s1_ha1 ( .a(Z30) , .b(Z21) , .sum(s1_ha1_sum), .Cout(s1_ha1_Cout));
HA s1_ha2 ( .a(Z31) , .b(Z22) , .sum(s1_ha2_sum), .Cout(s1_ha2_Cout));

//************************stage 2 *********************************


wire Z20 , Z11 , s2_ha1_sum , s2_ha1_Cout;
assign Z20 = x[2] & y[0] ;
assign Z11 = x[1] & y[1] ;
HA s2_ha1 ( .a(Z20) , .b(Z11) , .sum(s2_ha1_sum), .Cout(s2_ha1_Cout));

wire Z12 , Z03 , s2_fa1_sum , s2_fa1_Cout;
assign Z12 = x[1] & y[2];
assign Z03 = x[0] & y[3];
FA s2_fa1 ( .a(s1_ha1_sum), .b(Z12) , .Cin(Z03), .Cout(s2_fa1_Cout), .sum(s2_fa1_sum) );


wire Z13 , s2_fa2_sum , s2_fa2_Cout;
assign Z13 = x[1] & y[3];
FA s2_fa2 ( .a(s1_ha2_sum), .b(s1_ha1_Cout) , .Cin(Z13), .Cout(s2_fa2_Cout), .sum(s2_fa2_sum) );


wire Z32 , Z23 , s2_fa3_sum , s2_fa3_Cout ;

assign Z32 = x[3] & y[2];
assign Z23 = x[1] & x[2];
FA s2_fa3 ( .a(Z32), .b(s1_ha2_Cout) , .Cin(Z13), .Cout(s2_fa3_Cout), .sum(s2_fa3_sum) );

//************************stage 2 *********************************

wire Z00, Z01, Z10, Z02, Z33;
assign Z00 = x[0] & y[0];
assign Z01 = x[0] & y[1];
assign Z10 = x[1] & y[0];
assign Z02 = x[0] & y[2];
assign Z33 = x[3] & y[3];


wire [6:0] s3_a;
wire [6:0] s3_b;

assign s3_a = { Z33, s2_fa3_sum , s2_fa2_sum , s2_fa1_sum , s2_ha1_sum , Z10 , Z00 };
assign s3_b = { s2_fa3_Cout , s2_fa2_Cout , s2_fa1_Cout , s2_fa1_Cout , Z02 , Z01 , 1'b0 };


assign out = s3_a + s3_b ;

endmodule
