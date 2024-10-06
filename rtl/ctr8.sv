module ctr8(
    input logic [7:0] x,
    output logic [7:0] y,
    input logic reset,
    input logic clk
);

   timeunit 1ns;
   timeprecision 1ps;
   
   logic [63:0] 	ctr;
   
   always_ff @(posedge clk)
   begin
       if (reset)
	 begin
	    ctr <= 64'hffff_ffff_ffff_ffff;
	 end
       else
	 begin
	    ctr <= ctr + x;
	 end
   end
   
   assign y = ctr[63:56];
   
endmodule
