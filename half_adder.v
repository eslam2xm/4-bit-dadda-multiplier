`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:13:09 06/22/2020 
// Design Name: 
// Module Name:    half_adder 
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
module HA(
    input a,
    input b,
    output sum,
    output Cout
    );

assign sum = a ^ b;
assign Cout = a & b;

endmodule
