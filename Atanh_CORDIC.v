module Atanh_CORDIC(
    input [31:0] x_input,
    input [31:0] y_input,
    output reg [31:0] atanh_output
);


reg [31:0] minus = 32'hBF800000; //3f800000
reg [31:0] plus = 32'h3f800000;
reg [31:0] z_input = 32'h3F0C9EED;


// Iteration 1
reg [31:0] two = 32'h40000000;
wire [31:0] sign1, x1, y1, z1;
wire [31:0] tempx1, tempy1, tempz1;
wire [31:0] interx1, intery1, interz1;

FloatingDivision divx1(y_input, two, interx1);
FloatingDivision divy1(x_input, two, intery1);
FloatingMultiplication mulx1(interx1, minus, tempx1);
FloatingMultiplication muly1(intery1, minus, tempy1);
FloatingAddition addx1(tempx1, x_input, x1);
FloatingAddition addy1(tempy1, y_input, y1);
reg [31:0] lut1 = 32'h3E82C3CA;
sigma sig1(y1, sign1);
FloatingMultiplication mulz1_1(minus, sign1, interz1);
FloatingMultiplication mulz1_2(interz1, lut1, tempz1);
FloatingAddition addz1(tempz1, z_input, z1);

// Iteration 2
reg [31:0] four = 32'h40800000;
wire [31:0] sign2, x2, y2, z2;
wire [31:0] tempx2, tempy2, tempz2;
wire [31:0] interx2, intery2, interz2;

FloatingDivision divx2(y1, four, interx2);
FloatingDivision divy2(x1, four, intery2);
FloatingMultiplication mulx2(interx2, sign1, tempx2);
FloatingMultiplication muly2(intery2, sign1, tempy2);
FloatingAddition addx2(tempx2, x1, x2);
FloatingAddition addy2(tempy2, y1, y2);
reg [31:0] lut2 = 32'h3E00B780;
sigma sig2(y2, sign2);
FloatingMultiplication mulz2_1(minus, sign2, interz2);
FloatingMultiplication mulz2_2(interz2, lut2, tempz2);
FloatingAddition addz2(tempz2, z1, z2);

// Iteration 3
reg [31:0] eight = 32'h41000000;
wire [31:0] sign3, x3, y3, z3;
wire [31:0] tempx3, tempy3, tempz3;
wire [31:0] interx3, intery3, interz3;

FloatingDivision divx3(y2, eight, interx3);
FloatingDivision divy3(x2, eight, intery3);
FloatingMultiplication mulx3(interx3, sign2, tempx3);
FloatingMultiplication muly3(intery3, sign2, tempy3);
FloatingAddition addx3(tempx3, x2, x3);
//FloatingAddition addy3(y2, tempy3, y3);
FloatingAddition addy3(tempy3, y2, y3);
reg [31:0] lut3 = 32'h3D80346E;
sigma sig3(y3, sign3);
FloatingMultiplication mulz3_1(minus, sign3, interz3);
FloatingMultiplication mulz3_2(interz3, lut3, tempz3);
FloatingAddition addz3(tempz3, z2, z3);

// Iteration 4
reg [31:0] sixteen = 32'h41800000;
wire [31:0] sign4, x4, y4, z4;
wire [31:0] tempx4, tempy4, tempz4;
wire [31:0] interx4, intery4, interz4;

FloatingDivision divx4(y3, sixteen, interx4);
FloatingDivision divy4(x3, sixteen, intery4);
FloatingMultiplication mulx4(interx4, sign3, tempx4);
FloatingMultiplication muly4(intery4, sign3, tempy4);
FloatingAddition addx4(tempx4, x3, x4);
FloatingAddition addy4(tempy4, y3, y4);
reg [31:0] lut4 = 32'h3D00346E; // 0.031
sigma sig4(y4, sign4);
FloatingMultiplication mulz4_1(sign4, minus, interz4);
FloatingMultiplication mulz4_2(interz4, lut4, tempz4);
FloatingAddition addz4(tempz4, z3, z4);

// Iteration 5
reg [31:0] thirty_two = 32'h42000000;
wire [31:0] sign5, x5, y5, z5;
wire [31:0] tempx5, tempy5, tempz5;
wire [31:0] interx5, intery5, interz5;

FloatingDivision divx5(y4, thirty_two, interx5);
FloatingDivision divy5(x4, thirty_two, intery5);
FloatingMultiplication mulx5(interx5, sign4, tempx5);
FloatingMultiplication muly5(intery5, sign4, tempy5);
FloatingAddition addx5(tempx5, x4, x5);
FloatingAddition addy5(tempy5, y4, y5);
reg [31:0] lut5 = 32'h3c8002ab;  // 0.0156262717520522113792
sigma sig5(y5, sign5);
FloatingMultiplication mulz5_1(minus, sign5, interz5);
FloatingMultiplication mulz5_2(interz5, lut5, tempz5);
FloatingAddition addz5(tempz5, z4, z5);



// Iteration 6
reg [31:0] sixty_four = 32'h42800000;
wire [31:0] sign6, x6, y6, z6;
wire [31:0] tempx6, tempy6, tempz6;
wire [31:0] interx6, intery6, interz6;

FloatingDivision divx6(y5, sixty_four, interx6);
FloatingDivision divy6(x5, sixty_four, intery6);
FloatingMultiplication mulx6(interx6, sign5, tempx6);
FloatingMultiplication muly6(intery6, sign5, tempy6);
FloatingAddition addx6(tempx6, x5, x6);
FloatingAddition addy6(tempy6, y5, y6);
reg [31:0] lut6 = 32'h3c0000ab; // 0.00781265895154042091032
sigma sig6(y6, sign6);
FloatingMultiplication mulz6_1(sign6, minus, interz6);
FloatingMultiplication mulz6_2(interz6, lut6, tempz6);
FloatingAddition addz6(tempz6, z5, z6);

// Iteration 7
reg [31:0] one_hundred_and_twenty_eight = 32'h43000000;
wire [31:0] sign7, x7, y7, z7;
wire [31:0] tempx7, tempy7, tempz7;
wire [31:0] interx7, intery7, interz7;

FloatingDivision divx7(y6, one_hundred_and_twenty_eight, interx7);
FloatingDivision divy7(x6, one_hundred_and_twenty_eight, intery7);
FloatingMultiplication mulx7(interx7, sign6, tempx7);
FloatingMultiplication muly7(intery7, sign6, tempy7);
FloatingAddition addx7(tempx7, x6, x7);
FloatingAddition addy7(tempy7, y6, y7);
reg [31:0] lut7 = 32'h3b80002b; //0.00390625
sigma sig7(y7, sign7);
FloatingMultiplication mulz7_1(minus, sign7, interz7);
FloatingMultiplication mulz7_2(interz7, lut7, tempz7);
FloatingAddition addz7(tempz7, z6, z7);

// Iteration 8
reg [31:0] two_hundred_and_fifty_six = 32'h43800000;
wire [31:0] sign8, x8, y8, z8;
wire [31:0] tempx8, tempy8, tempz8;
wire [31:0] interx8, intery8, interz8;

FloatingDivision divx8(y7, two_hundred_and_fifty_six, interx8);
FloatingDivision divy8(x7, two_hundred_and_fifty_six, intery8);
FloatingMultiplication mulx8(interx8, sign7, tempx8);
FloatingMultiplication muly8(intery8, sign7, tempy8);
FloatingAddition addx8(tempx8, x7, x8);
FloatingAddition addy8(tempy8, y7, y8);
reg [31:0] lut8 = 32'h3b000000; // 0.001953125
sigma sig8(y8, sign8);
FloatingMultiplication mulz8_1(sign8, minus, interz8);
FloatingMultiplication mulz8_2(interz8, lut8, tempz8);
FloatingAddition addz8(z7, tempz8, z8);

// Iteration 9
reg [31:0] five_hundred_and_twelve = 32'h44000000;
wire [31:0] sign9, x9, y9, z9;
wire [31:0] tempx9, tempy9, tempz9;
wire [31:0] interx9, intery9, interz9;

FloatingDivision divx9(y8, five_hundred_and_twelve, interx9);
FloatingDivision divy9(x8, five_hundred_and_twelve, intery9);
FloatingMultiplication mulx9(interx9, sign8, tempx9);
FloatingMultiplication muly9(intery9, sign8, tempy9);
FloatingAddition addx9(tempx9, x8, x9);
FloatingAddition addy9(tempy9, y8, y9);
reg [31:0] lut9 = 32'h3a800003;   //0.0009765625
sigma sig9(y9, sign9);
FloatingMultiplication mulz9_1(minus, sign9, interz9);
FloatingMultiplication mulz9_2(interz9, lut9, tempz9);
FloatingAddition addz9(tempz9, z8, z9);

// Iteration 10
reg [31:0] one_thousand_and_twenty_four = 32'h44800000;
wire [31:0] sign10, x10, y10, z10;
wire [31:0] tempx10, tempy10, tempz10;
wire [31:0] interx10, intery10, interz10;

FloatingDivision divx10(y9, one_thousand_and_twenty_four, interx10);
FloatingDivision divy10(x9, one_thousand_and_twenty_four, intery10);
FloatingMultiplication mulx10(interx10, sign9, tempx10);
FloatingMultiplication muly10(intery10, sign9, tempy10);
FloatingAddition addx10(tempx10, x9, x10);
FloatingAddition addy10(tempy10, y9, y10);
reg [31:0] lut10 = 32'h3a000001;  //0.00048828125
sigma sig10(y10, sign10);
FloatingMultiplication mulz10_1(sign10, minus, interz10);
FloatingMultiplication mulz10_2(interz10, lut10, tempz10);
FloatingAddition addz10(z9, tempz10, z10);



// Assign atanh_output
always @(*)
begin
    atanh_output <= z10;
end

endmodule

