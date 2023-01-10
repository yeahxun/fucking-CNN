module dsp_multiplier_tb();
    reg signed [7:0] dataa, datab;
    reg signed [7:0] sumin;
    reg clock;
    reg clken;
    reg aclr;
    wire signed [15:0] result;

    dsp_multiplier UUT (
        .dataa(dataa), 
        .datab(datab),
        .sumin(sumin),
        .result(result),
        .clock(clock),
        .clken(clken),
        .aclr(aclr)
    );

    initial begin
        // Stimulus goes here
        dataa = 8'h01;
        datab = 8'h02;
        sumin = 8'h03;
        clken = 1'b1;
        aclr = 1'b0;
        #10 clock = 1'b1;
        #10 clock = 1'b0;
        #10;
    end

    initial
    #100 $finish;

endmodule
