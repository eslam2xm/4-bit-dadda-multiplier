`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:18:12 06/22/2020 
// Design Name: 
// Module Name:    Full_adder 
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
module FA(
    input a,
    input b,
    input Cin,
    output Cout,
    output sum
    );
assign sum = a ^ b ^ Cin;
assign Cout = (a&b) | (a^b) & Cin;

endmodule
