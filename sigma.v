`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2024 13:49:14
// Design Name: 
// Module Name: sigma
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


module sigma(
    input [31:0] y,
    output reg [31:0] symbol
);

always @(*) begin
    if (y[31] == 1'b1) // If y is -ve
        symbol = 32'h3f800000; // +1
    else if (y[31] == 1'b0) // If y is +ve
        symbol = 32'hbf800000; // -1
  
end


endmodule

