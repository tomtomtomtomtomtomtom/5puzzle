`timescale 1ps/1ps


module test;
	reg clk, rst_n;

	top top0(clk, rst_n);

	always #50 clk = ~clk;

	initial begin
		$dumpfile("top_test.vcd");
		$dumpvars(0, top0);
		$dumplimit(300000);
		$monitor($stime, "clk:%b rst: %b", clk, rst_n);
		rst_n = 0;
		clk = 0;
#100
		rst_n = 1;
#300000
	$finish;
	end
endmodule
