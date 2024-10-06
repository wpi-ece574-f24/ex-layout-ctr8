module tb;
   logic [7:0] x;
   logic [7:0] y;
   logic reset;
   logic clk;
   
   timeunit 1ns;
   timeprecision 1ps;

   ctr8 dut(
	    .x(x),
	    .y(y),
	    .reset(reset),
	    .clk(clk)
	    );
      
   always
   begin
      clk = 1'b0;
      #5 clk = 1'b1;
      #5;
   end

   always_ff @(posedge clk)
   begin
      $display("x %d y %d", x, y);
   end

`ifdef USE_SDF
   initial
     begin
	$sdf_annotate("../layout/synout/ctr8_delays.sdf",tb.dut,,"sdf.log","MAXIMUM");
     end
`endif
   
   initial
   begin
      $dumpfile("trace.vcd");
      $dumpvars(0, tb);
      x = 8'b0;
      reset = 1'b1;
      repeat(3)
         @(posedge clk);
      reset = 1'b0;

      x = 8'b1;      
      repeat(256)
        @(posedge clk);

      $finish;
   end
   
endmodule
