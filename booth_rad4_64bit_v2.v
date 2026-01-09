`timescale 1ns / 1ps

module booth_rad4_64bit_v2(
    input  [63:0] a, b,
    output [127:0] c
);

    wire signed [127:0] ppg [31:0];

    wire signed [127:0] pj1, pj2, ipj1, ipj2;
    
    wire signed [127:0] sum [7:0];
    
    wire signed [127:0] sum2 [1:0];
    
    partial_product cppg(a, pj1, pj2, ipj1, ipj2);
    
    mux_4X1 m1(pj1, ipj1, ipj2, b[1:0], ppg[0]);
    
    mux_8X1 m2(pj1, pj2, ipj1, ipj2, b[3:1], ppg[1]);

    mux_8X1 m3(pj1, pj2, ipj1, ipj2, b[5:3], ppg[2]);

    mux_8X1 m4(pj1, pj2, ipj1, ipj2, b[7:5], ppg[3]);
    
    mux_8X1 m5(pj1, pj2, ipj1, ipj2, b[9:7], ppg[4]); 
    
    mux_8X1 m6(pj1, pj2, ipj1, ipj2, b[11:9], ppg[5]);

    mux_8X1 m7(pj1, pj2, ipj1, ipj2, b[13:11], ppg[6]);

    mux_8X1 m8(pj1, pj2, ipj1, ipj2, b[15:13], ppg[7]);
    
    mux_8X1 m9(pj1, pj2, ipj1, ipj2, b[17:15], ppg[8]);

    mux_8X1 m10(pj1, pj2, ipj1, ipj2, b[19:17], ppg[9]);
    
    mux_8X1 m11(pj1, pj2, ipj1, ipj2, b[21:19], ppg[10]);
    
    mux_8X1 m12(pj1, pj2, ipj1, ipj2, b[23:21], ppg[11]);
    
    mux_8X1 m13(pj1, pj2, ipj1, ipj2, b[25:23], ppg[12]);
    
    mux_8X1 m14(pj1, pj2, ipj1, ipj2, b[27:25], ppg[13]);
    
    mux_8X1 m15(pj1, pj2, ipj1, ipj2, b[29:27], ppg[14]);
    
    mux_8X1 m16(pj1, pj2, ipj1, ipj2, b[31:29], ppg[15]);
    
    mux_8X1 m17(pj1, pj2, ipj1, ipj2, b[33:31], ppg[16]);
    
    mux_8X1 m18(pj1, pj2, ipj1, ipj2, b[35:33], ppg[17]);
    
    mux_8X1 m19(pj1, pj2, ipj1, ipj2, b[37:35], ppg[18]);
    
    mux_8X1 m20(pj1, pj2, ipj1, ipj2, b[39:37], ppg[19]);
    
    mux_8X1 m21(pj1, pj2, ipj1, ipj2, b[41:39], ppg[20]);
    
    mux_8X1 m22(pj1, pj2, ipj1, ipj2, b[43:41], ppg[21]);
    
    mux_8X1 m23(pj1, pj2, ipj1, ipj2, b[45:43], ppg[22]);
    
    mux_8X1 m24(pj1, pj2, ipj1, ipj2, b[47:45], ppg[23]);
    
    mux_8X1 m25(pj1, pj2, ipj1, ipj2, b[49:47], ppg[24]);
    
    mux_8X1 m26(pj1, pj2, ipj1, ipj2, b[51:49], ppg[25]);
    
    mux_8X1 m27(pj1, pj2, ipj1, ipj2, b[53:51], ppg[26]);
    
    mux_8X1 m28(pj1, pj2, ipj1, ipj2, b[55:53], ppg[27]);
    
    mux_8X1 m29(pj1, pj2, ipj1, ipj2, b[57:55], ppg[28]);
    
    mux_8X1 m30(pj1, pj2, ipj1, ipj2, b[59:57], ppg[29]);
    
    mux_8X1 m31(pj1, pj2, ipj1, ipj2, b[61:59], ppg[30]);
    
    mux_8X1 m32(pj1, pj2, ipj1, ipj2, b[63:61], ppg[31]);
    
    assign sum[0] = $signed(ppg[0]) + $signed({ppg[1], 2'b0})+ $signed({ppg[2], 4'b0})+ $signed({ppg[3], 6'b0});
    
    assign sum[1] = $signed(ppg[4]) + $signed({ppg[5], 2'b0})+ $signed({ppg[6], 4'b0})+ $signed({ppg[7], 6'b0});
    
    assign sum[2] = $signed(ppg[8]) + $signed({ppg[9], 2'b0})+ $signed({ppg[10], 4'b0})+ $signed({ppg[11], 6'b0});
    
    assign sum[3] = $signed(ppg[12]) + $signed({ppg[13], 2'b0})+ $signed({ppg[14], 4'b0})+ $signed({ppg[15], 6'b0});
    
    assign sum[4] = $signed(ppg[16]) + $signed({ppg[17], 2'b0})+ $signed({ppg[18], 4'b0})+ $signed({ppg[19], 6'b0});
    
    assign sum[5] = $signed(ppg[20]) + $signed({ppg[21], 2'b0})+ $signed({ppg[22], 4'b0})+ $signed({ppg[23], 6'b0});
    
    assign sum[6] = $signed(ppg[24]) + $signed({ppg[25], 2'b0})+ $signed({ppg[26], 4'b0})+ $signed({ppg[27], 6'b0});

    assign sum[7] = $signed(ppg[28]) + $signed({ppg[29], 2'b0})+ $signed({ppg[30], 4'b0})+ $signed({ppg[31], 6'b0});
    
    assign sum2[0] = $signed(sum[0]) + $signed({sum[1], 8'b0}) + $signed({sum[2], 16'b0}) + $signed({sum[3], 24'b0});
    
    assign sum2[1] = $signed(sum[4]) + $signed({sum[5], 8'b0}) + $signed({sum[6], 16'b0}) + $signed({sum[7], 24'b0});
    
    assign c = $signed(sum2[0]) + $signed({sum2[1], 32'b0});
    
endmodule

module partial_product(
    input  [63:0] input1,
    output signed [127:0] pj1, pj2, ipj1, ipj2
);

    wire signed [127:0] sa   = $signed({{2{input1[63]}}, input1});
    
    wire signed [127:0] insa = $signed((~{{2{input1[63]}}, input1}) + 1'b1);

    assign pj1  = sa;             // sign-extended
    
    assign pj2  = {sa, 1'b0};        // 2a = a << 1
    
    assign ipj1 = insa;
    
    assign ipj2 = {insa, 1'b0};

endmodule

module mux_4X1(

    input [127:0] pj1, ipj1, ipj2,

    input [1:0] sel,

    output [127:0] out

);

    reg [127:0] pp;

    always @(*) begin
        case (sel)
            2'b00: pp = 128'sd0;
            2'b01: pp = pj1;
            2'b10: pp = ipj2;
            2'b11: pp = ipj1;
        endcase
    end
    
    assign out = pp;

endmodule

module mux_8X1(

    input [127:0] pj1, pj2, ipj1, ipj2,

    input [2:0] sel,

    output [127:0] out

);

    reg [127:0] pp;

    always @(*) begin
        case (sel)
            3'b000: pp = 128'sd0;
            3'b001: pp = pj1;
            3'b010: pp = pj1;
            3'b011: pp = pj2;
            3'b100: pp = ipj2;
            3'b101: pp = ipj1;
            3'b110: pp = ipj1;
            3'b111: pp = 128'sd0;
        endcase
    end
    
    assign out = pp;

endmodule
