module Radix_16_8b_cppg(

    input  [7:0] a, b,
    output [15:0] c
);
    wire signed [15:0] pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8 , npp1, npp2, npp3, npp4, npp5, npp6, npp7, npp8;
    wire signed [15:0] ppg [1:0];

    // Booth grouping for radix-16: 4-bit overlapping, 2 LSB extensions
    wire [8:0] booth_group = {b, 1'b0};

    // Generate all partial products
    partial_product_rad16 u_pp (a ,pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8 , npp1, npp2, npp3, npp4, npp5, npp6, npp7, npp8);

    // 16 muxes, each selecting a Booth-encoded partial product
    mux_32X1 m0 (pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8 , npp1, npp2, npp3, npp4, npp5, npp6, npp7, npp8, booth_group[4:0], ppg[0]);
    mux_32X1 m1 (pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8 , npp1, npp2, npp3, npp4, npp5, npp6, npp7, npp8, booth_group[8:4], ppg[1]);
   
    assign c = $signed({ppg[0]}) + $signed({ppg[1],4'b0});

endmodule

// Partial product generator
module partial_product_rad16(
    input  [7:0] a,
    output signed [15:0] p1, p2, p3, p4, p5, p6, p7, p8,
    output signed [15:0] n1, n2, n3, n4, n5, n6, n7, n8
);
    wire signed [15:0] A  = $signed({{8{a[7]}}, a});
    wire signed [15:0] NA = $signed((~{{8{a[7]}}, a}) + 1'b1);

       assign p1 = A;
    assign p2 = {A, 1'b0};
    assign p3 = ({A, 1'b0}) + A;  // 3*A
    assign p4 = {A, 2'b0};        // 4*A

    assign p5 = {A, 2'b0} + A; // 5A
    assign p6 = {A, 2'b0} + {A, 1'b0}; // 6A
    assign p7 = {A, 2'b0} + {A, 1'b0} + A; // 7A
    assign p8 = {A, 3'b0};

       assign n1 = NA;
    assign n2 = {NA, 1'b0};
    assign n3 = ({NA, 1'b0}) + NA;  // 3*A
    assign n4 = {NA, 2'b0};        // 4*A
    assign n5 = {NA, 2'b0} + NA;
    assign n6 = {NA, 2'b0} + {NA, 1'b0};
    assign n7 = {NA, 2'b0} + {NA, 1'b0} + NA;
    assign n8 = {NA, 3'b0};
endmodule


// Radix-16 multiplexer
module mux_32X1 (
    input [15:0] pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8,
    input [15:0] npp1, npp2, npp3, npp4, npp5, npp6, npp7, npp8,
    input [4:0] sel,
    output reg [15:0] out
);
    always @(*) begin
        case (sel)
            5'd0,  5'd31: out = 16'sd0;
            5'd1,  5'd2:  out = pp1;
            5'd3,  5'd4:  out = pp2;
            5'd5,  5'd6:  out = pp3;
            5'd7,  5'd8:  out = pp4;
            5'd9,  5'd10: out = pp5;
            5'd11, 5'd12: out = pp6;
            5'd13, 5'd14: out = pp7;
            5'd15:        out = pp8;
            5'd16:        out = npp8;
            5'd17, 5'd18: out = npp7;
            5'd19, 5'd20: out = npp6;
            5'd21, 5'd22: out = npp5;
            5'd23, 5'd24: out = npp4;
            5'd25, 5'd26: out = npp3;
            5'd27, 5'd28: out = npp2;
            5'd29, 5'd30: out = npp1;
        endcase
    end
endmodule
