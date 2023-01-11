// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module dsp_multiplier (
    dataa,
    datab,
    result,
    sumin,
    //clock, 
    //clken, 
    aclr 
);
    input [7:0] dataa;
    input [7:0] datab;
    input [7:0] sumin;
    //input clken;
    //input clock;
    input aclr;
    output [15:0] result;

/*    input sumin;
    input clock;
    input clken;
    input aclr;  */
    //wire [15:0] sub_wire0;
    //wire [15:0] result = sub_wire0[15:0];
    //wire [15:0] c;
    //wire [15:0] result;
    //assign result = 0;
    lpm_mult lpm_mult_component (
        .dataa (dataa),
        .datab (datab),
        .result (result),
        .aclr (aclr),
	    //.clken (clken),
	    //.clock (clock),
	    .sum (sumin));

    defparam
		lpm_mult_component.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=1",
		lpm_mult_component.lpm_representation = "SIGNED",
		lpm_mult_component.lpm_type = "lpm_mult",
		lpm_mult_component.lpm_widtha = 8,
		lpm_mult_component.lpm_widthb = 8,
		lpm_mult_component.lpm_widths = 8,
		lpm_mult_component.lpm_widthp = 16;

    //assign result = sub_wire0;


endmodule
