`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 01:05:45 PM
// Design Name: 
// Module Name: log
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


module log(
input [31:0] u, output [31:0]out
    );
   wire [31:0]x,y,z;
    assign x=1-u;
    assign y=1+u;
    assign out= 2*z;
    Atanh_CORDIC tanh(.x_input(x),
        .y_input(y),
       . atanh_output(z));
     
endmodule
